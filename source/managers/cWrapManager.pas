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
  S : string;
begin
  if pLines.Count = 0 then Exit;

  lineLength := 0;
  for S in pLines do if Length(S) > lineLength then lineLength := Length(S);

  try
    for var I := 0 to pLines.Count - 1 do begin
      S := pLines[I];
//      S := StringReplace(S, '''', '''''', [rfReplaceAll]);  //doubled single quotas  //TODO: add cmb option

      if pPreset.IsCodeAlign then  begin  //fill with spaces
        x := lineLength - Length(S);
        if x > 0 then S := S + StringOfChar(' ', x);
      end;

      pLines[I] := pPreset.Prefix + S + pPreset.Suffix;
    end;

     //add starting and finishing lines
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
begin
  if pLines.Count = 0 then Exit;

  try
    //TODO: add option or abandon?
//    for var I := strList.Count - 1 downto 0 do begin
//      if (Trim(strList[I]) = '') then strList.Delete(I)
//      else if strList[I] = edtEndLine.Text then begin   //delete ending line
//        strList.Delete(I);
//        Break
//      end;
//    end;
//    for var I := 0 to strList.Count - 1 do begin
//      if strList[I] = edtStartLine.Text then begin
//        for var J := I downto 0 do strList.Delete(J);     //delete beginning line
//        Break;
//      end;
//    end;

    for var I := 0 to pLines.Count - 1 do begin
      S := pLines[I];
      if StartsStr(Trim(pPreset.Prefix), Trim(S)) then S := Trim(S);

      if StartsStr(Trim(pPreset.Prefix), S) then Delete(S, 1, Length(Trim(pPreset.Prefix)));
      if EndsStr(pPreset.Suffix, S) then Delete(S, Length(S) - Length(pPreset.Suffix) + 1, Length(pPreset.Suffix));
//      S := StringReplace(S, '''''', '''', [rfReplaceAll]);  //un-double single quotas   //TODO: add cmb option

      S := TrimRight(S);
      pLines[I] := S;
    end;
  except
    on E: Exception do begin
      SaveToLog('Error while converting text: ' + E.Message);
    end
  end;
end;

end.
