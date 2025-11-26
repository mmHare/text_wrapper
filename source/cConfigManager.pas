unit cConfigManager;

interface

uses
  cTypes;

const
  CONFIG_FILE_NAME = 'settings.json';

type
  TConfigManager = class
    private
      FSettingsPreset : RSettingsPreset;


    public
      property SettingsPreset : RSettingsPreset read FSettingsPreset write FSettingsPreset;

      procedure SetDefault;
      procedure SaveConfigToFile;
      procedure LoadConfigFromFile;

      constructor Create;
  end;

implementation

uses
  JSON, SysUtils, IOUtils;

{ TConfigManager }

constructor TConfigManager.Create;
begin
  SetDefault;

  LoadConfigFromFile;
end;

procedure TConfigManager.LoadConfigFromFile;
var RootObject, tmpObject : TJSONObject;
    presetList : TJSONArray;
    jsonStr : string;
begin
  try
    if not FileExists(CONFIG_FILE_NAME) then begin
      SaveConfigToFile;
      Exit;
    end;

    jsonStr := TFile.ReadAllText(CONFIG_FILE_NAME, TEncoding.UTF8);
    RootObject := TJSONObject.ParseJSONValue(jsonStr) as TJSONObject;

    try
      presetList := RootObject.GetValue<TJSONArray>('presets');

      for var I := 0 to presetList.Count - 1 do begin
        tmpObject := presetList.Items[I] as TJSONObject;

        with FSettingsPreset do begin
          Prefix      := tmpObject.GetValue<string>('prefix');
          Suffix      := tmpObject.GetValue<string>('suffix');
          Mode        := TWrapModeType(tmpObject.GetValue<Integer>('mode'));
          IsCodeAlign := tmpObject.GetValue<Boolean>('code_align');
          StartLine   := tmpObject.GetValue<string>('start_line');
          EndLine     := tmpObject.GetValue<string>('end_line');
        end;
      end;
    finally
      RootObject.Free;
    end;
  except
    on E: Exception do begin
        SaveToLog('Error while reading config file: ' + E.Message);
      end;
  end;
end;

procedure TConfigManager.SaveConfigToFile;
var RootObject, tmpObject : TJSONObject;
    tmpArray : TJSONArray;
    jsonStr : string;
begin
  RootObject := TJSONObject.Create;
  try
    try
      tmpArray := TJSONArray.Create;

      tmpObject := TJSONObject.Create;
//      tmpObject.AddPair('name', 'preset_0');
      tmpObject.AddPair('prefix', FSettingsPreset.Prefix);
      tmpObject.AddPair('suffix', FSettingsPreset.Suffix);
      tmpObject.AddPair('mode', Ord(FSettingsPreset.Mode));
      tmpObject.AddPair('code_align', FSettingsPreset.IsCodeAlign);
      tmpObject.AddPair('start_line', FSettingsPreset.StartLine);
      tmpObject.AddPair('end_line', FSettingsPreset.EndLine);

      tmpArray.AddElement(tmpObject);

//      RootObject.AddPair('preset_0', tmpObject);

      RootObject.AddPair('presets', tmpArray);

      jsonStr := RootObject.Format();

      TFile.WriteAllText(CONFIG_FILE_NAME, JsonStr, TEncoding.UTF8);
    except
      on E: Exception do begin
        SaveToLog('Error while saving config file: ' + E.Message);
      end;
    end;
  finally
    RootObject.Free;
  end;
end;

procedure TConfigManager.SetDefault;
begin
  with FSettingsPreset do begin
    Prefix      := '';
    Suffix      := '';
    Mode        := wmtAdd;
    IsCodeAlign := False;
    StartLine   := '';
    EndLine     := '';
  end;
end;

end.
