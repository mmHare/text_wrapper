unit frmAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormAbout = class(TForm)
    lblProgramVersion: TLabel;
    redtAbout: TRichEdit;
    pnlHeader: TPanel;
    pnlAbout: TPanel;
    btnOk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

uses
  cUtils;

{$R *.dfm}

procedure TFormAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  lblProgramVersion.Caption := Format('%s v%s', [PROGRAM_NAME, PROGRAM_VERSION]);
end;

procedure TFormAbout.FormDestroy(Sender: TObject);
begin
  FormAbout := nil;
end;

end.
