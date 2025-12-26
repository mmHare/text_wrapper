unit frmTextWrapper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnMenus, Vcl.StdCtrls, Vcl.ComCtrls, Generics.Collections,
  cConfigManager, cSettingsPreset, framPreset, framOptions,
  Vcl.ImgList, System.ImageList, Vcl.WinXCtrls, Vcl.Samples.Spin;

type
  TFormTextWrapper = class(TForm)
    ActionManager1: TActionManager;
    PageControl1: TPageControl;
    tsWrapper: TTabSheet;
    tsOther: TTabSheet;
    pnlOther: TPanel;
    gpWrapper: TGridPanel;
    pnlIn: TPanel;
    redtIn: TRichEdit;
    lblIn: TLabel;
    pnlOut: TPanel;
    lblOut: TLabel;
    redtOut: TRichEdit;
    actClear: TAction;
    actClipboard: TAction;
    actConvert: TAction;
    actFullProcess: TAction;
    pnlMenu: TPanel;
    btnConvert: TButton;
    btnClipboard: TButton;
    btnClear: TButton;
    btnFullProcess: TButton;
    btnAbout: TButton;
    scrlbxPresets: TScrollBox;
    actSavePreset: TAction;
    actLoadPreset: TAction;
    ImageList1: TImageList;
    actMoveUp: TAction;
    btnMoveUp: TButton;
    actClearSettings: TAction;
    grpbxPresets: TGroupBox;
    edtFilePath: TEdit;
    lblFilePath: TLabel;
    btnFilePath: TButton;
    actConvertFile: TAction;
    btnConvertFile: TButton;
    grpbxConvertFile: TGroupBox;
    svOptions: TSplitView;
    btnOptions: TButton;
    actShowOptions: TAction;
    actHideOptions: TAction;
    pnlOtherActions: TPanel;
    btnClearSettings: TButton;
    pnlToggleOptions: TPanel;
    pnlPages: TPanel;
    pnlPresetsOptions: TPanel;
    lblPresetNumber: TLabel;
    sePresetNumber: TSpinEdit;
    btnApplyPresetNumber: TButton;
    actApplyPresetNumber: TAction;
    procedure actClearExecute(Sender: TObject);
    procedure actClipboardExecute(Sender: TObject);
    procedure actConvertExecute(Sender: TObject);
    procedure actFullProcessExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actSavePresetExecute(Sender: TObject);
    procedure actLoadPresetExecute(Sender: TObject);
    procedure actMoveUpExecute(Sender: TObject);
    procedure actClearSettingsExecute(Sender: TObject);
    procedure btnFilePathClick(Sender: TObject);
    procedure actConvertFileExecute(Sender: TObject);
    procedure edtFilePathChange(Sender: TObject);
    procedure actShowOptionsExecute(Sender: TObject);
    procedure actHideOptionsExecute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure actApplyPresetNumberExecute(Sender: TObject);

  private
    FConfigManager : TConfigManager;
    FFramePresetList : TObjectList<TFramePreset>;
    FFrameOptions : TFrameOptions;

    procedure PrepareFrames;
    procedure RefreshFrames;
    function GetFrameByTag(pTag: Integer) : TFramePreset;

    procedure SetSettingsValues(pPreset: TSettingsPreset);

  public
    { Public declarations }
  end;


var
  FormTextWrapper: TFormTextWrapper;

implementation

uses
  StrUtils, cUtils, cTypes, frmAbout, cWrapManager, UITypes;

{$R *.dfm}

procedure TFormTextWrapper.actApplyPresetNumberExecute(Sender: TObject);
begin
  FConfigManager.RefreshPresetNumber(sePresetNumber.Value + 1);
  RefreshFrames;
end;

procedure TFormTextWrapper.actClearExecute(Sender: TObject);
begin
  redtIn.Clear;
  redtOut.Clear;
end;

procedure TFormTextWrapper.actClipboardExecute(Sender: TObject);
begin
  redtOut.SelectAll;
  redtOut.CopyToClipboard;
end;

procedure TFormTextWrapper.actConvertExecute(Sender: TObject);
var
  presetTmp : TSettingsPreset;
  strList : TStringList;
