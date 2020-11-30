object QuerryLhqFrm: TQuerryLhqFrm
  Left = 183
  Top = 174
  Width = 524
  Height = 506
  Caption = #31163#21512#22120#26597#35810#31995#32479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 516
    Height = 105
    Align = alTop
    Caption = #26597#35810#26465#20214
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Edit1: TEdit
      Left = 105
      Top = 24
      Width = 121
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'LHQ-'
      OnKeyPress = Edit1KeyPress
    end
    object RadioButton1: TRadioButton
      Left = 24
      Top = 24
      Width = 73
      Height = 17
      Caption = #31163#21512#22120
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 356
      Top = 24
      Width = 121
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'W -00-16'
      OnKeyDown = Edit2KeyDown
    end
    object RadioButton2: TRadioButton
      Left = 267
      Top = 24
      Width = 70
      Height = 17
      Caption = #24863#28201#21253
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Button1: TButton
      Left = 326
      Top = 66
      Width = 75
      Height = 25
      Caption = #26597' '#35810
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 416
      Top = 66
      Width = 75
      Height = 25
      Caption = #36820' '#22238
      TabOrder = 5
      OnClick = Button2Click
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 56
      Width = 297
      Height = 41
      Caption = #25152#23646#31995#21015
      Columns = 3
      Items.Strings = (
        '066'
        '086'
        '106')
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 516
    Height = 367
    Align = alClient
    Caption = #26597#35810#32467#26524
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 169
      Width = 192
      Height = 16
      Caption = #20844#21496#24211#23384#31163#21512#22120#32467#23384#25968#37327#65306
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 24
      Width = 505
      Height = 137
      Color = clCream
      DefaultColWidth = 96
      FixedCols = 0
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      RowHeights = (
        24
        24
        24
        24
        24)
    end
    object StringGrid2: TStringGrid
      Left = 11
      Top = 192
      Width = 505
      Height = 169
      Color = clCream
      ColCount = 4
      DefaultColWidth = 120
      FixedCols = 0
      RowCount = 6
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      RowHeights = (
        24
        24
        24
        24
        24
        24)
    end
  end
end
