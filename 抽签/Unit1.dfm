object Form1: TForm1
  Left = 192
  Top = 114
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 80
    Width = 616
    Height = 56
    Caption = #35013#37197#36710#38388#26377#22870#22238#31572#25277#31614#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -56
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 168
    Top = 188
    Width = 70
    Height = 37
    Caption = #24207#21495
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = #21326#25991#34892#26999
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 496
    Top = 188
    Width = 70
    Height = 37
    Caption = #22995#21517
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = #21326#25991#34892#26999
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 184
    Top = 464
    Width = 225
    Height = 73
    Caption = #25277'  '#31614
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 568
    Top = 464
    Width = 209
    Height = 73
    Caption = #36864'  '#20986
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBEdit1: TDBEdit
    Left = 232
    Top = 248
    Width = 153
    Height = 105
    DataField = #24207#21495
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -96
    Font.Name = #40657#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 544
    Top = 248
    Width = 313
    Height = 105
    DataField = #22995#21517
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -96
    Font.Name = #40657#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 72
    Top = 40
  end
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\'#25277#31614'\ren.mdb;Persi' +
      'st Security Info=False'
    CursorType = ctStatic
    TableName = 're'
    Left = 72
    Top = 120
  end
end
