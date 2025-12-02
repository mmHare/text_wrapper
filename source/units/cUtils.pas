unit cUtils;

interface

function SaveToLog(pMessage : string) : Boolean;


implementation

uses
  SysUtils, IOUtils, cConst;

function SaveToLog(pMessage : string) : Boolean;
var
  logLine, filePath, fileName : string;
  logDate : TDateTime;
begin
  Result := True;

  try
    logDate := Now;
    logLine := Format('[%s] - %s', [FormatDateTime('hh:MM:ss', logDate), pMessage]) + sLineBreak;

    filePath := TPath.Combine(ExtractFilePath(ParamStr(0)), LOG_DIRECTORY);
    TDirectory.CreateDirectory(filePath);

    fileName := FormatDateTime('yyyy-mm-dd', logDate) + '.log';
    filePath := TPath.Combine(filePath, fileName);

    TFile.AppendAllText(filePath, logLine);
  except
    Result := False;
  end;
end;

end.
