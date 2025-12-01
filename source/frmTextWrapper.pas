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

  private
    FConfigManager : TConfigManager;
    FFramePresetList : TObjectList<TFramePreset>;

    procedure PrepareFrames;

    procedure SetControls(pPreset: TSettingsPreset);
    procedure GetSettingsValues(pPreset: TSettingsPreset);

    function GetPrefix : string;
    function GetSuffix : string;

    procedure PerformAddMode;
    procedure PerformRemoveMode;
  public
    { Public declarations }
  end;


var
  FormTextWrapper: TFormTextWrapper;

implementation

uses
  StrUtils, cUtils, cTypes, frmAbout;

{$R *.dfm}

function TFormTextWrapper.GetPrefix: string;
begin
  Result := edtPrefix.Text;
end;

function TFormTextWrapper.GetSuffix: string;
begin
  Result := edtSuffix.Text;
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
begin
  case TWrapModeType(cmbMode.ItemIndex) of
       wmtAdd : PerformAddMode;
    wmtRemove : PerformRemoveMode;
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
  btn := (Sender as TAction).ActionComponent as TButton;
  idTmp := btn.Tag;
  SetControls(FConfigManager.PresetList[idTmp]);
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
  btn := (Sender as TAction).ActionComponent as TButton;
  idTmp := btn.Tag;
  GetSettingsValues(FConfigManager.PresetList[idTmp]);
end;

procedure TFormTextWrapper.btnAboutClick(Sender: TObject);
begin
  if FormAbout = nil then FormAbout := TFormAbout.Create(Self);
  FormAbout.ShowModal;
end;

procedure TFormTextWrapper.PerformAddMode;
var
  strList : TStringList;
  lineLength, x : Integer;
  S : string;
begin
  if redtIn.Lines.Count = 0 then Exit;

  lineLength := 0;
  for S in redtIn.Lines do if Length(S) > lineLength then lineLength := Length(S);

  strList := TStringList.Create;
  try
    strList.Assign(redtIn.Lines);

    for var I := 0 to strList.Count - 1 do begin
      S := strList[I];
//      S := StringReplace(S, '''', '''''', [rfReplaceAll]);  //doubled single quotas  //TODO: add cmb option

      if chbCodeAlign.Checked then  begin  //fill with spaces
        x := lineLength - Length(S);
        if x > 0 then S := S + StringOfChar(' ', x);
      end;

      strList[I] := GetPrefix + S + GetSuffix;
    end;

     //add starting and finishing lines
    if chbStartLine.Checked and (edtStartLine.Text <> '') then strList.Insert(0, edtStartLine.Text);
    if chbEndLine.Checked   and (edtEndLine.Text <> '')   then strList.Add(edtEndLine.Text);

    redtOut.Lines.Assign(strList);
  finally
    strList.Free;
  end;
end;

procedure TFormTextWrapper.PerformRemoveMode;
var strList : TStringList;
    S : string;
begin
  if redtIn.Lines.Count = 0 then Exit;

  strList := TStringList.Create;
  try
    strList.Assign(redtIn.Lines);

    //TODO: add option or abandon?
//    for var I := strList.Count - 1 downto 0 do begin
//      if (Trim(strList[I]) = '') then strList.Delete(I)
//      else if strList[I] = edtEndLine.Text then begin   //delete ending line
//        strList.Delete(I);
//        Break
//      end;
//    end;
//    for var I := 0 to strList.Count - 1 do begin
//      if strList[I] = edtStartLine.Text then begin
//        for var J := I downto 0 do strList.Delete(J);     //delete beginning line
//        Break;
//      end;
//    end;

    for var I := 0 to strList.Count - 1 do begin
      S := strList[I];
      if StartsStr(Trim(GetPrefix), Trim(S)) then S := Trim(S);

      if StartsStr(Trim(GetPrefix), S) then Delete(S, 1, Length(Trim(GetPrefix)));
      if EndsStr(GetSuffix, S) then Delete(S, Length(S) - Length(GetSuffix) + 1, Length(GetSuffix));
//      S := StringReplace(S, '''''', '''', [rfReplaceAll]);  //un-double single quotas   //TODO: add cmb option

      S := TrimRight(S);
      strList[I] := S;
    end;

    redtOut.Lines.Assign(strList);
  finally
    strList.Free;
  end;
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
  end;
end;

procedure TFormTextWrapper.SetControls(pPreset: TSettingsPreset);
begin
  if not Assigned(FConfigManager) then Exit;
  if not Assigned(pPreset) then Exit;

  FConfigManager.PresetList[0].AssignValues(pPreset);

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
  end;
end;

procedure TFormTextWrapper.FormCreate(Sender: TObject);
begin
  FConfigManager := TConfigManager.Create;
  FFramePresetList := TObjectList<TFramePreset>.Create;
  PrepareFrames;

  SetControls(FConfigManager.PresetList[0]);

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
