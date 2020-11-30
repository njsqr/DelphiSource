object ShortProductFrm: TShortProductFrm
  Left = 122
  Top = 81
  Width = 544
  Height = 342
  Caption = #30701#32447#36135#21697#20449#24687
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
    Width = 505
    Height = 241
    Caption = #30701#32447#36135#21697#20449#24687#21015#34920
    TabOrder = 0
    object StringGrid1: TStringGrid
      Left = 24
      Top = 24
      Width = 465
      Height = 193
      ColCount = 7
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 224
    Top = 272
    Width = 75
    Height = 25
    Caption = #36820#22238
    TabOrder = 1
    OnClick = Button1Click
  end
  object ADOQuery1: TADOQuery
    Connection = LoginFrm.ADOConnection1
    Parameters = <>
    Left = 248
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = LoginFrm.ADOConnection1
    Parameters = <>
    Left = 200
    Top = 8
  end
end
