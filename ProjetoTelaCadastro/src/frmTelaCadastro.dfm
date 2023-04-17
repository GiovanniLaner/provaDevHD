object telaCadastro: TtelaCadastro
  Left = 0
  Top = 0
  Caption = 'Tela de cadastro'
  ClientHeight = 541
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object cabecalhoPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 817
    Height = 41
    Align = alTop
    TabOrder = 0
    object nomeTabela: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 40
      Height = 33
      Align = alLeft
      Alignment = taCenter
      Caption = 'Nome:'
      Layout = tlCenter
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 39
    end
    object editNome: TEdit
      AlignWithMargins = True
      Left = 47
      Top = 10
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object gravarAlteracao: TButton
      Left = 736
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = gravarAlteracaoClick
    end
  end
  object memoNome: TMemo
    Left = 8
    Top = 47
    Width = 809
    Height = 66
    TabOrder = 1
  end
end
