object F_login: TF_login
  Left = 351
  Top = 222
  Width = 281
  Height = 171
  Caption = #30331#24405
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    256
    136)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 39
    Top = 46
    Width = 84
    Height = 19
    Caption = #29992#25143#21517#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -19
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 39
    Top = 77
    Width = 63
    Height = 19
    Caption = #23494#12288#30721
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -19
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 10
    Top = 8
    Width = 232
    Height = 25
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #23398#29983#35838#31243#31649#29702#31995#32479#30331#24405
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object i_user: TEdit
    Left = 104
    Top = 44
    Width = 121
    Height = 21
    Hint = #35831#36755#20837#21592#24037#21495
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object i_passwd: TEdit
    Left = 104
    Top = 76
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 39
    Top = 111
    Width = 84
    Height = 27
    Caption = #30331'     '#24405
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 151
    Top = 112
    Width = 81
    Height = 25
    Cancel = True
    Caption = #36864#20986#31995#32479
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object T_user: TTable
    DatabaseName = 'dongling'
    TableName = 'dbo.user_pass'
    Left = 8
    Top = 72
  end
  object Database1: TDatabase
    AliasName = 'MyDB'
    Connected = True
    DatabaseName = 'dongling'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=red:D:\Database\MyDatabase.GDB'
      'USER NAME=SYSDBA'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=7880209')
    SessionName = 'Default'
    Left = 8
    Top = 40
  end
end
