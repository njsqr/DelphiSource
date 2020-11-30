object ModifyFeederFrm: TModifyFeederFrm
  Left = 200
  Top = 173
  Width = 557
  Height = 404
  Caption = #20462#25913#20379#36135#21333#20301#20449#24687
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
  object Button1: TButton
    Left = 264
    Top = 32
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 352
    Top = 32
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 432
    Top = 32
    Width = 75
    Height = 25
    Caption = #36820#22238
    TabOrder = 2
    OnClick = Button3Click
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 80
    Width = 473
    Height = 265
    Caption = #20462#25913#20379#36135#21333#20301#20449#24687
    TabOrder = 3
    object Label1: TLabel
      Left = 40
      Top = 48
      Width = 60
      Height = 13
      Caption = #21333'  '#20301' '#21517' '#31216
    end
    object Label2: TLabel
      Left = 248
      Top = 48
      Width = 48
      Height = 13
      Caption = #21333#20301#22320#22336
    end
    object Label3: TLabel
      Left = 40
      Top = 88
      Width = 60
      Height = 13
      Caption = #32852#31995#20154#22995#21517
    end
    object Label4: TLabel
      Left = 248
      Top = 88
      Width = 48
      Height = 13
      Caption = #32852#31995#30005#35805
    end
    object Label5: TLabel
      Left = 40
      Top = 128
      Width = 57
      Height = 13
      Caption = #20256' '#30495' '#21495' '#30721
    end
    object Label6: TLabel
      Left = 248
      Top = 128
      Width = 48
      Height = 13
      Caption = #37038#25919#32534#30721
    end
    object Label7: TLabel
      Left = 40
      Top = 192
      Width = 57
      Height = 13
      Caption = #22791' '#27880' '#20449' '#24687
    end
    object DBEdit1: TDBEdit
      Left = 120
      Top = 48
      Width = 121
      Height = 21
      DataField = 'FeederName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 312
      Top = 48
      Width = 121
      Height = 21
      DataField = 'Address'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 120
      Top = 88
      Width = 121
      Height = 21
      DataField = 'LinkMan'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 312
      Top = 88
      Width = 121
      Height = 21
      DataField = 'Tel'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 120
      Top = 128
      Width = 121
      Height = 21
      DataField = 'Fax'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 312
      Top = 128
      Width = 121
      Height = 21
      DataField = 'Zipcode'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBMemo1: TDBMemo
      Left = 120
      Top = 168
      Width = 313
      Height = 65
      DataField = 'FeederRemark'
      DataSource = DataSource1
      TabOrder = 6
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 32
    Top = 32
    Width = 208
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 4
  end
  object ADOTable1: TADOTable
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Feeder'
    Left = 176
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 248
    Top = 8
  end
end
