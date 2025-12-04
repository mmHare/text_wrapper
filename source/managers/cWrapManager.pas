unit cWrapManager;

interface

uses
  Classes, cSettingsPreset;

type
  TWrapManager = class
    public

    class procedure PerformWrapAdd(pPreset: TSettingsPreset; pLines: TStringList);
    class procedure PerformWrapRemove(pPreset: TSettingsPreset; pLines: TStringList);

    class procedure ConvertText(pPreset: TSettingsPreset; pLines: TStringList);
  end;

implementation

uses
  SysUtils, StrUtils, cTypes, cUtils;

{ TWrapManager }

class procedure TWrapManager.ConvertText(pPreset: TSettingsPreset; pLines: TStringList);
begin
  case pPreset.Mode of
       wmtAdd : PerformWrapAdd(pPreset, pLines);
    wmtRemove : PerformWrapRemove(pPreset, pLines);
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

end.
