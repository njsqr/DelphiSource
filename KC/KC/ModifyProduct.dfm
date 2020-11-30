object ModifyProductFrm: TModifyProductFrm
  Left = 269
  Top = 82
  Width = 458
  Height = 270
  Caption = #20462#25913#36135#21697#20449#24687
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
    Left = 16
    Top = 64
    Width = 417
    Height = 153
    Caption = #20462#25913#35813#36135#21697#20449#24687
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 48
      Height = 13
      Caption = #36135#21697#21517#31216
    end
    object Label2: TLabel
      Left = 216
      Top = 32
      Width = 48
      Height = 13
      Caption = #36135#21697#31867#21035
    end
    object Label3: TLabel
      Left = 24
      Top = 64
      Width = 48
      Height = 13
      Caption = #36135#21697#35268#26684
    end
    object Label4: TLabel
      Left = 216
      Top = 64
      Width = 48
      Height = 13
      Caption = #35745#37327#21333#20301
    end
    object Label5: TLabel
      Left = 24
      Top = 96
      Width = 48
      Height = 13
      Caption = #24213#32447#24211#23384
    end
    object Label6: TLabel
      Left = 216
      Top = 96
      Width = 48
      Height = 13
      Caption = #39640#32447#24211#23384
    end
    object DBEdit1: TDBEdit
      Left = 80
      Top = 32
      Width = 121
      Height = 21
      DataField = 'ProductName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 80
      Top = 64
      Width = 121
      Height = 21
      DataField = 'Spec'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 272
      Top = 64
      Width = 121
      Height = 21
      DataField = 'Unit'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 80
      Top = 96
      Width = 121
      Height = 21
      DataField = 'Min_sto'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 272
      Top = 96
      Width = 121
      Height = 21
      DataField = 'Max_sto'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBComboBox1: TDBComboBox
      Left = 272
      Top = 32
      Width = 121
      Height = 21
      DataField = 'Class'
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        #21407#26009#24211#23384
        #20135#21697#24211#23384)
      TabOrder = 5
    end
  end
  object Button1: TButton
    Left = 256
    Top = 24
    Width = 49
    Height = 25
    Caption = #20462#25913
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 320
    Top = 24
    Width = 49
    Height = 25
    Caption = #21024#38500
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 384
    Top = 24
    Width = 49
    Height = 25
    Caption = #36820#22238
    TabOrder = 3
    OnClick = Button3Click
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 24
    Width = 224
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 160
    Top = 8
  end
  object ADOTable1: TADOTable
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Product'
    Left = 112
    Top = 8
  end
end
