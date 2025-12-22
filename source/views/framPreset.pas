unit framPreset;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, cSettingsPreset;

type
  TFramePreset = class(TFrame)
    pnlMain: TPanel;
    edtName: TEdit;
    btnSave: TButton;
    btnLoad: TButton;
    lblName: TLabel;
    procedure edtNameChange(Sender: TObject);
  private
    FPreset: TSettingsPreset;
    FFrameIndex: Integer;
  public
    procedure SetFrameIndex(AIndex: Integer);

    constructor Create(AOwner: TComponent; APreset: TSettingsPreset); reintroduce;
  end;

implementation

{$R *.dfm}

{ TFramePreset }

constructor TFramePreset.Create(AOwner: TComponent; APreset: TSettingsPreset);
begin
  inherited Create(AOwner);

  FPreset := APreset;
  Self.Tag := FPreset.Id;
  edtName.Text := FPreset.PresetName;
  btnSave.Tag := FPreset.Id;
  btnLoad.Tag := FPreset.Id;
end;

procedure TFramePreset.edtNameChange(Sender: TObject);
begin
  edtName.Hint := edtName.Text;
end;

procedure TFramePreset.SetFrameIndex(AIndex: Integer);
begin
  FFrameIndex := AIndex;
  lblName.Caption := 'Preset ' + IntToStr(FPreset.Id);
end;

end.
