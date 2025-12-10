unit cConfigManager;

interface

uses
  Generics.Collections, cSettingsPreset;

type
  TConfigManager = class
    private
      FPresetList : TObjectList<TSettingsPreset>;
    public
      property PresetList : TObjectList<TSettingsPreset> read FPresetList write FPresetList;

      procedure SetDefault;
      procedure SaveConfigToFile;
      procedure LoadConfigFromFile;

      procedure SaveOnePreset(pPreset: TSettingsPreset);

      destructor Destroy; override;
      constructor Create;
  end;

implementation

uses
  JSON, SysUtils, IOUtils, JSON.Serializers, cUtils, cConst;

{ TConfigManager }

constructor TConfigManager.Create;
begin
  FPresetList := TObjectList<TSettingsPreset>.Create;

  SetDefault;

  LoadConfigFromFile;
end;

destructor TConfigManager.Destroy;
begin
  FreeAndNil(FPresetList);

  inherited;
end;

procedure TConfigManager.LoadConfigFromFile;
var
  RootObject, tmpObject : TJSONObject;
  presetListTmp : TJSONArray;
  jsonStr : string;
  Serializer: TJsonSerializer;
begin

  Serializer := TJsonSerializer.Create;

  try
    if not FileExists(CONFIG_FILE_NAME) then
    begin
      SaveConfigToFile;
      Exit;
    end;

    jsonStr := TFile.ReadAllText(CONFIG_FILE_NAME, TEncoding.UTF8);
    RootObject := TJSONObject.ParseJSONValue(jsonStr) as TJSONObject;

    //TODO: file data validation

    try
      presetListTmp := RootObject.GetValue<TJSONArray>('presets');

      FPresetList.Clear;
      for var I := 0 to presetListTmp.Count - 1 do
      begin
        if I > PRESET_NUMBER then Break;

        tmpObject := presetListTmp.Items[I] as TJSONObject;

        FPresetList.Add(Serializer.Deserialize<TSettingsPreset>(tmpObject.ToJSON));
        FPresetList[I].Id := I;
      end;
    finally
      RootObject.Free;
      Serializer.Free;
    end;
  except
    on E: Exception do
    begin
      SaveToLog('Error while reading config file: ' + E.Message);
    end;
  end;
end;

procedure TConfigManager.SaveConfigToFile;
var
  RootObject, tmpObject : TJSONObject;
  tmpArray : TJSONArray;
  strTmp : string;
  Serializer: TJsonSerializer;
begin
  Serializer := TJsonSerializer.Create;
  RootObject := TJSONObject.Create;
  try
    try
      tmpArray := TJSONArray.Create;

      FPresetList[0].PresetName := ''; //working settings have no name
      for var I := 0 to FPresetList.Count - 1 do
      begin
        FPresetList[I].Id := I;

        strTmp := Serializer.Serialize(FPresetList[I]);
        tmpObject := TJSONObject.ParseJSONValue(strTmp) as TJSONObject;
        tmpArray.AddElement(tmpObject);
      end;

      RootObject.AddPair('presets', tmpArray);

      //TODO: file data validation

      TFile.WriteAllText(CONFIG_FILE_NAME, RootObject.Format(), TEncoding.UTF8);
    except
      on E: Exception do
      begin
        SaveToLog('Error while saving config file: ' + E.Message);
      end;
    end;
  finally
    RootObject.Free;
    Serializer.Free;
  end;
end;

procedure TConfigManager.SaveOnePreset(pPreset: TSettingsPreset);
begin
  with TConfigManager.Create do
  begin
    try
      try
        if (pPreset.Id < 1) or (pPreset.Id > PRESET_NUMBER) then
          raise Exception.Create('Wrong preset id');

        PresetList[pPreset.Id].AssignValues(pPreset);
        SaveConfigToFile;
      except
        on E: Exception do
        begin
          SaveToLog('Error while saving config file: ' + E.Message);
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TConfigManager.SetDefault;
begin
  try
    FPresetList.Clear;
    for var I := 0 to PRESET_NUMBER do //includes current, working settings
    begin
      FPresetList.Add(TSettingsPreset.Create);
    end;
  except
    on E: Exception do
    begin
      SaveToLog('Error while setting default values: ' + E.Message);
    end;
  end;
end;

end.
