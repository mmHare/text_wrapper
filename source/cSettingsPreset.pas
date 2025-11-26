unit cSettingsPreset;

interface

uses
  cUtils;

type
  TSettingsPreset = class
    private
      FPrefix      : string;
      FSuffix      : string;
      FMode        : TWrapModeType;
      FIsCodeAlign : Boolean;
      FStartLine   : string;
      FEndLine     : string;
    public
      property Prefix      : string           read FPrefix      write FPrefix;
      property Suffix      : string           read FSuffix      write FSuffix;
      property Mode        : TWrapModeType    read FMode        write FMode;
      property IsCodeAlign : Boolean          read FIsCodeAlign write FIsCodeAlign;
      property StartLine   : string           read FStartLine   write FStartLine;
      property EndLine     : string           read FEndLine     write FEndLine;

      procedure SetDefault;

      constructor Create;
  end;

implementation

{ TSettingsPreset }

constructor TSettingsPreset.Create;
begin
  inherited Create;

  SetDefault;
end;

procedure TSettingsPreset.SetDefault;
begin
  FPrefix       := '';
  FSuffix       := '';
  FMode         := wmtAdd;
  FIsCodeAlign  := False;
  FStartLine    := '';
  FEndLine      := '';





end;

end.
