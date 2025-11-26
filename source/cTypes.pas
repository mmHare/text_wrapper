unit cTypes;

interface

type
  TWrapModeType = (wmtAdd, wmtRemove);

  RSettingsPreset = record
    Prefix      : string;
    Suffix      : string;
    Mode        : TWrapModeType;
    IsCodeAlign : Boolean;
    StartLine   : string;
    EndLine     : string;
  end;

function SaveToLog(pMessage : string) : Boolean;

implementation

function SaveToLog(pMessage : string) : Boolean;
begin
  Result := True;
  //TODO: implement save logs
end;

end.
