object QueryStorageFrm: TQueryStorageFrm
  Left = 181
  Top = 153
  Width = 544
  Height = 391
  Caption = #26597#35810#24211#23384
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
      Caption = #20179#24211#21517#31216
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 184
      Top = 24
      Width = 97
      Height = 17
      Caption = #36135#21697#21517#31216
      TabOrder = 1
    end
    object Button1: TButton
      Left = 384
      Top = 24
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 384
      Top = 56
      Width = 75
      Height = 25
      Caption = #36820#22238
      TabOrder = 3
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 96
      Top = 24
      Width = 73
      Height = 21
      TabOrder = 4
    end
    object Edit2: TEdit
      Left = 264
      Top = 24
      Width = 73
      Height = 21
      TabOrder = 5
    end
    object RadioButton3: TRadioButton
      Left = 24
      Top = 64
      Width = 113
      Height = 17
      Caption = #20840#37096' '#24211#23384#20449#24687
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 131
    Width = 473
    Height = 233
    Caption = #26597#35810#32467#26524
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 8
      Top = 24
      Width = 449
      Height = 185
      ColCount = 8
      TabOrder = 0
    end
  end
end
