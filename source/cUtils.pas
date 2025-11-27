unit cUtils;

interface

type
  TWrapModeType = (wmtAdd, wmtRemove);

function SaveToLog(pMessage : string) : Boolean;


const
  CONFIG_FILE_NAME = 'settings.json';
  PRESET_NUMBER = 3;

implementation

function SaveToLog(pMessage : string) : Boolean;
begin
  Result := True;
  //TODO: implement save logs
end;

end.
