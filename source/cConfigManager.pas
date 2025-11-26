unit cConfigManager;

interface

uses
  Generics.Collections, cUtils, cSettingsPreset;

const
  CONFIG_FILE_NAME = 'settings.json';

type
  TConfigManager = class
    private
//      FSettingsPreset : TSettingsPreset;

      FPresetList : TList<TSettingsPreset>;
      FPresetNumber : Integer;
    public
//      property SettingsPreset : TSettingsPreset read FSettingsPreset write FSettingsPreset;
      property PresetList : TList<TSettingsPreset> read FPresetList write FPresetList;

      procedure SetDefault;
      procedure SaveConfigToFile;
      procedure LoadConfigFromFile;

      destructor Destroy; override;
      constructor Create;
  end;

implementation

uses
  JSON, SysUtils, IOUtils;

{ TConfigManager }

constructor TConfigManager.Create;
begin
  FPresetList := TList<TSettingsPreset>.Create;
  FPresetNumber := 3;

  SetDefault;

  LoadConfigFromFile;
end;

destructor TConfigManager.Destroy;
begin
  FreeAndNil(FPresetList);

  inherited;
end;

procedure TConfigManager.LoadConfigFromFile;
var RootObject, tmpObject : TJSONObject;
    presetListTmp : TJSONArray;
    jsonStr : string;
    presetTmp : TSettingsPreset;
begin
  try
    if not FileExists(CONFIG_FILE_NAME) then begin
      SaveConfigToFile;
      Exit;
    end;

    jsonStr := TFile.ReadAllText(CONFIG_FILE_NAME, TEncoding.UTF8);
    RootObject := TJSONObject.ParseJSONValue(jsonStr) as TJSONObject;

    //TODO: file data validation

    try
      presetListTmp := RootObject.GetValue<TJSONArray>('presets');

      FPresetList.Clear;
      for var I := 0 to presetListTmp.Count - 1 do begin
        if I > FPresetNumber then Break;

        tmpObject := presetListTmp.Items[I] as TJSONObject;

        presetTmp := TSettingsPreset.Create;
        with presetTmp do begin
          Prefix      := tmpObject.GetValue<string>('prefix');
          Suffix      := tmpObject.GetValue<string>('suffix');
          Mode        := TWrapModeType(tmpObject.GetValue<Integer>('mode'));
          IsCodeAlign := tmpObject.GetValue<Boolean>('code_align');
          StartLine   := tmpObject.GetValue<string>('start_line');
          EndLine     := tmpObject.GetValue<string>('end_line');
        end;
        FPresetList.Add(presetTmp);
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

      for var I := 0 to FPresetList.Count - 1 do begin

        tmpObject := TJSONObject.Create;
        tmpObject.AddPair('prefix', FPresetList[I].Prefix);
        tmpObject.AddPair('suffix', FPresetList[I].Suffix);
        tmpObject.AddPair('mode', Ord(FPresetList[I].Mode));
        tmpObject.AddPair('code_align', FPresetList[I].IsCodeAlign);
        tmpObject.AddPair('start_line', FPresetList[I].StartLine);
        tmpObject.AddPair('end_line', FPresetList[I].EndLine);

        tmpArray.AddElement(tmpObject);
      end;

      RootObject.AddPair('presets', tmpArray);

      jsonStr := RootObject.Format();

      //TODO: file data validation

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
var tmpPreset : TSettingsPreset;
begin
  try
    FPresetList.Clear;
    for var I := 0 to FPresetNumber do begin //includes current, working settings
      FPresetList.Add(TSettingsPreset.Create)
    end;
  except
    on E: Exception do begin
      SaveToLog('Error while setting default values: ' + E.Message);
    end;
  end;
end;

end.
