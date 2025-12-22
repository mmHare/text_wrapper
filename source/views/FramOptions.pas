unit framOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
