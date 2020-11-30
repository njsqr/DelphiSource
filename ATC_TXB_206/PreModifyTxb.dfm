object PreModifyTxbFrm: TPreModifyTxbFrm
  Left = 189
  Top = 150
  Width = 250
  Height = 265
  Caption = #29305#24615#34920#20462#25913#26465#20214
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 168
    Height = 24
    Caption = #29305#24615#34920#20462#25913#31995#32479
    Font.Charset = GB2312_CHARSET
    Font.Color = clMaroon
    Font.Height = -24
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 48
    Width = 241
    Height = 153
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 128
      Width = 56
      Height = 14
      Caption = #20135#21697#22411#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 8
      Width = 225
      Height = 105
      Caption = #25152#23646#31995#21015
      Columns = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Items.Strings = (
        '066'
        '066D'
        '086'
        '106K'
        '106'
        '166'
        '206')
      ParentFont = False
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object ComboBox1: TComboBox
      Left = 104
      Top = 125
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      ItemHeight = 13
      TabOrder = 1
      Text = 'NULL'
      OnKeyPress = ComboBox1KeyPress
    end
  end
  object Button2: TButton
    Left = 120
    Top = 205
    Width = 121
    Height = 25
    Caption = #36820'  '#22238
    Font.Charset = GB2312_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 0
    Top = 205
    Width = 121
    Height = 25
    Caption = #25353#26465#20214#20462#25913
    Font.Charset = GB2312_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
end
