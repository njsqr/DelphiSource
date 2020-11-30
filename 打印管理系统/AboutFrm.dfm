object About: TAbout
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 262
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 237
    Height = 13
    Caption = 'Simple Printer Monitoring And Controlling Program'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 84
    Height = 13
    Caption = 'Detected Printers'
  end
  object Button1: TButton
    Left = 200
    Top = 224
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object lbPrinters: TListBox
    Left = 16
    Top = 56
    Width = 257
    Height = 153
    Color = clScrollBar
    ItemHeight = 13
    TabOrder = 1
  end
end
