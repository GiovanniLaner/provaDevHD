unit frmTelaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TtelaCadastro = class(TForm)
    cabecalhoPrincipal: TPanel;
    nomeTabela: TLabel;
    editNome: TEdit;
    memoNome: TMemo;
    gravarAlteracao: TButton;
    procedure gravarAlteracaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaCadastro: TtelaCadastro;

implementation

{$R *.dfm}

procedure TtelaCadastro.gravarAlteracaoClick(Sender: TObject);
begin
  memoNome.Lines.Add('Olá ' + editNome.Text + '!');
end;

end.
