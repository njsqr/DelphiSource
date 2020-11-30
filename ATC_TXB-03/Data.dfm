object DataM: TDataM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 114
  Height = 369
  Width = 199
  object ADOConnection2: TADOConnection
    Left = 32
    Top = 8
  end
  object txb: TADOQuery
    Parameters = <>
    Left = 128
    Top = 8
  end
  object DataSource6: TDataSource
    DataSet = TXB_Tab
    Left = 24
    Top = 72
  end
  object TXB_Tab: TADOTable
    Left = 128
    Top = 64
  end
  object ADOConnection1: TADOConnection
    Left = 32
    Top = 176
  end
  object Lhq_Tab: TADOTable
    Left = 128
    Top = 176
  end
  object Lhq_Que: TADOQuery
    Parameters = <>
    Left = 136
    Top = 256
  end
  object DataSource1: TDataSource
    Left = 32
    Top = 256
  end
end
