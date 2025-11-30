unit cSettingsPreset;

interface

uses
  cUtils;

type
  TSettingsPreset = class
    private
      //name formatting for json serializer purposes
      preset_id   : Integer;
      preset_name : string;
      text_prefix : string;
      text_suffix : string;
      wrap_mode   : TWrapModeType;
      code_align  : Boolean;
      start_line  : string;
      end_line    : string;
    public
      property Id          : Integer          read preset_id   write preset_id;
      property PresetName  : string           read preset_name write preset_name;
      property Prefix      : string           read text_prefix write text_prefix;
      property Suffix      : string           read text_suffix write text_suffix;
      property Mode        : TWrapModeType    read wrap_mode   write wrap_mode;
      property IsCodeAlign : Boolean          read code_align  write code_align;
      property StartLine   : string           read start_line  write start_line;
      property EndLine     : string           read end_line    write end_line;

      procedure SetDefault;
      procedure AssignValues(pSource : TSettingsPreset);

      constructor Create;
  end;

implementation

{ TSettingsPreset }

procedure TSettingsPreset.AssignValues(pSource: TSettingsPreset);
begin
//  preset_id   := pSource.preset_id;
  preset_name := pSource.preset_name;
  text_prefix := pSource.text_prefix;
  text_suffix := pSource.text_suffix;
  wrap_mode   := pSource.wrap_mode;
  code_align  := pSource.code_align;
  start_line  := pSource.start_line;
  end_line    := pSource.end_line;
end;

constructor TSettingsPreset.Create;
begin
  inherited Create;

  SetDefault;
end;

procedure TSettingsPreset.SetDefault;
begin
  preset_id   := -1;
  preset_name := 'Preset';
  text_prefix := '';
  text_suffix := '';
  wrap_mode   := wmtAdd;
  code_align  := False;
  start_line  := '';
  end_line    := '';
end;

end.

