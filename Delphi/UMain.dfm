object frmmain: Tfrmmain
  Left = 170
  Top = 116
  Width = 261
  Height = 218
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Print 39BarCode'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object imgview: TImage
    Left = 8
    Top = 8
    Width = 209
    Height = 81
  end
  object btnview: TBitBtn
    Left = 8
    Top = 128
    Width = 73
    Height = 25
    Caption = 'View(&V)'
    TabOrder = 0
    OnClick = btnviewClick
  end
  object edtprint: TEdit
    Left = 8
    Top = 98
    Width = 161
    Height = 21
    TabOrder = 1
    Text = '*1245abcd*'
  end
  object btnprint: TBitBtn
    Left = 88
    Top = 128
    Width = 65
    Height = 25
    Caption = 'Print(&P)'
    TabOrder = 2
  end
end
