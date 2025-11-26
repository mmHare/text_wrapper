unit cUtils;

interface

type
  TWrapModeType = (wmtAdd, wmtRemove);

function SaveToLog(pMessage : string) : Boolean;

implementation

function SaveToLog(pMessage : string) : Boolean;
begin
  Result := True;
  //TODO: implement save logs
end;

end.
