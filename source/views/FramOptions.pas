unit framOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Buttons,
  cSettingsPreset, cTypes;

type
  TFrameOptions = class(TFrame)
    pnlMain: TPanel;
    grpbxOptions: TGroupBox;
    lblMode: TLabel;
    lblQuotation: TLabel;
    lblTabStop: TLabel;
    lblTrim: TLabel;
    chbCodeAlign: TCheckBox;
    chbEndLine: TCheckBox;
    chbStartLine: TCheckBox;
    cmbMode: TComboBox;
    cmbQuotation: TComboBox;
    cmbTabStop: TComboBox;
    cmbTrim: TComboBox;
    edtEndLine: TEdit;
    edtStartLine: TEdit;
    lblPrefix: TLabel;
    lblSuffix: TLabel;
    edtPrefix: TEdit;
    edtSuffix: TEdit;
    cmbOptLoadPreset: TComboBox;
    btnOptLoadPreset: TButton;
    lblOptLoadPreset: TLabel;
    procedure btnOptLoadPresetClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetOptions(pPreset: TSettingsPreset);
    procedure GetOptions(pPreset: TSettingsPreset);
  end;

implementation

{$R *.dfm}

{ TFrameOptions }

procedure TFrameOptions.btnOptLoadPresetClick(Sender: TObject);
begin
  if cmbOptLoadPreset.ItemIndex >= 0 then
    if cmbOptLoadPreset.Items.Objects[cmbOptLoadPreset.ItemIndex] is TSettingsPreset then
      SetOptions(TSettingsPreset(cmbOptLoadPreset.Items.Objects[cmbOptLoadPreset.ItemIndex]));
end;

procedure TFrameOptions.GetOptions(pPreset: TSettingsPreset);
begin
  if not Assigned(pPreset) then Exit;

  with pPreset do
  begin
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
    TabStopConvert     := TabSizeFromIndex(cmbTabStop.ItemIndex);
  end;
end;

procedure TFrameOptions.SetOptions(pPreset: TSettingsPreset);
begin
  with pPreset do
  begin
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
    cmbTabStop.ItemIndex   := TabSizeToIndex(TabStopConvert);
  end;
end;

end.
