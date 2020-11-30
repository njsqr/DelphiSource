object ModifySellFrm: TModifySellFrm
  Left = 317
  Top = 112
  Width = 593
  Height = 400
  Caption = #20462#25913#20986#24211#20449#24687
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
  object Groupbox1: TGroupBox
    Left = 24
    Top = 56
    Width = 273
    Height = 289
    Caption = #35835#21462#20986#24211#36873#25321
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 72
      Height = 13
      Caption = #21463#36135#21333#20301#32534#21495
    end
    object Label2: TLabel
      Left = 32
      Top = 64
      Width = 72
      Height = 13
      Caption = #25910#36135#21333#20301#21517#31216
    end
    object Label3: TLabel
      Left = 32
      Top = 96
      Width = 66
      Height = 13
      Caption = #20179'  '#24211'  '#32534'  '#21495
    end
    object Label4: TLabel
      Left = 32
      Top = 128
      Width = 66
      Height = 13
      Caption = #20179'  '#24211'  '#21517'  '#31216
    end
    object Label5: TLabel
      Left = 32
      Top = 160
      Width = 72
      Height = 13
      Caption = #20986#24211#36135#21697#32534#21495
    end
    object Label6: TLabel
      Left = 32
      Top = 192
      Width = 72
      Height = 13
      Caption = #20986#24211#36135#21697#21517#31216
    end
    object Label7: TLabel
      Left = 32
      Top = 224
      Width = 72
      Height = 13
      Caption = #20986#24211#36135#21697#35268#26684
    end
    object Label8: TLabel
      Left = 32
      Top = 256
      Width = 72
      Height = 13
      Caption = #36135#21697#35745#37327#21333#20301
    end
    object DBEdit1: TDBEdit
      Left = 112
      Top = 24
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'CustomerID'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'CustomerName'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 112
      Top = 88
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'DepotID'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 112
      Top = 120
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'DepotName'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 112
      Top = 152
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'ProductID'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 112
      Top = 184
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'ProductName'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 112
      Top = 216
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'Spec'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 112
      Top = 248
      Width = 121
      Height = 21
      Color = cl3DLight
      DataField = 'Unit'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 311
    Top = 64
    Width = 249
    Height = 281
    Caption = #20462#25913#20837#24211#20449#24687
    TabOrder = 1
    object Label9: TLabel
      Left = 32
      Top = 32
      Width = 48
      Height = 13
      Caption = #36135#21697#25968#37327
    end
    object Label10: TLabel
      Left = 32
      Top = 64
      Width = 48
      Height = 13
      Caption = #36135#21697#21333#20215
    end
    object Label11: TLabel
      Left = 32
      Top = 96
      Width = 48
      Height = 13
      Caption = #20986#24211#26102#38388
    end
    object Label12: TLabel
      Left = 32
      Top = 184
      Width = 48
      Height = 13
      Caption = #22791#27880#20449#24687
    end
    object DBMemo1: TDBMemo
      Left = 88
      Top = 128
      Width = 121
      Height = 145
      DataField = 'SellRemark'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit9: TDBEdit
      Left = 88
      Top = 24
      Width = 121
      Height = 21
      DataField = 'Quantity'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit10: TDBEdit
      Left = 88
      Top = 56
      Width = 121
      Height = 21
      DataField = 'UnitPrice'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit11: TDBEdit
      Left = 88
      Top = 88
      Width = 121
      Height = 21
      DataField = 'SellDate'
      DataSource = DataSource1
      TabOrder = 3
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 40
    Top = 24
    Width = 224
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 2
    OnClick = DBNavigator1Click
  end
  object Button1: TButton
    Left = 304
    Top = 24
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 392
    Top = 24
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 477
    Top = 24
    Width = 75
    Height = 25
    Caption = #36820#22238
    TabOrder = 5
    OnClick = Button3Click
  end
  object ADOTable1: TADOTable
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Sell'
    Left = 256
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 288
    Top = 64
  end
end
