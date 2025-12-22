unit cConfigManager;

interface

uses
  Generics.Collections, cSettingsPreset;

type
  TConfigManager = class
    private
      FPresetList : TObjectList<TSettingsPreset>;
      FFileConvertPath : string;
      FPresetNumber : Integer;
    public
      property PresetList : TObjectList<TSettingsPreset> read FPresetList write FPresetList;
      property FileConvertPath : string read FFileConvertPath write FFileConvertPath;
      property PresetNumber : Integer read FPresetNumber write FPresetNumber;

      procedure SetDefault;
      procedure SaveConfigToFile;
      procedure LoadConfigFromFile;

      procedure SaveOnePreset(pPreset: TSettingsPreset);
      procedure RefreshPresetNumber(pNumber: Integer);

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
  valTmp: TJSONValue;
  presetListTmp : TJSONArray;
  jsonStr : string;
  Serializer: TJsonSerializer;
begin
  if not FileExists(CONFIG_FILE_NAME) then
  begin
    SaveConfigToFile;
    Exit;
  end;

  Serializer := TJsonSerializer.Create;
  try
    try
      jsonStr := TFile.ReadAllText(CONFIG_FILE_NAME, TEncoding.UTF8);
      RootObject := TJSONObject.ParseJSONValue(jsonStr) as TJSONObject;

      //TODO: additional file data validation?

      valTmp := RootObject.GetValue('file_convert_path');
      if Assigned(valTmp) then FFileConvertPath := valTmp.Value;
      valTmp := RootObject.GetValue('preset_number');
      if Assigned(valTmp) then FPresetNumber := valTmp.AsType<Integer>;

      presetListTmp := RootObject.GetValue<TJSONArray>('presets');
      if Assigned(presetListTmp) then
      begin
        FPresetList.Clear;
        for var I := 0 to presetListTmp.Count - 1 do
        begin
          tmpObject := presetListTmp.Items[I] as TJSONObject;

          FPresetList.Add(Serializer.Deserialize<TSettingsPreset>(tmpObject.ToJSON));
          FPresetList[I].Id := I;
        end;
      end;
      RefreshPresetNumber(FPresetNumber); // align list to the desired number of presets
    except
      on E: Exception do
      begin
        SaveToLog('Error while reading config file: ' + E.Message);
      end;
    end;
  finally
    FreeAndNil(RootObject);
    Serializer.Free;
  end;
end;

procedure TConfigManager.RefreshPresetNumber(pNumber: Integer);
var
  listCount: Integer;
begin
  if pNumber < 2 then Exit;
  if pNumber = FPresetList.Count then Exit;

  try
    FPresetNumber := pNumber;
    listCount := FPresetList.Count - 1;
    if FPresetNumber > listCount then
    begin
      for var I := FPresetList.Count to FPresetNumber - 1 do
      begin
        FPresetList.Add(TSettingsPreset.Create);
        FPresetList[I].Id := I;
      end;
    end
    else
    begin
      for var I := listCount downto FPresetNumber do
        FPresetList.Delete(I);
    end;
  except
    on E: Exception do
    begin
      SaveToLog('Error while setting default values: ' + E.Message);
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
      RootObject.AddPair('file_convert_path', FFileConvertPath);
      RootObject.AddPair('preset_number', FPresetNumber);

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
        if (pPreset.Id < 1) or (pPreset.Id > FPresetNumber - 1) then
          raise Exception.Create('Wrong preset id');

        FPresetList[pPreset.Id].AssignValues(pPreset);
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
    FFileConvertPath := '';
    FPresetNumber := 4;

    FPresetList.Clear;
    RefreshPresetNumber(FPresetNumber);
//    for var I := 0 to FPresetNumber do //includes current, working settings
//      FPresetList.Add(TSettingsPreset.Create);
  except
    on E: Exception do
    begin
      SaveToLog('Error while setting default values: ' + E.Message);
    end;
  end;
end;

end.
