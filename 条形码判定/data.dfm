object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 114
  Height = 371
  Width = 218
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 32
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 128
    Top = 16
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'table10'
    Left = 24
    Top = 80
  end
end
