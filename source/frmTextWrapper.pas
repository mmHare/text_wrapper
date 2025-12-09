unit frmTextWrapper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnMenus, Vcl.StdCtrls, Vcl.ComCtrls, Generics.Collections,
  cConfigManager, cSettingsPreset, framPreset,
  Vcl.ImgList, System.ImageList;

type
  TFormTextWrapper = class(TForm)
    ActionManager1: TActionManager;
    PageControl1: TPageControl;
    tsWrapper: TTabSheet;
    tsSettings: TTabSheet;
    pnlSettings: TPanel;
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
    chbCodeAlign: TCheckBox;
    edtStartLine: TEdit;
    edtEndLine: TEdit;
    lblMode: TLabel;
    cmbMode: TComboBox;
    pnlMenu: TPanel;
    btnConvert: TButton;
    btnClipboard: TButton;
    btnClear: TButton;
    btnFullProcess: TButton;
    lblPrefix: TLabel;
    lblSuffix: TLabel;
    edtPrefix: TEdit;
    edtSuffix: TEdit;
    btnAbout: TButton;
    scrlbxPresets: TScrollBox;
    actSavePreset: TAction;
    actLoadPreset: TAction;
    lblPresets: TLabel;
    chbStartLine: TCheckBox;
    chbEndLine: TCheckBox;
    pnlLeft: TPanel;
    ImageList1: TImageList;
    actMoveUp: TAction;
    btnMoveUp: TButton;
    lblTrim: TLabel;
    cmbTrim: TComboBox;
    lblQuotation: TLabel;
    cmbQuotation: TComboBox;
    lblTabStop: TLabel;
    cmbTabStop: TComboBox;
    Button1: TButton;
    actClearSettings: TAction;
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

  private
    FConfigManager : TConfigManager;
    FFramePresetList : TObjectList<TFramePreset>;

    procedure PrepareFrames;

    procedure SetSettingsValues(pPreset: TSettingsPreset);
    procedure GetSettingsValues(pPreset: TSettingsPreset);

  public
    { Public declarations }
  end;


var
  FormTextWrapper: TFormTextWrapper;

implementation

uses
  StrUtils, cUtils, cTypes, frmAbout, cWrapManager, UITypes;

{$R *.dfm}

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
    GetSettingsValues(presetTmp);
    strList.Assign(redtIn.Lines);
    TWrapManager.ConvertText(presetTmp, strList);
    redtOut.Lines.Assign(strList);
  finally
    strList.Free;
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
    on E: Exception do begin
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
    GetSettingsValues(FConfigManager.PresetList[idTmp]);
    FConfigManager.SaveOnePreset(FConfigManager.PresetList[idTmp]);
  except
    on E: Exception do begin
      SaveToLog('Error while saving preset: ' + E.Message);
    end;
  end;
end;

procedure TFormTextWrapper.actClearSettingsExecute(Sender: TObject);
begin
  if MessageDlg('Do you really want to clear settings?', mtConfirmation, mbYesNo, 0) = mrYes then begin
    FConfigManager.PresetList[0].SetDefault;
    SetSettingsValues(FConfigManager.PresetList[0]);
  end;
end;

procedure TFormTextWrapper.btnAboutClick(Sender: TObject);
begin
  if FormAbout = nil then FormAbout := TFormAbout.Create(Self);
  FormAbout.ShowModal;
end;

procedure TFormTextWrapper.PrepareFrames;
var
  frameTmp : TFramePreset;
begin
  if FConfigManager.PresetList.Count < 1 then Exit;

  FFramePresetList.Clear;
  try
    for var I := 1 to FConfigManager.PresetList.Count - 1 do begin
      frameTmp := TFramePreset.Create(scrlbxPresets, FConfigManager.PresetList[I]);
      frameTmp.Name := 'FramePreset_' + IntToStr(I);
      frameTmp.Parent := scrlbxPresets;
      frameTmp.btnSave.Action := actSavePreset;
      frameTmp.btnLoad.Action := actLoadPreset;

      FFramePresetList.Add(frameTmp);
    end;
  except
    on E: Exception do begin
      SaveToLog('Error while loading preset forms: ' + E.Message);
    end;
  end;
end;

procedure TFormTextWrapper.GetSettingsValues(pPreset: TSettingsPreset);
begin
  if not Assigned(pPreset) then Exit;

  with pPreset do begin
    Prefix             := edtPrefix.Text;
    Suffix             := edtSuffix.Text;
    Mode               := TWrapModeType(cmbMode.ItemIndex);
    IsCodeAlign        := chbCodeAlign.Checked;
    StartLine          := edtStartLine.Text;
    IsStartLineEnabled := chbStartLine.Checked;
    EndLine            := edtEndLine.Text;
    IsEndLineEnabled   := chbEndLine.Checked;
    TrimMode           := TTrimModeType(cmbTrim.ItemIndex);
    QuotationType      := TQuotationType(cmbQuotation.ItemIndex);
    TabStopConvert     := TTabStopConvertType(cmbTabStop.ItemIndex);     // TODO: change to imgcombo; function converting enum to tabsize
  end;
end;

procedure TFormTextWrapper.SetSettingsValues(pPreset: TSettingsPreset);
begin
  if not Assigned(FConfigManager) then Exit;
  if not Assigned(pPreset) then Exit;

  FConfigManager.PresetList[0].AssignValues(pPreset); // passed preset becomes working preset

  // fill controls
  with pPreset do begin
    edtPrefix.Text         := Prefix;
    edtSuffix.Text         := Suffix;
    cmbMode.ItemIndex      := Ord(Mode);
    chbCodeAlign.Checked   := IsCodeAlign;
    edtStartLine.Text      := StartLine;
    chbStartLine.Checked   := IsStartLineEnabled;
    edtEndLine.Text        := EndLine;
    chbEndLine.Checked     := IsEndLineEnabled;
    cmbTrim.ItemIndex      := Ord(TrimMode);
    cmbQuotation.ItemIndex := Ord(QuotationType);
    cmbTabStop.ItemIndex   := Ord(TabStopConvert);
  end;
end;

procedure TFormTextWrapper.FormCreate(Sender: TObject);
begin
  FConfigManager := TConfigManager.Create;
  FFramePresetList := TObjectList<TFramePreset>.Create;
  PrepareFrames;

  SetSettingsValues(FConfigManager.PresetList[0]);

  PageControl1.ActivePage := tsWrapper;
end;

procedure TFormTextWrapper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GetSettingsValues(FConfigManager.PresetList[0]);
  FConfigManager.SaveConfigToFile;
end;

procedure TFormTextWrapper.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FConfigManager);
  FreeAndNil(FFramePresetList);
end;

end.
