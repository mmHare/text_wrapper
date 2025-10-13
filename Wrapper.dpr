program Wrapper;

uses
  Vcl.Forms,
  frmTextWrapper in 'frmTextWrapper.pas' {FormTextWrapper};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Text Wrapper';
  Application.CreateForm(TFormTextWrapper, FormTextWrapper);
  Application.Run;
end.
