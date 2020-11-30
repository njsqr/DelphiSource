object LoginFrm: TLoginFrm
  Left = 189
  Top = 133
  Width = 278
  Height = 230
  Caption = #29992#25143#30331#38470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 35
    Top = 16
    Width = 217
    Height = 24
    Caption = #24211#23384#31649#29702#20449#24687#31995#32479'        '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 64
    Width = 60
    Height = 16
    Caption = #29992#25143#21517#65306'    '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 96
    Width = 57
    Height = 16
    Caption = #23494'     '#30721#65306'  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 104
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'sqr'
  end
  object Button1: TButton
    Left = 48
    Top = 136
    Width = 75
    Height = 25
    Caption = #30331' '#24405
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 136
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 104
    Top = 96
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    Text = '123'
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 8
    Top = 88
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='#29289#36164#31649#29702'.mdb;Persist Se' +
      'curity Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 48
  end
end
