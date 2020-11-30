object Form1: TForm1
  Left = 414
  Top = 175
  Width = 726
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 120
    Top = 16
    Width = 97
    Height = 25
    Caption = #35843#29992'txt'#25991#20214
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 272
    Top = 40
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = 'ZDesigner'
    Items.Strings = (
      'ZDesigner')
  end
  object Button2: TButton
    Left = 120
    Top = 56
    Width = 97
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 120
    Top = 104
    Width = 89
    Height = 25
    Caption = #25214#32570#30465#25171#21360#26426
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 120
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 248
    Top = 120
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
  end
  object Button5: TButton
    Left = 128
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 128
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 7
    OnClick = Button6Click
  end
  object Edit1: TEdit
    Left = 232
    Top = 296
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 368
    Top = 296
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 296
    Top = 320
    Width = 121
    Height = 21
    TabOrder = 10
    Text = 'Edit3'
  end
  object Button7: TButton
    Left = 128
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Button7'
    TabOrder = 11
    OnClick = Button7Click
  end
  object PrintDialog1: TPrintDialog
    Left = 208
    Top = 160
  end
end
