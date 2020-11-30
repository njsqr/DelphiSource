object AddSellFrm: TAddSellFrm
  Left = 187
  Top = 119
  Width = 583
  Height = 380
  Caption = #28155#21152#20986#24211#20449#24687
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
    Top = 24
    Width = 273
    Height = 305
    Caption = #20986#24211#36873#25321
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 40
      Width = 72
      Height = 13
      Caption = #25910#36135#21333#20301#32534#21495
    end
    object Label2: TLabel
      Left = 24
      Top = 72
      Width = 72
      Height = 13
      Caption = #25910#36135#21333#20301#21517#31216
    end
    object Label4: TLabel
      Left = 24
      Top = 136
      Width = 66
      Height = 13
      Caption = #20179'  '#24211'  '#21517'  '#31216
    end
    object Label3: TLabel
      Left = 24
      Top = 104
      Width = 72
      Height = 13
      Caption = #36873#25321#20179#24211#32534#21495
    end
    object Label5: TLabel
      Left = 24
      Top = 168
      Width = 72
      Height = 13
      Caption = #20986#24211#36135#21697#32534#21495
    end
    object Label10: TLabel
      Left = 24
      Top = 200
      Width = 72
      Height = 13
      Caption = #20986#24211#36135#21697#21517#31216
    end
    object Label11: TLabel
      Left = 24
      Top = 232
      Width = 72
      Height = 13
      Caption = #20986#24211#36135#21697#35268#26684
    end
    object Label12: TLabel
      Left = 24
      Top = 264
      Width = 72
      Height = 13
      Caption = #36135#21697#35745#37327#21333#20301
    end
    object Edit1: TEdit
      Left = 104
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 104
      Top = 128
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 104
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 104
      Top = 224
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 104
      Top = 256
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'Edit5'
    end
    object ComboBox2: TComboBox
      Left = 104
      Top = 96
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = 'ComboBox2'
      OnChange = ComboBox2Change
    end
    object ComboBox3: TComboBox
      Left = 104
      Top = 160
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Text = 'ComboBox3'
      OnChange = ComboBox3Change
    end
    object ComboBox1: TComboBox
      Left = 104
      Top = 32
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 7
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 311
    Top = 24
    Width = 249
    Height = 265
    Caption = #20986#24211#20449#24687
    TabOrder = 1
    object Label7: TLabel
      Left = 24
      Top = 64
      Width = 48
      Height = 13
      Caption = #36135#21697#21333#20215
    end
    object Label8: TLabel
      Left = 24
      Top = 96
      Width = 48
      Height = 13
      Caption = #20986#24211#26102#38388
    end
    object Label9: TLabel
      Left = 24
      Top = 168
      Width = 48
      Height = 13
      Caption = #22791#27880#20449#24687
    end
    object Label6: TLabel
      Left = 24
      Top = 32
      Width = 48
      Height = 13
      Caption = #36135#21697#25968#37327
    end
    object Memo1: TMemo
      Left = 88
      Top = 128
      Width = 121
      Height = 121
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
    object MaskEdit1: TMaskEdit
      Left = 88
      Top = 88
      Width = 121
      Height = 21
      EditMask = '!9999/99/00;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '2003-08-28'
    end
    object Edit6: TEdit
      Left = 88
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit6'
    end
    object Edit7: TEdit
      Left = 88
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit7'
    end
  end
  object Button1: TButton
    Left = 312
    Top = 304
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 400
    Top = 304
    Width = 75
    Height = 25
    Caption = #32487#32493
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 493
    Top = 304
    Width = 75
    Height = 25
    Caption = #36820#22238
    TabOrder = 4
    OnClick = Button3Click
  end
  object ADOTable1: TADOTable
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Customer'
    Left = 256
    Top = 48
  end
  object ADOTable2: TADOTable
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Depot'
    Left = 256
    Top = 120
  end
  object ADOTable3: TADOTable
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Product'
    Left = 256
    Top = 184
  end
end
