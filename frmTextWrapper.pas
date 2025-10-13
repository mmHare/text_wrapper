unit frmTextWrapper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnMenus, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFormTextWrapper = class(TForm)
    ActionManager1: TActionManager;
    actClose: TAction;
    ToolBar1: TToolBar;
    btnClose: TButton;
    PageControl1: TPageControl;
    tsWrapper: TTabSheet;
    tsSettings: TTabSheet;
    pnlSettings: TPanel;
    tsAbout: TTabSheet;
    pnlAbout: TPanel;
    gpWrapper: TGridPanel;
    pnlIn: TPanel;
    redtIn: TRichEdit;
    lblIn: TLabel;
    pnlOut: TPanel;
    lblOut: TLabel;
    redtOut: TRichEdit;
    actToCode: TAction;
    actToSQL: TAction;
    actClear: TAction;
    actClipboard: TAction;
    actConvert: TAction;
    actAutoRecog: TAction;
    actFullProcess: TAction;
    chbCodeAlign: TCheckBox;
    lblPrefix: TLabel;
    lblSuffix: TLabel;
    edtPrefix: TEdit;
    edtSuffix: TEdit;
    lblStartLine: TLabel;
    lblEndLine: TLabel;
    edtStartLine: TEdit;
    edtEndLine: TEdit;
    lblMode: TLabel;
    redtAbout: TRichEdit;
    cmbMode: TComboBox;
    actTextWrap: TAction;
    pnlMenu: TPanel;
    btnConvert: TButton;
    btnClipboard: TButton;
    btnClear: TButton;
    Button1: TButton;
    procedure actCloseExecute(Sender: TObject);
    procedure actToCodeExecute(Sender: TObject);
    procedure actToSQLExecute(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure actClipboardExecute(Sender: TObject);
    procedure actConvertExecute(Sender: TObject);
    procedure actAutoRecogExecute(Sender: TObject);
    procedure actFullProcessExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actTextWrapExecute(Sender: TObject);

  private
    function GetPrefix : string;
    function GetSuffix : string;
  public
    { Public declarations }
  end;

var
  FormTextWrapper: TFormTextWrapper;

implementation

uses
  StrUtils;

{$R *.dfm}



procedure TFormTextWrapper.actAutoRecogExecute(Sender: TObject);
var line : string;
begin
  for line in redtIn.Lines do begin
    if (line <> '') and (line.Contains(edtStartLine.Text) or line.Contains(GetPrefix)) then
    begin
      actToSQL.Execute;
      Exit;
    end;
  end;
  actToCode.Execute;
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

procedure TFormTextWrapper.actCloseExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormTextWrapper.actConvertExecute(Sender: TObject);
begin
  case cmbMode.ItemIndex of
//    0: actTextWrap.Execute;
    0, 1: actAutoRecog.Execute;
    2: actToCode.Execute;
    3: actToSQL.Execute;
  end;
end;

procedure TFormTextWrapper.actFullProcessExecute(Sender: TObject);
begin
  actClear.Execute;
  redtIn.PasteFromClipboard;
  actAutoRecog.Execute;
  actClipboard.Execute;
end;

procedure TFormTextWrapper.actTextWrapExecute(Sender: TObject);
begin
//
end;

procedure TFormTextWrapper.actToCodeExecute(Sender: TObject);
var strList : TStringList;
    I, lineLength, x : Integer;
    S : string;
begin
  if redtIn.Lines.Count = 0 then Exit;

  lineLength := 0;
  for S in redtIn.Lines do if Length(S) > lineLength then lineLength := Length(S);

  strList := TStringList.Create;
  try
    strList.Assign(redtIn.Lines);

    for I := 0 to strList.Count - 1 do begin
      S := strList[I];
      S := StringReplace(S, '''', '''''', [rfReplaceAll]);

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

procedure TFormTextWrapper.actToSQLExecute(Sender: TObject);
var strList : TStringList;
    I : Integer;
    S : string;
begin
  if redtIn.Lines.Count = 0 then Exit;

  strList := TStringList.Create;
  try
    strList.Assign(redtIn.Lines);

    //delete empty lines at the start and end and Begin/EndUpdate
    for I := strList.Count - 1 downto 0 do begin
      if (Trim(strList[I]) = '') or strList[I].Contains(edtEndLine.Text)
      then strList.Delete(strList.Count-1)
      else Break;
    end;
    for I := strList.Count - 1 downto 0 do begin
      if (Trim(strList[I]) = '') or strList[I].Contains(edtStartLine.Text)
      then strList.Delete(I)
      else Break;
    end;

    for I := 0 to strList.Count - 1 do begin
      S := Trim(strList[I]);

      if StartsStr(Trim(GetPrefix), S) then Delete(S, 1, Length(Trim(GetPrefix)));
      if EndsStr(GetSuffix, S) then Delete(S, Length(S) - Length(GetSuffix) + 1, Length(GetSuffix));
      S := StringReplace(S, '''''', '''', [rfReplaceAll]);

      S := TrimRight(S);
      strList[I] := S;
    end;

    redtOut.Lines.Assign(strList);
  finally
    strList.Free;
  end;
end;

procedure TFormTextWrapper.FormCreate(Sender: TObject);
begin
  chbCodeAlign.Checked := True;
  cmbMode.ItemIndex := 0;

  PageControl1.ActivePage := tsWrapper;

  Self.Constraints.MinHeight := 500;
  Self.Constraints.MinWidth := 750;
end;

function TFormTextWrapper.GetPrefix: string;
begin
  Result := edtPrefix.Text;
end;

function TFormTextWrapper.GetSuffix: string;
begin
  Result := edtSuffix.Text;
end;

end.
