object Form1: TForm1
  Left = 69
  Top = 169
  Width = 715
  Height = 368
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 104
    Top = 248
    Width = 54
    Height = 12
    Caption = 'USB'#31471#21475#21517
  end
  object Button1: TButton
    Left = 80
    Top = 56
    Width = 305
    Height = 25
    Caption = #29992#39537#21160#24320'  ('#38656#35201#39537#21160#35774#32622#25171#21360#21518#24320#38065#31665')'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 144
    Width = 305
    Height = 25
    Caption = #29992#25351#20196#24320' ('#19981#38656#35201#39537#21160#35774#32622#25171#21360#21518#24320#38065#31665')'
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioButton1: TRadioButton
    Left = 88
    Top = 176
    Width = 113
    Height = 17
    Caption = #25351#20196'1'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 216
    Top = 176
    Width = 113
    Height = 17
    Caption = #25351#20196'2'
    TabOrder = 3
  end
  object PortEdit: TEdit
    Left = 168
    Top = 240
    Width = 169
    Height = 20
    TabOrder = 4
    Text = 'USB_BTP-N58II_1'
  end
  object Button3: TButton
    Left = 88
    Top = 272
    Width = 153
    Height = 25
    Caption = #25171#21360
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 256
    Top = 272
    Width = 153
    Height = 25
    Caption = #24320#38065#31665
    TabOrder = 6
    OnClick = Button4Click
  end
end
