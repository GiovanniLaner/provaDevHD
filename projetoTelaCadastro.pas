unit projetoTelaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.WinXPickers, ZAbstractConnection, ZConnection, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,System.Types;

type
  TForm1 = class(TForm)
    cadastroEmpregadoDepartamento: TPanel;
    Conexao: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    dsEmpregados: TDataSource;
    empregados: TFDQuery;
    departamentos: TFDQuery;
    dsDepartamentos: TDataSource;
    empregado_funcao: TFDQuery;
    dsEmpregadoFuncao: TDataSource;
    empregadosid_empregado: TIntegerField;
    empregadoscod_departamento: TIntegerField;
    empregadoscod_emp_funcao: TIntegerField;
    empregadosnm_empregado: TWideStringField;
    empregadosnm_funcao: TWideStringField;
    empregadosdata_admissao: TDateField;
    empregadossalario: TFMTBCDField;
    empregadoscomissao: TFMTBCDField;
    dsEmpregadoPorDepartamento: TDataSource;
    empregadoPorDepartamento: TFDQuery;
    empregadoPorDepartamentoid_empregado: TIntegerField;
    empregadoPorDepartamentonm_empregado: TWideStringField;
    empregadoPorDepartamentodata_admissao: TDateField;
    empregadoPorDepartamentosalario: TFMTBCDField;
    empregadoPorDepartamentocomissao: TFMTBCDField;
    empregadoPorDepartamentodescricao_funcao: TWideStringField;
    empregadoPorDepartamentonm_departamento: TWideStringField;
    empregadoPorDepartamentolocal: TWideStringField;
    pgcCadastro: TPageControl;
    tsCadastroDepartamento: TTabSheet;
    stNomeCadastroDepartamento: TStaticText;
    stCadastroLocal: TStaticText;
    btnGravarDepartamento: TButton;
    btnCancelarDepartamento: TButton;
    tsCadastroEmpregados: TTabSheet;
    stNomeEmpregado: TStaticText;
    stNomeDepartamento: TStaticText;
    stFuncao: TStaticText;
    stDataAdmissao: TStaticText;
    btnCancelar: TButton;
    btnGravar: TButton;
    stSalario: TStaticText;
    edtNomeEmpregado: TDBEdit;
    edtSalario: TDBEdit;
    edtDataAdmissao: TDBEdit;
    cbDepartamento: TDBLookupComboBox;
    cbFuncao: TDBLookupComboBox;
    tsRelatorio: TTabSheet;
    dbgRelatorio: TDBGrid;
    edtNomeDepartamento: TDBEdit;
    edtNomeLocal: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure tsCadastroEmpregadosShow(Sender: TObject);
    procedure tsCadastroDepartamentosShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure empregadosdata_admissaoSetText(Sender: TField;
      const Text: string);
    procedure tsRelatorioShow(Sender: TObject);
    procedure btnCancelarDepartamentoClick(Sender: TObject);
    procedure btnGravarDepartamentoClick(Sender: TObject);
    procedure tsCadastroDepartamentoShow(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirTabelas;
    procedure ValidarCamposEmpregados;
    procedure ValidarCamposDepartamentos;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AbrirTabelas;
begin
  departamentos.Close;
  departamentos.Open;

  empregado_funcao.Close;
  empregado_funcao.Open;  

  empregados.Close;
  empregados.Open;

  empregadoPorDepartamento.Close;
  empregadoPorDepartamento.Open;
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  empregados.Cancel;
  empregados.Insert;
end;

procedure TForm1.btnCancelarDepartamentoClick(Sender: TObject);
begin
  departamentos.Cancel;
  departamentos.Insert;
end;

procedure TForm1.btnGravarClick(Sender: TObject);
begin
  ValidarCamposEmpregados;
  
  empregados.Post;  
  empregados.insert;
end;

procedure TForm1.btnGravarDepartamentoClick(Sender: TObject);
begin
  ValidarCamposDepartamentos;
  
  departamentos.Post;  
  departamentos.insert;
end;

procedure TForm1.empregadosdata_admissaoSetText(Sender: TField;
  const Text: string);
begin
  try
    sender.Value := StrToDate(edtDataAdmissao.Text);
  except
    ShowMessage('Data Inválida');
    Exit;
  end;  
end;

procedure TForm1.tsCadastroEmpregadosShow(Sender: TObject);
begin
  AbrirTabelas;  
  empregados.Insert;
end;

procedure TForm1.tsCadastroDepartamentoShow(Sender: TObject);
begin
  AbrirTabelas;
  departamentos.Insert;
end;

procedure TForm1.tsCadastroDepartamentosShow(Sender: TObject);
begin
  AbrirTabelas;
  departamentos.Insert;
end;

procedure TForm1.tsRelatorioShow(Sender: TObject);
begin
  AbrirTabelas;
end;

procedure TForm1.ValidarCamposEmpregados;
begin
  if edtNomeEmpregado.Text = ''  then
  begin
    ShowMessage('Preencher o campo Nome Empregado.');
    abort;
  end;

  if cbDepartamento.Text = ''  then
  begin
    ShowMessage('Preencher o campo Departamento.');
    abort;
  end;

  if cbFuncao.Text = ''  then
  begin
    ShowMessage('Preencher o campo Função.');
    abort;
  end;
  
  if edtSalario.Text = ''  then
  begin
    ShowMessage('Preencher o campo Salário.');
    abort;
  end;

  if edtDataAdmissao.Text = '  /  /    '  then
  begin
    ShowMessage('Preencher o campo Data Admissão.');
    abort;
  end;
end;

procedure TForm1.ValidarCamposDepartamentos;
begin
  if edtNomeDepartamento.Text = ''  then
  begin
    ShowMessage('Preencha o nome do departamento.');
    abort;
  end;
  if  edtNomeLocal.Text = ' ' then
  begin
    ShowMessage('Preencha o nome do local.');
    abort;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Conexao.Open;
  pgcCadastro.ActivePage := tsCadastroDepartamento;
end;

end.
