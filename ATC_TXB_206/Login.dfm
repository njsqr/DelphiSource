object LoginFrm: TLoginFrm
  Left = 192
  Top = 114
  Width = 291
  Height = 210
  Caption = #30331#24405#30028#38754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 40
    Top = 100
    Width = 64
    Height = 16
    Caption = #23494'  '#30721#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 68
    Width = 64
    Height = 16
    Caption = #29992#25143#21517#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 248
    Height = 29
    Caption = #22885#29305#20339#29305#24615#34920#31995#32479
    Font.Charset = GB2312_CHARSET
    Font.Color = clTeal
    Font.Height = -29
    Font.Name = #24188#22278
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit2: TEdit
    Left = 136
    Top = 96
    Width = 121
    Height = 24
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 0
    OnKeyDown = Edit2KeyDown
  end
  object Edit1: TEdit
    Left = 136
    Top = 64
    Width = 121
    Height = 24
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'lqq'
    OnKeyPress = Edit1KeyPress
  end
  object Button2: TButton
    Left = 168
    Top = 136
    Width = 75
    Height = 25
    Caption = #21462' '#28040
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 32
    Top = 136
    Width = 75
    Height = 25
    Caption = #30331' '#24405
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '2011-11-29'
    Visible = False
    OnKeyPress = Edit3KeyPress
  end
end
