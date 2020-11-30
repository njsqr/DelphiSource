object ModifyPasswordFrm: TModifyPasswordFrm
  Left = 220
  Top = 152
  Width = 393
  Height = 375
  Caption = #20462#25913#23494#30721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 32
    Top = 24
    Width = 313
    Height = 289
    Caption = #20462#25913#23494#30721
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 48
      Width = 57
      Height = 13
      Caption = #29992'  '#25143'  '#21517'   '
    end
    object Label2: TLabel
      Left = 56
      Top = 88
      Width = 57
      Height = 13
      Caption = #26087'  '#23494'  '#30721'   '
    end
    object Label3: TLabel
      Left = 56
      Top = 128
      Width = 57
      Height = 13
      Caption = #26032'  '#23494'  '#30721'   '
    end
    object Label4: TLabel
      Left = 56
      Top = 168
      Width = 60
      Height = 13
      Caption = #30830#35748#23494#30721'    '
    end
    object Edit1: TEdit
      Left = 128
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 128
      Top = 88
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 128
      Top = 128
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      Text = 'Edit3'
    end
    object Button1: TButton
      Left = 56
      Top = 216
      Width = 49
      Height = 25
      Caption = #20462#25913
      TabOrder = 3
      OnClick = Button1Click
    end
    object Edit4: TEdit
      Left = 128
      Top = 168
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 4
      Text = 'Edit4'
    end
    object Button2: TButton
      Left = 128
      Top = 216
      Width = 49
      Height = 25
      Caption = #28165#38500
      TabOrder = 5
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 200
      Top = 216
      Width = 49
      Height = 25
      Caption = #36820#22238
      TabOrder = 6
      OnClick = Button3Click
    end
  end
end
