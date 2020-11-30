object Form1: TForm1
  Left = 192
  Top = 130
  Width = 1088
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 112
    Top = 24
    Width = 129
    Height = 33
    Caption = 'execel'#23548#20837'access'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 752
    Top = 24
    Width = 97
    Height = 25
    Caption = #26174#31034'access'
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 80
    Top = 136
    Width = 913
    Height = 120
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button3: TButton
    Left = 120
    Top = 376
    Width = 201
    Height = 41
    Caption = #29992'dbgrid'#23558'access'#23548#20986#21040'excel'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\'#30003#35831#20154'\Deskto' +
      'p\exess\test.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 736
    Top = 72
  end
  object ADOConnection2: TADOConnection
    LoginPrompt = False
    Left = 304
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 792
    Top = 72
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection2
    Parameters = <>
    Left = 376
    Top = 24
  end
  object OpenDialog1: TOpenDialog
    Left = 544
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 840
    Top = 72
  end
  object SaveDialog1: TSaveDialog
    Left = 672
    Top = 40
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    DataSource = DataSource1
    Parameters = <>
    Left = 888
    Top = 48
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    TableName = 'sp'
    Left = 936
    Top = 88
  end
end
