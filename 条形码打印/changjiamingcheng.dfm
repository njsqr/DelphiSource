object Form3: TForm3
  Left = 345
  Top = 222
  Width = 527
  Height = 345
  BorderIcons = [biSystemMenu]
  Caption = #35774#32622#21378#23478#21517#31216
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
  object Button1: TButton
    Left = 416
    Top = 40
    Width = 75
    Height = 26
    Caption = #22686#21152
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 416
    Top = 104
    Width = 75
    Height = 26
    Caption = #20462#25913
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 416
    Top = 168
    Width = 75
    Height = 26
    Caption = #21024#38500
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 416
    Top = 232
    Width = 75
    Height = 26
    Caption = #20851#38381
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 16
    Width = 385
    Height = 281
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = [fsBold]
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        Title.Caption = #24037#21378#20195#30721
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #24037#21378#21517#31216
        Width = 250
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 440
  end
  object ADOTable1: TADOTable
    Connection = Form1.ADOConnection1
    Left = 392
  end
end