begin
  presetTmp:= TSettingsPreset.Create;
  strList := TStringList.Create;

  try
    FFrameOptions.GetOptions(presetTmp);
    strList.Assign(redtIn.Lines);
    TWrapManager.ConvertText(presetTmp, strList);
    redtOut.Lines.Assign(strList);
  finally
    strList.Free;
    presetTmp.Free;
  end;
end;

procedure TFormTextWrapper.actConvertFileExecute(Sender: TObject);
var
  presetTmp : TSettingsPreset;
begin
  if edtFilePath.Text = '' then Exit;

  if not FileExists(edtFilePath.Text) then
  begin
    ShowMessage('File not found.');
    Exit;
  end;

  presetTmp:= TSettingsPreset.Create;
  try
    FFrameOptions.GetOptions(presetTmp);
    if TWrapManager.ConvertFile(presetTmp, edtFilePath.Text) then
      ShowMessage('File converted.');
  finally
    presetTmp.Free;
  end;
end;

procedure TFormTextWrapper.actFullProcessExecute(Sender: TObject);
begin
  actClear.Execute;
  redtIn.PasteFromClipboard;
  actConvert.Execute;
  actClipboard.Execute;
end;

procedure TFormTextWrapper.actHideOptionsExecute(Sender: TObject);
begin
  svOptions.Opened := False;
  btnOptions.Action := actShowOptions;
end;

procedure TFormTextWrapper.actLoadPresetExecute(Sender: TObject);
var
  btn: TButton;
  idTmp: Integer;
begin
  // action should be assigned to load button on preset frame
  try
    btn := (Sender as TAction).ActionComponent as TButton;
    idTmp := btn.Tag;
    SetSettingsValues(FConfigManager.PresetList[idTmp]);
  except
    on E: Exception do
    begin
      SaveToLog('Error while loading preset: ' + E.Message);
    end;
  end;
end;

procedure TFormTextWrapper.actMoveUpExecute(Sender: TObject);
begin
  if Trim(redtOut.Lines.Text) <> '' then redtIn.Lines := redtOut.Lines;
  redtOut.Lines.Clear;
end;

procedure TFormTextWrapper.actSavePresetExecute(Sender: TObject);
var
  btn: TButton;
  idTmp: Integer;
begin
  // action should be assigned to save button on preset frame
  try
    btn := (Sender as TAction).ActionComponent as TButton;
    idTmp := btn.Tag;
    FFrameOptions.GetOptions(FConfigManager.PresetList[idTmp]);
    FConfigManager.PresetList[idTmp].PresetName := GetFrameByTag(idTmp).edtName.Text;
    FConfigManager.SaveOnePreset(FConfigManager.PresetList[idTmp]);
  except
    on E: Exception do
    begin
      SaveToLog('Error while saving preset: ' + E.Message);
    end;
  end;
end;

procedure TFormTextWrapper.actShowOptionsExecute(Sender: TObject);
begin
  svOptions.Opened := True;
  btnOptions.Action := actHideOptions;
end;

