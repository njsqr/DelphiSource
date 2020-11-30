object AddProductFrm: TAddProductFrm
  Left = 376
  Top = 86
  Width = 458
  Height = 247
  Caption = #28155#21152#36135#21697#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 16
    Width = 417
    Height = 177
    Caption = #22635#20889#36135#21697#20449#24687
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
    object Edit1: TEdit
      Left = 80
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 80
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 272
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 80
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object Edit5: TEdit
      Left = 272
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object Button1: TButton
      Left = 64
      Top = 136
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 184
      Top = 136
      Width = 75
      Height = 25
      Caption = #32487#32493#28155#21152
      TabOrder = 6
      OnClick = Button2Click
    end
    object ComboBox1: TComboBox
      Left = 272
      Top = 32
      Width = 121
      Height = 21
      DropDownCount = 2
      ItemHeight = 13
      TabOrder = 7
      Text = #21407#26009#24211#23384
      Items.Strings = (
        #21407#26009#24211#23384
        #20135#21697#24211#23384)
    end
    object Button3: TButton
      Left = 304
      Top = 136
      Width = 75
      Height = 25
      Caption = #36820#22238
      TabOrder = 8
      OnClick = Button3Click
    end
  end
end
