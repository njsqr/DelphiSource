object ModifyDepotFrm: TModifyDepotFrm
  Left = 189
  Top = 158
  Width = 427
  Height = 235
  Caption = #20462#25913#20179#24211#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 56
    Width = 385
    Height = 129
    Caption = #20462#25913#20179#24211#20449#24687
    TabOrder = 0
    object Label1: TLabel
      Left = 80
      Top = 24
      Width = 57
      Height = 13
      Caption = #20179' '#24211' '#21517' '#31216
    end
    object Label2: TLabel
      Left = 80
      Top = 56
      Width = 57
      Height = 13
      Caption = #20179' '#24211' '#20301' '#32622
    end
    object Label3: TLabel
      Left = 80
      Top = 88
      Width = 60
      Height = 13
      Caption = #20179#24211#36127#36131#20154
    end
    object DBEdit1: TDBEdit
      Left = 152
      Top = 24
      Width = 121
      Height = 21
      DataField = 'DepotName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 152
      Top = 56
      Width = 121
      Height = 21
      DataField = 'Address'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 152
      Top = 88
      Width = 121
      Height = 21
      DataField = 'Principal'
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 24
    Width = 176
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 1
  end
  object Button1: TButton
    Left = 216
    Top = 24
    Width = 57
    Height = 25
    Caption = #20462#25913
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 280
    Top = 24
    Width = 57
    Height = 25
    Caption = #21024#38500
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 344
    Top = 24
    Width = 57
    Height = 25
    Caption = #36820#22238
    TabOrder = 4
    OnClick = Button3Click
  end
  object ADOTable1: TADOTable
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Depot'
    Left = 184
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 224
  end
end
