program ProjetoTelaCadastro;

uses
  Vcl.Forms,
  frmTelaCadastro in 'frmTelaCadastro.pas' {telaCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TtelaCadastro, telaCadastro);
  Application.Run;
end.
