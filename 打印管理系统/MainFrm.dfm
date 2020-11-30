object Main: TMain
  Left = 69
  Top = 107
  Width = 712
  Height = 239
  Caption = 'Printer Monitor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lvMain: TListView
    Left = 0
    Top = 0
    Width = 704
    Height = 193
    Align = alClient
    Columns = <
      item
        Caption = 'Machine Name'
        Width = 150
      end
      item
        Caption = 'Printer Name'
        Width = 150
      end
      item
        Caption = 'Document Name'
        Width = 200
      end
      item
        Caption = 'Status'
        Width = 200
      end
      item
        Caption = 'Owner'
        Width = 100
      end
      item
        Alignment = taRightJustify
        Caption = 'Size'
        Width = 100
      end
      item
        Alignment = taRightJustify
        Caption = 'Printed'
      end
      item
        Alignment = taRightJustify
        AutoSize = True
        Caption = 'Start At'
        WidthType = (
          -250)
      end>
    ReadOnly = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 216
    Top = 48
  end
  object MainMenu1: TMainMenu
    Left = 248
    Top = 48
    object Process1: TMenuItem
      Caption = '&Process'
      object RefreshPrinters1: TMenuItem
        Caption = '&Refresh Printers'
        ShortCut = 116
        OnClick = RefreshPrinters1Click
      end
      object Monitoring1: TMenuItem
        Caption = '&Monitoring'
        Checked = True
        OnClick = Monitoring1Click
      end
      object MonitorSharedPrinters1: TMenuItem
        Caption = 'Monitor Shared Printers Only'
        OnClick = MonitorSharedPrinters1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Jobs1: TMenuItem
      Caption = 'Jobs'
      object DeleteSelectedItem1: TMenuItem
        Caption = 'Delete Selected Item'
        ShortCut = 46
        OnClick = DeleteSelectedItem1Click
      end
      object DeleteAllItems1: TMenuItem
        Caption = 'Delete All Items'
        ShortCut = 16430
        OnClick = DeleteAllItems1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object CancelJob1: TMenuItem
        Caption = 'Cancel Job'
        OnClick = CancelJob1Click
      end
      object PauseJob1: TMenuItem
        Caption = 'Pause Job'
        OnClick = PauseJob1Click
      end
      object RestartJob1: TMenuItem
        Caption = 'Restart Job'
        OnClick = RestartJob1Click
      end
      object ResumeJob1: TMenuItem
        Caption = 'Resume Job'
        OnClick = ResumeJob1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
end
