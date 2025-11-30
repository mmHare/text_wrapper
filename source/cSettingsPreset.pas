unit cSettingsPreset;

interface

uses
  cUtils;

type
  TSettingsPreset = class
    private
      //name formatting for json serializer purposes
      preset_id         : Integer;
      preset_name       : string;
      text_prefix       : string;
      text_suffix       : string;
      wrap_mode         : TWrapModeType;
      code_align        : Boolean;
      start_line        : string;
      enable_start_line : Boolean;
      end_line          : string;
      enable_end_line   : Boolean;
    public
      property Id                 : Integer          read preset_id         write preset_id;
      property PresetName         : string           read preset_name       write preset_name;
      property Prefix             : string           read text_prefix       write text_prefix;
      property Suffix             : string           read text_suffix       write text_suffix;
      property Mode               : TWrapModeType    read wrap_mode         write wrap_mode;
      property IsCodeAlign        : Boolean          read code_align        write code_align;
      property StartLine          : string           read start_line        write start_line;
      property IsStartLineEnabled : Boolean          read enable_start_line write enable_start_line;
      property EndLine            : string           read end_line          write end_line;
      property IsEndLineEnabled   : Boolean          read enable_end_line   write enable_end_line;

      procedure SetDefault;
      procedure AssignValues(pSource : TSettingsPreset);

      constructor Create;
  end;

implementation

{ TSettingsPreset }

procedure TSettingsPreset.AssignValues(pSource: TSettingsPreset);
begin
//  preset_id   := pSource.preset_id;
  preset_name       := pSource.PresetName;
  text_prefix       := pSource.Prefix;
  text_suffix       := pSource.Suffix;
  wrap_mode         := pSource.Mode;
  code_align        := pSource.IsCodeAlign;
  start_line        := pSource.StartLine;
  enable_start_line := pSource.IsStartLineEnabled;
  end_line          := pSource.EndLine;
  enable_end_line   := pSource.IsEndLineEnabled;
end;

constructor TSettingsPreset.Create;
begin
  inherited Create;

  SetDefault;
end;

procedure TSettingsPreset.SetDefault;
begin
  preset_id         := -1;
  preset_name       := 'Preset';
  text_prefix       := '';
  text_suffix       := '';
  wrap_mode         := wmtAdd;
  code_align        := False;
  start_line        := '';
  enable_start_line := True;
  end_line          := '';
  enable_end_line   := True;
end;

end.

