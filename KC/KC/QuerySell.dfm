object QuerySellFrm: TQuerySellFrm
  Left = 167
  Top = 83
  Width = 540
  Height = 413
  Caption = #26597#35810#20986#24211#20449#24687
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
    Left = 32
    Top = 24
    Width = 473
    Height = 97
    Caption = #26597#35810#26465#20214
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 24
      Top = 24
      Width = 113
      Height = 17
      Caption = #36135#21697#21517#31216
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 24
      Top = 56
      Width = 97
      Height = 17
      Caption = #20179#24211#21517#31216
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 192
      Top = 24
      Width = 97
      Height = 17
      Caption = #25910#36135#21333#20301#21517#31216
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 192
      Top = 56
      Width = 113
      Height = 17
      Caption = #20840#37096#20986#24211#20449#24687
      TabOrder = 3
    end
    object Button1: TButton
      Left = 384
      Top = 24
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 384
      Top = 56
      Width = 75
      Height = 25
      Caption = #36820#22238
      TabOrder = 5
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 96
      Top = 24
      Width = 73
      Height = 21
      TabOrder = 6
    end
    object Edit2: TEdit
      Left = 96
      Top = 56
      Width = 73
      Height = 21
      TabOrder = 7
    end
    object Edit3: TEdit
      Left = 288
      Top = 24
      Width = 73
      Height = 21
      TabOrder = 8
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 139
    Width = 473
    Height = 233
    Caption = #26597#35810#32467#26524
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 8
      Top = 24
      Width = 449
      Height = 185
      ColCount = 14
      TabOrder = 0
    end
  end
end
