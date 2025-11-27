unit cSettingsPreset;

interface

uses
  cUtils;

type
  TSettingsPreset = class
    private
      //name formatting for json serializer purposes
      text_prefix : string;
      text_suffix : string;
      wrap_mode   : TWrapModeType;
      code_align  : Boolean;
      start_line  : string;
      end_line    : string;
    public
      property Prefix      : string           read text_prefix write text_prefix;
      property Suffix      : string           read text_suffix write text_suffix;
      property Mode        : TWrapModeType    read wrap_mode   write wrap_mode;
      property IsCodeAlign : Boolean          read code_align  write code_align;
      property StartLine   : string           read start_line  write start_line;
      property EndLine     : string           read end_line    write end_line;

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
  text_prefix := '';
  text_suffix := '';
  wrap_mode   := wmtAdd;
  code_align  := False;
  start_line  := '';
  end_line    := '';
end;

end.

