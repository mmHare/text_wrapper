unit frmTextWrapper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnMenus, Vcl.StdCtrls, Vcl.ComCtrls,
  cConfigManager, cTypes;

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
    lblStartLine: TLabel;
    lblEndLine: TLabel;
    edtStartLine: TEdit;
    edtEndLine: TEdit;
    lblMode: TLabel;
    cmbMode: TComboBox;
    pnlMenu: TPanel;
    btnConvert: TButton;
    btnClipboard: TButton;
    btnClear: TButton;
    Button1: TButton;
    lblPrefix: TLabel;
    lblSuffix: TLabel;
    edtPrefix: TEdit;
    edtSuffix: TEdit;
    btnAbout: TButton;
    procedure actClearExecute(Sender: TObject);
    procedure actClipboardExecute(Sender: TObject);
    procedure actConvertExecute(Sender: TObject);
    procedure actFullProcessExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FConfigManager : TConfigManager;

    procedure SetControls;
    function GetSettingsValues : RSettingsPreset;

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
  StrUtils, frmAbout;

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

procedure TFormTextWrapper.btnAboutClick(Sender: TObject);
begin
  if FormAbout = nil then FormAbout := TFormAbout.Create(Self);
  FormAbout.ShowModal;
end;

procedure TFormTextWrapper.PerformAddMode;
var strList : TStringList;
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
    if edtStartLine.Text <> '' then strList.Insert(0, edtStartLine.Text);
    if edtEndLine.Text <> '' then  strList.Add(edtEndLine.Text);

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
      S := Trim(strList[I]);

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

function TFormTextWrapper.GetSettingsValues : RSettingsPreset;
begin
  with Result do begin
    Prefix      := edtPrefix.Text;
    Suffix      := edtSuffix.Text;
    Mode        := TWrapModeType(cmbMode.ItemIndex);
    IsCodeAlign := chbCodeAlign.Checked;
    StartLine   := edtStartLine.Text;
    EndLine     := edtEndLine.Text;
  end;
end;

procedure TFormTextWrapper.SetControls;
begin
  if not Assigned(FConfigManager) then Exit;

  with FConfigManager.SettingsPreset do begin
    edtPrefix.Text       := Prefix;
    edtSuffix.Text       := Suffix;
    cmbMode.ItemIndex    := Ord(Mode);
    chbCodeAlign.Checked := IsCodeAlign;
    edtStartLine.Text    := StartLine;
    edtEndLine.Text      := EndLine;
  end;
end;

procedure TFormTextWrapper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FConfigManager.SettingsPreset := GetSettingsValues;
  FConfigManager.SaveConfigToFile;
end;

procedure TFormTextWrapper.FormCreate(Sender: TObject);
begin
  FConfigManager := TConfigManager.Create;

  SetControls;

  PageControl1.ActivePage := tsWrapper;
end;

end.
