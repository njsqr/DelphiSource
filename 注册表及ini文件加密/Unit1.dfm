object Form1: TForm1
  Left = 192
  Top = 114
  Width = 644
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 128
    Width = 97
    Height = 25
    Caption = #24310#38271#35797#29992#26399
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 56
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Animate1: TAnimate
    Left = 8
    Top = 240
    Width = 16
    Height = 16
    CommonAVI = aviFindFile
    StopFrame = 23
  end
  object Panel1: TPanel
    Left = 416
    Top = 280
    Width = 185
    Height = 81
    Caption = 'Panel1'
    TabOrder = 3
    object Button3: TButton
      Left = 80
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object Button4: TButton
    Left = 400
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 4
    OnClick = Button4Click
    OnKeyDown = Button4KeyDown
  end
  object OpenDialog1: TOpenDialog
    Left = 480
    Top = 336
  end
end
