object ReportFrm: TReportFrm
  Left = 216
  Top = 149
  Width = 544
  Height = 328
  Caption = #25253#34920#32479#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 32
    Top = 32
    Width = 473
    Height = 233
    Caption = #25253#34920#36873#25321
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 40
      Width = 89
      Height = 49
      Caption = #36135#21697#20449#24687#25253#34920
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 136
      Top = 40
      Width = 89
      Height = 49
      Caption = #20179#24211#20449#24687#25253#34920
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 248
      Top = 40
      Width = 89
      Height = 49
      Caption = #20379#36135#21333#20301#25253#34920
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 360
      Top = 40
      Width = 89
      Height = 49
      Caption = #25910#36135#21333#20301#25253#34920
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 24
      Top = 128
      Width = 89
      Height = 49
      Caption = #20837#24211#20449#24687#25253#34920
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 136
      Top = 128
      Width = 89
      Height = 49
      Caption = #20986#24211#20449#24687#25253#34920
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 248
      Top = 128
      Width = 89
      Height = 49
      Caption = #24211#23384#20449#24687#25253#34920
      TabOrder = 6
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 360
      Top = 128
      Width = 89
      Height = 49
      Caption = #36820'      '#22238
      TabOrder = 7
      OnClick = Button8Click
    end
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = '.\report\report.rav'
    Left = 136
    Top = 8
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOTable1
    Left = 88
    Top = 48
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Product'
    Left = 120
    Top = 48
  end
  object ADOTable2: TADOTable
    Active = True
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Depot'
    Left = 232
    Top = 48
  end
  object RvDataSetConnection2: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOTable2
    Left = 192
    Top = 48
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 184
    Top = 8
  end
  object RvDataSetConnection3: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOTable3
    Left = 304
    Top = 48
  end
  object RvDataSetConnection4: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOTable4
    Left = 416
    Top = 48
  end
  object RvDataSetConnection5: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOTable5
    Left = 72
    Top = 144
  end
  object RvDataSetConnection6: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOTable6
    Left = 192
    Top = 144
  end
  object RvDataSetConnection7: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOTable7
    Left = 304
    Top = 144
  end
  object ADOTable3: TADOTable
    Active = True
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Feeder'
    Left = 344
    Top = 48
  end
  object ADOTable4: TADOTable
    Active = True
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Customer'
    Left = 456
    Top = 48
  end
  object ADOTable5: TADOTable
    Active = True
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Stock'
    Left = 112
    Top = 144
  end
  object ADOTable6: TADOTable
    Active = True
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Sell'
    Left = 224
    Top = 144
  end
  object ADOTable7: TADOTable
    Active = True
    Connection = LoginFrm.ADOConnection1
    CursorType = ctStatic
    TableName = 'Storage'
    Left = 344
    Top = 144
  end
end
