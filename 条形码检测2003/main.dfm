object Form1: TForm1
  Left = 279
  Top = 148
  Width = 602
  Height = 480
  Caption = #26465#24418#30721#26816#27979
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 8
    Width = 370
    Height = 35
    Caption = #22885#29305#20339#26465#24418#30721#26816#27979#31995#32479
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = #24188#22278
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 56
    Width = 136
    Height = 16
    Caption = #35831#36755#20837#26465#24418#30721#20026#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 32
    Top = 80
    Width = 529
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ParentFont = False
    TabOrder = 0
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object Button1: TButton
    Left = 104
    Top = 400
    Width = 75
    Height = 33
    Caption = #24320#22987#26816#27979
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 456
    Top = 400
    Width = 75
    Height = 33
    Caption = #32467#26463#26816#27979
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 16
    Top = 128
    Width = 561
    Height = 265
    TabOrder = 3
    object Label3: TLabel
      Left = 340
      Top = 8
      Width = 75
      Height = 14
      Caption = #37197#22871#36710#21378#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 340
      Top = 71
      Width = 90
      Height = 14
      Caption = #21387#32553#26426#22411#21495#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 340
      Top = 135
      Width = 135
      Height = 14
      Caption = #29983#20135#26085#26399#25110#25209#27425#21495#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 340
      Top = 200
      Width = 165
      Height = 14
      Caption = #29983#20135#24207#21015#21495#25110#21333#20803#21488#25968#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 24
      Width = 270
      Height = 196
      Caption = 'OK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -173
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 24
      Top = 32
      Width = 260
      Height = 196
      Caption = 'NG'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -173
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 340
      Top = 34
      Width = 200
      Height = 28
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ParentFont = False
      TabOrder = 0
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 340
      Top = 97
      Width = 200
      Height = 28
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ParentFont = False
      TabOrder = 1
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 340
      Top = 161
      Width = 200
      Height = 28
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ParentFont = False
      TabOrder = 2
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 340
      Top = 228
      Width = 200
      Height = 28
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ParentFont = False
      TabOrder = 3
      Text = 'Edit5'
    end
    object Panel2: TPanel
      Left = 312
      Top = 8
      Width = 9
      Height = 249
      Caption = 'Panel2'
      TabOrder = 4
    end
  end
  object Button3: TButton
    Left = 272
    Top = 400
    Width = 75
    Height = 33
    Caption = #32487#32493#26816#27979
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button3Click
  end
end
