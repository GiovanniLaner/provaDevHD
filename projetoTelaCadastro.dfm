object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'frmCadastroEmpregados'
  ClientHeight = 676
  ClientWidth = 1106
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object cadastroEmpregadoDepartamento: TPanel
    Left = 0
    Top = 0
    Width = 1106
    Height = 41
    Align = alTop
    Caption = 'Cadastros de Empregados e Departamentos'
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 624
  end
  object pgcCadastro: TPageControl
    Left = 0
    Top = 41
    Width = 1106
    Height = 635
    ActivePage = tsRelatorio
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 905
    ExplicitHeight = 552
    object tsCadastroDepartamento: TTabSheet
      Caption = 'Cadastro de departamentos'
      OnShow = tsCadastroDepartamentoShow
      object stNomeCadastroDepartamento: TStaticText
        Left = 16
        Top = 20
        Width = 135
        Height = 19
        Caption = 'Nome do departamento:'
        TabOrder = 0
      end
      object stCadastroLocal: TStaticText
        Left = 16
        Top = 49
        Width = 35
        Height = 19
        Caption = 'Local:'
        TabOrder = 1
      end
      object btnGravarDepartamento: TButton
        Left = 112
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 2
        OnClick = btnGravarDepartamentoClick
      end
      object btnCancelarDepartamento: TButton
        Left = 203
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = btnCancelarDepartamentoClick
      end
      object edtNomeDepartamento: TDBEdit
        Left = 157
        Top = 16
        Width = 121
        Height = 23
        CharCase = ecUpperCase
        DataField = 'nm_departamento'
        DataSource = dsDepartamentos
        TabOrder = 4
      end
      object edtNomeLocal: TDBEdit
        Left = 157
        Top = 45
        Width = 121
        Height = 23
        CharCase = ecUpperCase
        DataField = 'local'
        DataSource = dsDepartamentos
        TabOrder = 5
      end
    end
    object tsCadastroEmpregados: TTabSheet
      Caption = 'Cadastro de empregados'
      ImageIndex = 1
      OnShow = tsCadastroEmpregadosShow
      object stNomeEmpregado: TStaticText
        Left = 0
        Top = 7
        Width = 121
        Height = 19
        Caption = 'Nome do empregado:'
        TabOrder = 0
      end
      object stNomeDepartamento: TStaticText
        Left = 0
        Top = 36
        Width = 135
        Height = 19
        Caption = 'Nome do departamento:'
        TabOrder = 1
      end
      object stFuncao: TStaticText
        Left = 0
        Top = 65
        Width = 46
        Height = 19
        Caption = 'Fun'#231#227'o:'
        TabOrder = 2
      end
      object stDataAdmissao: TStaticText
        Left = 0
        Top = 125
        Width = 100
        Height = 19
        Caption = 'Data de admiss'#227'o:'
        TabOrder = 3
      end
      object btnCancelar: TButton
        Left = 510
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 4
        OnClick = btnCancelarClick
      end
      object btnGravar: TButton
        Left = 416
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 5
        OnClick = btnGravarClick
      end
      object stSalario: TStaticText
        Left = 0
        Top = 94
        Width = 39
        Height = 19
        Caption = 'Sal'#225'rio'
        TabOrder = 6
      end
      object edtNomeEmpregado: TDBEdit
        Left = 160
        Top = 2
        Width = 409
        Height = 23
        CharCase = ecUpperCase
        DataField = 'nm_empregado'
        DataSource = dsEmpregados
        TabOrder = 7
      end
      object edtSalario: TDBEdit
        Left = 160
        Top = 89
        Width = 409
        Height = 23
        CharCase = ecUpperCase
        DataField = 'salario'
        DataSource = dsEmpregados
        TabOrder = 8
      end
      object edtDataAdmissao: TDBEdit
        Left = 160
        Top = 118
        Width = 409
        Height = 23
        CharCase = ecUpperCase
        DataField = 'data_admissao'
        DataSource = dsEmpregados
        TabOrder = 9
      end
      object cbDepartamento: TDBLookupComboBox
        Left = 160
        Top = 31
        Width = 409
        Height = 23
        DataField = 'cod_departamento'
        DataSource = dsEmpregados
        KeyField = 'id_departamento'
        ListField = 'nm_departamento'
        ListSource = dsDepartamentos
        TabOrder = 10
      end
      object cbFuncao: TDBLookupComboBox
        Left = 160
        Top = 60
        Width = 409
        Height = 23
        DataField = 'cod_emp_funcao'
        DataSource = dsEmpregados
        KeyField = 'id_funcao'
        ListField = 'descricao_funcao'
        ListSource = dsEmpregadoFuncao
        TabOrder = 11
      end
    end
    object tsRelatorio: TTabSheet
      Caption = 'Relat'#243'rio'
      ImageIndex = 2
      OnShow = tsRelatorioShow
      object dbgRelatorio: TDBGrid
        Left = 0
        Top = 0
        Width = 1098
        Height = 605
        Align = alClient
        DataSource = dsEmpregadoPorDepartamento
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id_empregado'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_empregado'
            Title.Caption = 'Empregado'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_admissao'
            Title.Caption = 'Data de admiss'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'salario'
            Title.Caption = 'Sal'#225'rio'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'comissao'
            Title.Caption = 'Comiss'#227'o'
            Width = 184
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao_funcao'
            Title.Caption = 'Fun'#231#227'o'
            Width = 166
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_departamento'
            Title.Caption = 'Departamento'
            Width = 178
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'local'
            Title.Caption = 'Local'
            Width = 280
            Visible = True
          end>
      end
    end
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=bancoProva'
      'User_Name=postgres'
      'Password=postgres'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 992
    Top = 128
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 956
    Top = 128
  end
  object dsEmpregados: TDataSource
    DataSet = empregados
    Left = 826
    Top = 153
  end
  object empregados: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from empregados'
      '')
    Left = 863
    Top = 154
    object empregadosid_empregado: TIntegerField
      FieldName = 'id_empregado'
      Origin = 'id_empregado'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object empregadoscod_departamento: TIntegerField
      FieldName = 'cod_departamento'
      Origin = 'cod_departamento'
    end
    object empregadoscod_emp_funcao: TIntegerField
      FieldName = 'cod_emp_funcao'
      Origin = 'cod_emp_funcao'
    end
    object empregadosnm_empregado: TWideStringField
      FieldName = 'nm_empregado'
      Origin = 'nm_empregado'
      Size = 100
    end
    object empregadosnm_funcao: TWideStringField
      FieldName = 'nm_funcao'
      Origin = 'nm_funcao'
      Size = 100
    end
    object empregadosdata_admissao: TDateField
      FieldName = 'data_admissao'
      Origin = 'data_admissao'
      OnSetText = empregadosdata_admissaoSetText
      EditMask = '!##/##/####;1;_'
    end
    object empregadossalario: TFMTBCDField
      FieldName = 'salario'
      Origin = 'salario'
      Precision = 64
      Size = 0
    end
    object empregadoscomissao: TFMTBCDField
      FieldName = 'comissao'
      Origin = 'comissao'
      Precision = 64
      Size = 0
    end
  end
  object departamentos: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from departamentos'
      '')
    Left = 863
    Top = 210
  end
  object dsDepartamentos: TDataSource
    DataSet = departamentos
    Left = 826
    Top = 211
  end
  object empregado_funcao: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from empregado_funcao'
      '')
    Left = 863
    Top = 267
  end
  object dsEmpregadoFuncao: TDataSource
    DataSet = empregado_funcao
    Left = 826
    Top = 267
  end
  object dsEmpregadoPorDepartamento: TDataSource
    DataSet = empregadoPorDepartamento
    Left = 824
    Top = 328
  end
  object empregadoPorDepartamento: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from empregados e '
      
        'INNER JOIN empregado_funcao as ef on (e.cod_emp_funcao) = (ef.id' +
        '_funcao)'
      
        'INNER JOIN departamentos as d on (e.cod_departamento) = (d.id_de' +
        'partamento)'
      '')
    Left = 864
    Top = 328
    object empregadoPorDepartamentoid_empregado: TIntegerField
      FieldName = 'id_empregado'
      Origin = 'id_empregado'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object empregadoPorDepartamentonm_empregado: TWideStringField
      FieldName = 'nm_empregado'
      Origin = 'nm_empregado'
      Size = 100
    end
    object empregadoPorDepartamentodata_admissao: TDateField
      FieldName = 'data_admissao'
      Origin = 'data_admissao'
    end
    object empregadoPorDepartamentosalario: TFMTBCDField
      FieldName = 'salario'
      Origin = 'salario'
      Precision = 64
      Size = 0
    end
    object empregadoPorDepartamentocomissao: TFMTBCDField
      FieldName = 'comissao'
      Origin = 'comissao'
      Precision = 64
      Size = 0
    end
    object empregadoPorDepartamentodescricao_funcao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao_funcao'
      Origin = 'descricao_funcao'
      Size = 100
    end
    object empregadoPorDepartamentonm_departamento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nm_departamento'
      Origin = 'nm_departamento'
      Size = 100
    end
    object empregadoPorDepartamentolocal: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'local'
      Origin = '"local"'
      Size = 100
    end
  end
end
