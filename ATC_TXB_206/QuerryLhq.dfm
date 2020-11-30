object QuerryLhqFrm: TQuerryLhqFrm
  Left = 181
  Top = 136
  Width = 579
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
    Width = 571
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
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 128
      Height = 16
      Caption = #35201#26597#35810#30340#38646#20214#20195#21495
    end
    object Edit1: TEdit
      Left = 153
      Top = 72
      Width = 168
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
    object Button1: TButton
      Left = 364
      Top = 70
      Width = 75
      Height = 25
      Caption = #26597' '#35810
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 469
      Top = 70
      Width = 75
      Height = 25
      Caption = #36820' '#22238
      TabOrder = 2
      OnClick = Button2Click
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 18
      Width = 505
      Height = 41
      Caption = #25152#23646#31995#21015
      Columns = 7
      Items.Strings = (
        '066'
        '086'
        '106'
        '066D'
        '106K'
        '166'
        '206')
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 105
    Width = 571
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
      Width = 553
      Height = 137
      Color = clCream
      DefaultColWidth = 105
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
      Width = 550
      Height = 169
      Color = clCream
      ColCount = 4
      DefaultColWidth = 131
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
