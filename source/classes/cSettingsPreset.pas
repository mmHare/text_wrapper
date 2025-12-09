unit cSettingsPreset;

interface

uses
  cTypes;

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
      trim_mode         : TTrimModeType;
      quotation_type    : TQuotationType;
      tab_convert       : TTabSizeType;
    public
      property Id                 : Integer             read preset_id         write preset_id;
      property PresetName         : string              read preset_name       write preset_name;
      property Prefix             : string              read text_prefix       write text_prefix;
      property Suffix             : string              read text_suffix       write text_suffix;
      property Mode               : TWrapModeType       read wrap_mode         write wrap_mode;
      property IsCodeAlign        : Boolean             read code_align        write code_align;
      property StartLine          : string              read start_line        write start_line;
      property IsStartLineEnabled : Boolean             read enable_start_line write enable_start_line;
      property EndLine            : string              read end_line          write end_line;
      property IsEndLineEnabled   : Boolean             read enable_end_line   write enable_end_line;
      property TrimMode           : TTrimModeType       read trim_mode         write trim_mode;
      property QuotationType      : TQuotationType      read quotation_type    write quotation_type;
      property TabStopConvert     : TTabSizeType        read tab_convert       write tab_convert;

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
  trim_mode         := pSource.TrimMode;
  quotation_type    := pSource.QuotationType;
  tab_convert       := pSource.TabStopConvert;
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
  trim_mode         := tmtNone;
  quotation_type    := qtOff;
  tab_convert       := tsctOff;
end;

end.

