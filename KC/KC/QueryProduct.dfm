object QueryProductFrm: TQueryProductFrm
  Left = 186
  Top = 138
  Width = 532
  Height = 375
  Caption = #26597#35810#36135#21697#20449#24687
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
    Top = 16
    Width = 489
    Height = 65
    Caption = #26597#35810#26465#20214
    TabOrder = 0
    object Button1: TButton
      Left = 344
      Top = 24
      Width = 49
      Height = 25
      Caption = #26597#35810
      TabOrder = 0
      OnClick = Button1Click
    end
    object RadioButton1: TRadioButton
      Left = 24
      Top = 24
      Width = 113
      Height = 17
      Caption = #36135#21697#21517#31216
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 232
      Top = 24
      Width = 89
      Height = 17
      Caption = #20840#37096#36135#21697
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 104
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object Button2: TButton
      Left = 408
      Top = 24
      Width = 49
      Height = 25
      Caption = #36820#22238
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 104
    Width = 489
    Height = 201
    Caption = #26597#35810#32467#26524
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 16
      Top = 24
      Width = 465
      Height = 153
      ColCount = 7
      TabOrder = 0
    end
  end
end
