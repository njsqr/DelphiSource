object QueryDepotFrm: TQueryDepotFrm
  Left = 203
  Top = 165
  Width = 458
  Height = 361
  Caption = #26597#35810#20179#24211#20449#24687
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
    Width = 369
    Height = 113
    Caption = #26597#35810#26465#20214
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 48
      Top = 16
      Width = 81
      Height = 17
      Caption = #20179' '#24211' '#21517' '#31216
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 48
      Top = 48
      Width = 89
      Height = 17
      Caption = #20179#24211#36127#36131#20154
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 136
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 136
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object Button1: TButton
      Left = 272
      Top = 16
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 272
      Top = 48
      Width = 75
      Height = 25
      Caption = #36820#22238
      TabOrder = 5
      OnClick = Button2Click
    end
    object RadioButton3: TRadioButton
      Left = 48
      Top = 80
      Width = 113
      Height = 17
      Caption = #20840' '#37096' '#20179' '#24211
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 152
    Width = 369
    Height = 169
    Caption = #26597#35810#32467#26524
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 24
      Top = 24
      Width = 320
      Height = 120
      ColCount = 4
      RowCount = 4
      TabOrder = 0
    end
  end
end
