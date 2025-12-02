program Wrapper;

uses
  {$ifdef DEBUG} FastMM5, {$endif}
  Vcl.Forms,
  frmTextWrapper in 'source\frmTextWrapper.pas' {FormTextWrapper},
  framPreset in 'source\views\framPreset.pas' {FramePreset: TFrame},
  frmAbout in 'source\views\frmAbout.pas' {FormAbout},
  cConfigManager in 'source\managers\cConfigManager.pas',
  cSettingsPreset in 'source\classes\cSettingsPreset.pas',
  cUtils in 'source\units\cUtils.pas',
  cConst in 'source\units\cConst.pas',
  cTypes in 'source\units\cTypes.pas',
  cWrapManager in 'source\managers\cWrapManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Text Wrapper';
  Application.CreateForm(TFormTextWrapper, FormTextWrapper);
  Application.Run;
end.
