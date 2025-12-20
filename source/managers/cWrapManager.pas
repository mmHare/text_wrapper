unit cWrapManager;

interface

uses
  Classes, cSettingsPreset, cTypes;

type
  TWrapManager = class
    public
      class function NormalizeTab(pStr: string; pTabSize: Integer; pMode: TTabMode = tmExpand) : string;

      class procedure PerformWrapAdd(pPreset: TSettingsPreset; pLines: TStringList);
      class procedure PerformWrapRemove(pPreset: TSettingsPreset; pLines: TStringList);

      class procedure ConvertText(pPreset: TSettingsPreset; pLines: TStringList);
      class function ConvertFile(pPreset: TSettingsPreset; pFilePath: string): Boolean;
  end;

implementation

uses
  SysUtils, StrUtils, cUtils, IOUtils;

{ TWrapManager }

class function TWrapManager.ConvertFile(pPreset: TSettingsPreset; pFilePath: string): Boolean;
var
  pathOut: string;
  strList: TStringList;
begin
  Result := False;
  if not FileExists(pFilePath) then Exit;

  strList := TStringList.Create;
  try
    try
      strList.LoadFromFile(pFilePath);
      ConvertText(pPreset, strList);

      //  get path for output - file name with added '_out'
      pathOut := TPath.Combine(
           TPath.GetDirectoryName(pFilePath),
           TPath.GetFileNameWithoutExtension(pFilePath) + '_out' +
           TPath.GetExtension(pFilePath)
         );

      strList.SaveToFile(pathOut);
      Result := FileExists(pathOut);
    except
      on E: Exception do
      begin
        SaveToLog('Error while converting text: ' + E.Message);
        Result := False;
      end
    end;
  finally
    strList.Free;
  end;
end;

class procedure TWrapManager.ConvertText(pPreset: TSettingsPreset; pLines: TStringList);
begin
  case pPreset.Mode of
       wmtAdd : PerformWrapAdd(pPreset, pLines);
    wmtRemove : PerformWrapRemove(pPreset, pLines);
  end;
end;

class function TWrapManager.NormalizeTab(pStr: string; pTabSize: Integer; pMode: TTabMode = tmExpand): string;
var
  I, col, nextStop, spaces, countSpaces: Integer;
  sb: TStringBuilder;
  ch: Char;
begin
  if pTabSize <= 0 then Exit(pStr);

  sb := TStringBuilder.Create(Length(pStr)*2);
  try
    col := 0;
    I := 1;

    while I <= Length(pStr) do
    begin
      ch := pStr[I];

      case pMode of
        tmExpand:
          begin
            if ch = #9 then
            begin
              nextStop := ((col div pTabSize) + 1) * pTabSize;
              spaces := nextStop - col;
              sb.Append(StringOfChar(' ', spaces));
              col := nextStop;
            end
            else
            begin
              sb.Append(ch);
              Inc(col);
            end;
            Inc(I);
          end;

        tmCompress:  // leading spaces -> tab; not yet implemented
          begin
            if (col = 0) and (ch = ' ') then
            begin
              countSpaces := 0;
              while (I <= Length(pStr)) and (pStr[I] = ' ') do
              begin
                Inc(countSpaces);
                Inc(I);
              end;

              sb.Append(StringOfChar(#9, countSpaces div pTabSize));
              sb.Append(StringOfChar(' ', countSpaces mod pTabSize));
              col := sb.Length;  // update indent column
            end
            else if ch = #9 then
            begin
              sb.Append(#9);
              nextStop := ((col div pTabSize) + 1) * pTabSize;
              col := nextStop;
              Inc(I);
            end
            else
            begin
              sb.Append(ch);
              Inc(col);
              Inc(I);
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

  // REPLACE TAB CHAR
  for var I := 0 to pLines.Count - 1 do
    pLines[I] := NormalizeTab(pLines[I], Ord(pPreset.TabStopConvert));

  // calculate max line length
  lineLength := 0;
  if pPreset.IsCodeAlign then
  begin
    for S in pLines do
    begin
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
    for var I := 0 to pLines.Count - 1 do
    begin
      S := pLines[I];

      // QUOTATION MARKS
      case pPreset.QuotationType of
        qtSingled: S := StringReplace(S, '''''', '''', [rfReplaceAll]);
        qtDoubled: S := StringReplace(S, '''', '''''', [rfReplaceAll]);
      end;

      // TRIM
      if pPreset.TrimMode in [tmtLeft, tmtBoth] then S := TrimLeft(S);
      if pPreset.TrimMode in [tmtRight, tmtBoth] then S := TrimRight(S);

      // CODE ALIGN
      if pPreset.IsCodeAlign then //fill with spaces
      begin
        x := lineLength - Length(S);
        if x > 0 then S := S + StringOfChar(' ', x);
      end;

      pLines[I] := pPreset.Prefix + S + pPreset.Suffix;
    end;

    // START/END LINES
    if pPreset.IsStartLineEnabled and (pPreset.StartLine <> '') then pLines.Insert(0, pPreset.StartLine);
    if pPreset.IsEndLineEnabled   and (pPreset.EndLine <> '')   then pLines.Add(pPreset.EndLine);

  except
    on E: Exception do
    begin
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
    if pPreset.IsStartLineEnabled then
    begin
      // check if start line exists in lines and get its index
      lineIndex := -1;
      for var I := 0 to pLines.Count - 1 do
      begin
        if Trim(pLines[I]) = '' then Continue;
        if Trim(pLines[I]) = pPreset.StartLine then lineIndex := I;
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
        if Trim(pLines[I]) = pPreset.EndLine then lineIndex := I;
        Break;
      end;
      // delete end line and empty lines after
      if lineIndex > -1 then
        for var I := pLines.Count - 1 downto lineIndex do pLines.Delete(I);
    end;

    // REPLACE TAB CHAR
    for var I := 0 to pLines.Count - 1 do
      pLines[I] := NormalizeTab(pLines[I], Ord(pPreset.TabStopConvert));

    // TEXT CONVERSION
    for var I := 0 to pLines.Count - 1 do
    begin
      S := pLines[I];

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
    on E: Exception do
    begin
      SaveToLog('Error while converting text: ' + E.Message);
    end
  end;
end;

end.
