object MainFrm: TMainFrm
  Left = 268
  Top = 144
  Width = 544
  Height = 375
  Align = alCustom
  Caption = #24211#23384#31649#29702#20449#24687#31995#32479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 120
    Width = 349
    Height = 37
    Caption = #24211#23384#31649#29702#20449#24687#31995#32479'          '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 302
    Width = 536
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 220
      end
      item
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Left = 160
    Top = 24
    object N1: TMenuItem
      Caption = #22522#26412#20449#24687#35774#32622
      object N2: TMenuItem
        Caption = #36135#21697#20449#24687
        object N10: TMenuItem
          Caption = #28155#21152#36135#21697#20449#24687
          OnClick = N10Click
        end
        object N11: TMenuItem
          Caption = #20462#25913#36135#21697#20449#24687
          OnClick = N11Click
        end
        object N12: TMenuItem
          Caption = #26597#35810#36135#21697#20449#24687
          OnClick = N12Click
        end
      end
      object N3: TMenuItem
        Caption = #20179#24211#20449#24687
        object N13: TMenuItem
          Caption = #28155#21152#20179#24211#20449#24687
          OnClick = N13Click
        end
        object N14: TMenuItem
          Caption = #20462#25913#20179#24211#20449#24687
          OnClick = N14Click
        end
        object N15: TMenuItem
          Caption = #26597#35810#20179#24211#20449#24687
          OnClick = N15Click
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #20379#36135#21333#20301
        object N16: TMenuItem
          Caption = #28155#21152#20379#36135#21333#20301
          OnClick = N16Click
        end
        object N17: TMenuItem
          Caption = #20462#25913#21333#20301#20449#24687
          OnClick = N17Click
        end
        object N18: TMenuItem
          Caption = #26597#35810#21333#20301#20449#24687
          OnClick = N18Click
        end
      end
      object N6: TMenuItem
        Caption = #25910#36135#21333#20301
        object N19: TMenuItem
          Caption = #28155#21152#25910#36135#21333#20301
          OnClick = N19Click
        end
        object N20: TMenuItem
          Caption = #20462#25913#21333#20301#20449#24687
          OnClick = N20Click
        end
        object N21: TMenuItem
          Caption = #26597#35810#21333#20301#20449#24687
          OnClick = N21Click
        end
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #36864#20986#31995#32479
        OnClick = N9Click
      end
    end
    object N29: TMenuItem
      Caption = #20986#20837#24211#31649#29702
      object N30: TMenuItem
        Caption = #20837#24211#30331#35760
        OnClick = N30Click
      end
      object N7: TMenuItem
        Caption = #20837#24211#20462#25913
        OnClick = N7Click
      end
      object N31: TMenuItem
        Caption = #20837#24211#26597#35810
        OnClick = N31Click
      end
      object N32: TMenuItem
        Caption = '-'
      end
      object N33: TMenuItem
        Caption = #20986#24211#30331#35760
        OnClick = N33Click
      end
      object N43: TMenuItem
        Caption = #20986#24211#20462#25913
        OnClick = N43Click
      end
      object N34: TMenuItem
        Caption = #20986#24211#26597#35810
        OnClick = N34Click
      end
    end
    object N22: TMenuItem
      Caption = #24211#23384#25968#25454#20998#26512
      object N23: TMenuItem
        Caption = #24211#23384#26597#35810
        OnClick = N23Click
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object N25: TMenuItem
        Caption = #30701#32447#36135#21697
        OnClick = N25Click
      end
      object N26: TMenuItem
        Caption = #36229#20648#36135#21697
        OnClick = N26Click
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object N28: TMenuItem
        Caption = #25253#34920#32479#35745
        OnClick = N28Click
      end
    end
    object N35: TMenuItem
      Caption = #31995#32479#32500#25252
      object N36: TMenuItem
        Caption = #20462#25913#23494#30721
        OnClick = N36Click
      end
      object N37: TMenuItem
        Caption = #28155#21152#29992#25143
        OnClick = N37Click
      end
    end
    object N41: TMenuItem
      Caption = #24110#21161
      OnClick = N41Click
    end
    object N42: TMenuItem
      Caption = #36864#20986
      OnClick = N42Click
    end
  end
end
