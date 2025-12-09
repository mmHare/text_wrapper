unit cWrapManager;

interface

uses
  Classes, cSettingsPreset, cTypes;

type
  TWrapManager = class
    public
      class function TabStopReplace(pStr : string; pMode : TTabStopConvertType) : string;

      class function NormalizeTab(S: string; TabSize: Integer; Mode: TTabMode) : string;

      class procedure PerformWrapAdd(pPreset: TSettingsPreset; pLines: TStringList);
      class procedure PerformWrapRemove(pPreset: TSettingsPreset; pLines: TStringList);

      class procedure ConvertText(pPreset: TSettingsPreset; pLines: TStringList);
  end;

implementation

uses
  SysUtils, StrUtils, cUtils;

{ TWrapManager }

class procedure TWrapManager.ConvertText(pPreset: TSettingsPreset; pLines: TStringList);
begin
  case pPreset.Mode of
       wmtAdd : PerformWrapAdd(pPreset, pLines);
    wmtRemove : PerformWrapRemove(pPreset, pLines);
  end;
end;

class function TWrapManager.NormalizeTab(S: string; TabSize: Integer; Mode: TTabMode): string;
var
  i, col, nextStop, spaces, countSpaces: Integer;
  sb: TStringBuilder;
  ch: Char;
begin
  sb := TStringBuilder.Create(Length(S)*2);
  try
    col := 0;
    i := 1;

    while i <= Length(S) do
    begin
      ch := S[i];

      case Mode of
        tmExpand:
          begin
            if ch = #9 then
            begin
              nextStop := ((col div TabSize) + 1) * TabSize;
              spaces := nextStop - col;
              sb.Append(StringOfChar(' ', spaces));
              col := nextStop;
            end
            else
            begin
              sb.Append(ch);
              Inc(col);
            end;
            Inc(i);
          end;

        tmCompress:
          begin
            // Convert only LEADING spaces → tabs+spaces
            if (col = 0) and (ch = ' ') then
            begin
              countSpaces := 0;
              while (i <= Length(S)) and (S[i] = ' ') do
              begin
                Inc(countSpaces);
                Inc(i);
              end;

              sb.Append(StringOfChar(#9, countSpaces div TabSize));
              sb.Append(StringOfChar(' ', countSpaces mod TabSize));
              col := sb.Length;  // update indent column
            end
            else if ch = #9 then
            begin
              sb.Append(#9);
              nextStop := ((col div TabSize) + 1) * TabSize;
              col := nextStop;
              Inc(i);
            end
            else
            begin
              sb.Append(ch);
              Inc(col);
              Inc(i);
            end;
          end;
      end;
    end;

    Result := sb.ToString;
  finally
    sb.Free;
  end;
end;

class procedure TWrapManager.PerformWrapAdd(pPreset: TSettingsPreset; pLines: TStringList);
var
  lineLength, x : Integer;
  S, strTmp : string;
begin
  if pLines.Count = 0 then Exit;

  // calculate max line length
  lineLength := 0;
  if pPreset.IsCodeAlign then begin
    for S in pLines do begin
      case pPreset.QuotationType of
        qtSingled: strTmp := StringReplace(S, '''''', '''', [rfReplaceAll]);
        qtDoubled: strTmp := StringReplace(S, '''', '''''', [rfReplaceAll]);
      else strTmp := S;
      end;

      if Length(strTmp) > lineLength then lineLength := Length(strTmp);
    end;
  end;

  // TEXT CONVERSION
  try
    for var I := 0 to pLines.Count - 1 do begin
      S := pLines[I];

      // REPLACE TAB CHAR
      S := TabStopReplace(S, pPreset.TabStopConvert);


      // QUOTATION MARKS
      case pPreset.QuotationType of
        qtSingled: S := StringReplace(S, '''''', '''', [rfReplaceAll]);
        qtDoubled: S := StringReplace(S, '''', '''''', [rfReplaceAll]);
      end;

      // TRIM
      if pPreset.TrimMode in [tmtLeft, tmtBoth] then S := TrimLeft(S);
      if pPreset.TrimMode in [tmtRight, tmtBoth] then S := TrimRight(S);

      // CODE ALIGN
      if pPreset.IsCodeAlign then begin  //fill with spaces
        x := lineLength - Length(S);
        if x > 0 then S := S + StringOfChar(' ', x);
      end;

      pLines[I] := pPreset.Prefix + S + pPreset.Suffix;
    end;

    // START/END LINES
    if pPreset.IsStartLineEnabled and (pPreset.StartLine <> '') then pLines.Insert(0, pPreset.StartLine);
    if pPreset.IsEndLineEnabled   and (pPreset.EndLine <> '')   then pLines.Add(pPreset.EndLine);

  except
    on E: Exception do begin
      SaveToLog('Error while converting text: ' + E.Message);
    end
  end;
end;

class procedure TWrapManager.PerformWrapRemove(pPreset: TSettingsPreset; pLines: TStringList);
var
  S : string;
  lineIndex : Integer;
begin
  if pLines.Count = 0 then Exit;

  try
    // START LINE
    if pPreset.IsStartLineEnabled then begin
      // check if start line exists in lines and get its index
      lineIndex := -1;
      for var I := 0 to pLines.Count - 1 do begin
        if Trim(pLines[I]) = '' then Continue;
        if pLines[I] = pPreset.StartLine then lineIndex := I;
        Break;
      end;
      // delete start line and empty lines before
      if lineIndex > -1 then
        for var I := lineIndex downto 0 do pLines.Delete(I);
    end;

    // END LINE
    if pPreset.IsEndLineEnabled then begin
      // check if end line exists in lines and get its index
      lineIndex := -1;
      for var I := pLines.Count - 1 downto 0 do begin
        if Trim(pLines[I]) = '' then Continue;
        if pLines[I] = pPreset.EndLine then lineIndex := I;
        Break;
      end;
      // delete end line and empty lines after
      if lineIndex > -1 then
        for var I := pLines.Count - 1 downto lineIndex do pLines.Delete(I);
    end;

    // TEXT CONVERSION
    for var I := 0 to pLines.Count - 1 do begin
      S := pLines[I];

      // REPLACE TAB CHAR
      S := TabStopReplace(S, pPreset.TabStopConvert);

      // OUTER TRIM
      if StartsStr(TrimLeft(pPreset.Prefix), TrimLeft(S)) then S := TrimLeft(S);    //remove whitespaces before preset
      if EndsStr(TrimRight(pPreset.Suffix), TrimRight(S)) then S := TrimRight(S);    //remove whitespaces after suffix

      // PREFIX/SUFFIX
      if StartsStr(Trim(pPreset.Prefix), S) then Delete(S, 1, Length(pPreset.Prefix));
      if EndsStr(pPreset.Suffix, S) then Delete(S, Length(S) - Length(pPreset.Suffix) + 1, Length(pPreset.Suffix));

      // QUOTATION MARKS
      case pPreset.QuotationType of
        qtSingled: S := StringReplace(S, '''''', '''', [rfReplaceAll]);
        qtDoubled: S := StringReplace(S, '''', '''''', [rfReplaceAll]);
      end;

      // TRIM
      if pPreset.TrimMode in [tmtLeft, tmtBoth] then S := TrimLeft(S);
      if pPreset.TrimMode in [tmtRight, tmtBoth] then S := TrimRight(S);

      pLines[I] := S;
    end;
  except
    on E: Exception do begin
      SaveToLog('Error while converting text: ' + E.Message);
    end
  end;
end;

class function TWrapManager.TabStopReplace(pStr: string; pMode: TTabStopConvertType): string;
begin
  case pMode of
//    tsctOff: Result := pStr;
//    tsctAuto:
//      begin
//        Result := pStr;
//      end;
    tsct2sp, tsct3sp, tsct4sp:
      begin
        Result := NormalizeTab(pStr, Ord(pMode), tmExpand);

//      Result := StringReplace(pStr, '\t', StringOfChar(' ', Ord(pMode)), [rfReplaceAll]);
      end
  else Result := pStr;
  end;
end;

end.
