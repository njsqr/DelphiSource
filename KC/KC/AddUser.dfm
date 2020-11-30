object AddUserFrm: TAddUserFrm
  Left = 230
  Top = 99
  Width = 392
  Height = 375
  Caption = #28155#21152#29992#25143
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
    Caption = #28155#21152#29992#25143
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
      Width = 60
      Height = 13
      Caption = #23494'         '#30721'   '
    end
    object Label3: TLabel
      Left = 56
      Top = 128
      Width = 57
      Height = 13
      Caption = #30830#35748#23494#30721'   '
    end
    object Label4: TLabel
      Left = 56
      Top = 168
      Width = 48
      Height = 13
      Caption = #29992#25143#26435#38480
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
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 128
      Top = 128
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object Button1: TButton
      Left = 56
      Top = 216
      Width = 57
      Height = 25
      Caption = #28155#21152
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 128
      Top = 216
      Width = 57
      Height = 25
      Caption = #28165#38500
      TabOrder = 4
      OnClick = Button2Click
    end
    object ComboBox1: TComboBox
      Left = 128
      Top = 168
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = 'ComboBox1'
      Items.Strings = (
        #31995#32479#31649#29702#21592
        #26222#36890#29992#25143)
    end
    object Button3: TButton
      Left = 200
      Top = 216
      Width = 57
      Height = 25
      Caption = #36820#22238
      TabOrder = 6
      OnClick = Button3Click
    end
  end
end