procedure TFormTextWrapper.actClearSettingsExecute(Sender: TObject);
begin
  if MessageDlg('Do you really want to clear settings?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    if MessageDlg('Do you also want to delete presets?', mtConfirmation, mbYesNo, 0) = mrYes then
    begin
      FConfigManager.SetDefault;
    end
    else
    begin
      FConfigManager.PresetList[0].SetDefault;
      SetSettingsValues(FConfigManager.PresetList[0]);
    end;
  end;
end;

procedure TFormTextWrapper.btnAboutClick(Sender: TObject);
begin
  if FormAbout = nil then FormAbout := TFormAbout.Create(Self);
  FormAbout.ShowModal;
end;

procedure TFormTextWrapper.btnFilePathClick(Sender: TObject);
var
  openDialogTmp: TOpenDialog;
begin
  openDialogTmp := TOpenDialog.Create(nil);
  try
    if openDialogTmp.Execute then
      edtFilePath.Text := openDialogTmp.FileName;
  finally
    openDialogTmp.Free;
  end;
end;

procedure TFormTextWrapper.edtFilePathChange(Sender: TObject);
begin
  edtFilePath.Hint := edtFilePath.Text;
  FConfigManager.FileConvertPath := edtFilePath.Text;
end;

procedure TFormTextWrapper.PageControl1Change(Sender: TObject);
begin
  actMoveUp.Visible := PageControl1.ActivePage = tsWrapper;
end;

procedure TFormTextWrapper.PrepareFrames;
var
  frameTmp : TFramePreset;
begin
  // Frame options
  FFrameOptions := TFrameOptions.Create(svOptions);
  FFrameOptions.Parent := svOptions;
  FFrameOptions.Align := alClient;
  svOptions.OpenedWidth := FFrameOptions.Width;

  // Preset frames
  FFramePresetList.Clear;
  FFrameOptions.cmbOptLoadPreset.Items.Clear;
  if FConfigManager.PresetList.Count <= 1 then Exit;

  try
    for var I := 1 to FConfigManager.PresetList.Count - 1 do
    begin
      frameTmp := TFramePreset.Create(scrlbxPresets, FConfigManager.PresetList[I]);
      frameTmp.Name := 'FramePreset_' + IntToStr(I);
      frameTmp.Parent := scrlbxPresets;
      frameTmp.SetFrameIndex(I);
      frameTmp.btnSave.Action := actSavePreset;
      frameTmp.btnLoad.Action := actLoadPreset;
      FFramePresetList.Add(frameTmp);
    end;

    for var I := 1 to FConfigManager.PresetList.Count - 1 do
      FFrameOptions.cmbOptLoadPreset.AddItem(FConfigManager.PresetList[I].PresetName, FConfigManager.PresetList[I]);
  except
    on E: Exception do
    begin
      SaveToLog('Error while loading preset forms: ' + E.Message);
    end;
  end;
end;

procedure TFormTextWrapper.RefreshFrames;
var
  frameTmp : TFramePreset;
begin
  FFramePresetList.Clear;
  FFrameOptions.cmbOptLoadPreset.Items.Clear;
  if FConfigManager.PresetList.Count <= 1 then Exit;

  try
    for var I := FConfigManager.PresetList.Count - 1 downto 1 do
    begin
      frameTmp := TFramePreset.Create(scrlbxPresets, FConfigManager.PresetList[I]);
      frameTmp.Name := 'FramePreset_' + IntToStr(I);
      frameTmp.Parent := scrlbxPresets;
      frameTmp.SetFrameIndex(I);
      frameTmp.btnSave.Action := actSavePreset;
      frameTmp.btnLoad.Action := actLoadPreset;
      FFramePresetList.Add(frameTmp);
    end;

    for var I := 1 to FConfigManager.PresetList.Count - 1 do
      FFrameOptions.cmbOptLoadPreset.AddItem(FConfigManager.PresetList[I].PresetName, FConfigManager.PresetList[I]);
  except
    on E: Exception do
    begin
      SaveToLog('Error while loading preset forms: ' + E.Message);
    end;
  end;
end;

function TFormTextWrapper.GetFrameByTag(pTag: Integer): TFramePreset;
begin
  Result := nil;
  for var I := 0 to FFramePresetList.Count - 1 do
  begin
    if FFramePresetList[I].Tag = pTag then
    begin
      Result := FFramePresetList[I];
      Exit;
    end;
  end;
end;

procedure TFormTextWrapper.SetSettingsValues(pPreset: TSettingsPreset);
begin
  if not Assigned(FConfigManager) then Exit;
  if not Assigned(pPreset) then Exit;

  FConfigManager.PresetList[0].AssignValues(pPreset); // passed preset becomes working preset

  // fill controls
  FFrameOptions.SetOptions(pPreset);

  edtFilePath.Text := FConfigManager.FileConvertPath;
  sePresetNumber.Value := FConfigManager.PresetNumber - 1; // ignore working preset
end;

procedure TFormTextWrapper.FormCreate(Sender: TObject);
begin
  FConfigManager := TConfigManager.Create;
  FFramePresetList := TObjectList<TFramePreset>.Create;
  PrepareFrames;

  SetSettingsValues(FConfigManager.PresetList[0]);

  PageControl1.ActivePage := tsWrapper;

  actHideOptions.Execute;
end;

procedure TFormTextWrapper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFrameOptions.GetOptions(FConfigManager.PresetList[0]);
  FConfigManager.SaveConfigToFile;
end;

procedure TFormTextWrapper.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FConfigManager);
  FreeAndNil(FFramePresetList);
end;

end.
