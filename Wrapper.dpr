program Wrapper;

uses
  Vcl.Forms,
  frmTextWrapper in 'frmTextWrapper.pas' {FormTextWrapper},
  frmAbout in 'source\frmAbout.pas' {FormAbout},
  cConfigManager in 'source\cConfigManager.pas',
  cUtils in 'source\cUtils.pas',
  cSettingsPreset in 'source\cSettingsPreset.pas',
  framPreset in 'source\framPreset.pas' {FramePreset: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Text Wrapper';
  Application.CreateForm(TFormTextWrapper, FormTextWrapper);
  Application.Run;
end.
