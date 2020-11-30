object Form4: TForm4
  Left = 243
  Top = 153
  Width = 526
  Height = 346
  BorderIcons = [biSystemMenu]
  Caption = #35774#32622#37096#20214#21517#31216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 16
    Width = 497
    Height = 241
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = #23435#20307
    TitleFont.Style = [fsBold]
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #24037#21378#20195#30721
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #37096#20214#20195#30721
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = #37096#20214#21517#31216
        Width = 180
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 32
    Top = 272
    Width = 75
    Height = 26
    Caption = #22686#21152
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 157
    Top = 272
    Width = 75
    Height = 26
    Caption = #20462#25913
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 282
    Top = 272
    Width = 75
    Height = 26
    Caption = #21024#38500
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 408
    Top = 272
    Width = 75
    Height = 26
    Caption = #20851#38381
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button4Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 416
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 384
  end
  object ADOTable1: TADOTable
    Connection = Form1.ADOConnection1
    Left = 352
    Top = 256
  end
end
