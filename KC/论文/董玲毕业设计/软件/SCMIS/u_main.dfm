object F_main: TF_main
  Left = 242
  Top = 224
  Width = 631
  Height = 439
  Caption = 'F_main'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 609
    Height = 393
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #36873#35838
      OnShow = TabSheet1Show
      object Label1: TLabel
        Left = 32
        Top = 16
        Width = 61
        Height = 13
        Caption = #35838#31243#32534#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 352
        Top = 16
        Width = 61
        Height = 13
        Caption = #24050#36873#35838#31243#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 240
        Top = 224
        Width = 49
        Height = 13
        Caption = #24635#23398#20998#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object i_course_id: TEdit
        Left = 96
        Top = 12
        Width = 97
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = i_course_idChange
      end
      object GroupBox1: TGroupBox
        Left = 24
        Top = 40
        Width = 185
        Height = 313
        Caption = #35838#31243#20449#24687
        TabOrder = 3
        object Label2: TLabel
          Left = 16
          Top = 32
          Width = 36
          Height = 13
          Caption = #21517#31216#65306
        end
        object Label3: TLabel
          Left = 16
          Top = 56
          Width = 36
          Height = 13
          Caption = #25945#24072#65306
        end
        object Label4: TLabel
          Left = 16
          Top = 80
          Width = 36
          Height = 13
          Caption = #23398#20998#65306
        end
        object Label5: TLabel
          Left = 16
          Top = 104
          Width = 36
          Height = 13
          Caption = #23398#26102#65306
        end
        object Label6: TLabel
          Left = 16
          Top = 128
          Width = 60
          Height = 13
          Caption = #19978#35838#22320#28857#65306
        end
        object Label7: TLabel
          Left = 16
          Top = 168
          Width = 60
          Height = 13
          Caption = #19978#35838#26102#38388#65306
        end
        object Label8: TLabel
          Left = 16
          Top = 208
          Width = 36
          Height = 13
          Caption = #31616#20171#65306
        end
        object DBEdit2: TDBEdit
          Left = 56
          Top = 28
          Width = 105
          Height = 24
          DataField = 'NAME'
          DataSource = DS_course_info
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 56
          Top = 52
          Width = 105
          Height = 24
          DataField = 'teacher'
          DataSource = DS_course_info
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 56
          Top = 76
          Width = 105
          Height = 24
          DataField = 'CREDIT_HOUR'
          DataSource = DS_course_info
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 56
          Top = 100
          Width = 105
          Height = 24
          DataField = 'PERIOD'
          DataSource = DS_course_info
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 16
          Top = 144
          Width = 153
          Height = 24
          DataField = 'CLASSROOM'
          DataSource = DS_course_info
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit7: TDBEdit
          Left = 16
          Top = 184
          Width = 153
          Height = 24
          DataField = 'CLASSTIME'
          DataSource = DS_course_info
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object DBMemo1: TDBMemo
          Left = 16
          Top = 224
          Width = 153
          Height = 73
          DataField = 'INTRO'
          DataSource = DS_course_info
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
      end
      object DBGrid1: TDBGrid
        Left = 336
        Top = 40
        Width = 249
        Height = 313
        DataSource = DS_course_selected
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = #35838#31243#32534#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = #35838#31243#21517#31216
            Visible = True
          end>
      end
      object B_add: TButton
        Left = 232
        Top = 88
        Width = 75
        Height = 25
        Caption = #21152#20837'>>'
        TabOrder = 1
        OnClick = B_addClick
      end
      object B_del: TButton
        Left = 232
        Top = 152
        Width = 75
        Height = 25
        Caption = '<<'#21024#38500
        TabOrder = 2
        OnClick = B_delClick
      end
      object DBEdit1: TDBEdit
        Left = 224
        Top = 256
        Width = 97
        Height = 24
        DataField = 'COLUMN1'
        DataSource = DS_total_credit_hour
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object B_show: TButton
        Left = 208
        Top = 10
        Width = 105
        Height = 31
        Caption = #26174' '#31034' '#35838' '#31243' '#20449' '#24687
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = B_showClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810#25104#32489
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label11: TLabel
        Left = 56
        Top = 24
        Width = 84
        Height = 13
        Caption = #24050#23398#35838#31243#21015#34920#65306
      end
      object DBGrid2: TDBGrid
        Left = 40
        Top = 48
        Width = 273
        Height = 297
        DataSource = DS_course_learned
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid2CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = #35838#31243#32534#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = #35838#31243#21517#31216
            Visible = True
          end>
      end
      object GroupBox2: TGroupBox
        Left = 336
        Top = 24
        Width = 225
        Height = 321
        Caption = #25104#32489#32479#35745
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label12: TLabel
          Left = 32
          Top = 48
          Width = 61
          Height = 13
          Caption = #20320#30340#25104#32489#65306
        end
        object Label13: TLabel
          Left = 32
          Top = 104
          Width = 85
          Height = 13
          Caption = #26412#35838#26368#39640#25104#32489#65306
        end
        object Label14: TLabel
          Left = 32
          Top = 168
          Width = 85
          Height = 13
          Caption = #26412#35838#24179#22343#25104#32489#65306
        end
        object Label15: TLabel
          Left = 32
          Top = 232
          Width = 85
          Height = 13
          Caption = #26412#35838#26368#20302#25104#32489#65306
        end
        object DBEdit8: TDBEdit
          Left = 48
          Top = 72
          Width = 121
          Height = 24
          DataField = 'SCORE'
          DataSource = DS_course_learned
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 48
          Top = 128
          Width = 121
          Height = 24
          DataField = 'COLUMN1'
          DataSource = DS_score_max
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit10: TDBEdit
          Left = 48
          Top = 192
          Width = 121
          Height = 24
          DataField = 'COLUMN1'
          DataSource = DS_score_avg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit11: TDBEdit
          Left = 48
          Top = 264
          Width = 121
          Height = 24
          DataField = 'COLUMN1'
          DataSource = DS_score_min
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  object DS_course_info: TDataSource
    DataSet = T_course_info
    Left = 4
    Top = 96
  end
  object T_course_info: TTable
    DatabaseName = 'dongling'
    ReadOnly = True
    TableName = 'dbo.course'
    Left = 4
    Top = 64
  end
  object T_teacher: TTable
    DatabaseName = 'dongling'
    IndexFieldNames = 'ID'
    MasterFields = 'TEACHER'
    MasterSource = DS_course_info
    ReadOnly = True
    TableName = 'dbo.teacher'
    Left = 4
    Top = 192
  end
  object DS_teacher: TDataSource
    DataSet = T_teacher
    Left = 4
    Top = 224
  end
  object DS_course_selected: TDataSource
    DataSet = Q_course_selected
    Left = 4
    Top = 160
  end
  object Q_course_selected: TQuery
    DatabaseName = 'dongling'
    SQL.Strings = (
      'SELECT COURSE_SELECT.ID AS SEL_ID, COURSE.ID, COURSE.NAME'
      'FROM COURSE, COURSE_SELECT'
      'WHERE COURSE_SELECT.STUDENT=:STUDENT'
      'AND COURSE_SELECT.COURSE=COURSE.ID'
      'ORDER BY COURSE.ID')
    Left = 4
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'STUDENT'
        ParamType = ptInput
      end>
  end
  object T_counter_X: TTable
    DatabaseName = 'dongling'
    Filter = 'ID='#39'X'#39
    Filtered = True
    TableName = 'dbo.counter'
    Left = 4
    Top = 288
  end
  object Q_total_credit_hour: TQuery
    DatabaseName = 'dongling'
    SQL.Strings = (
      'SELECT SUM(COURSE.CREDIT_HOUR)'
      'FROM COURSE_SELECT, COURSE'
      'WHERE COURSE_SELECT.STUDENT=:STUDENT'
      'AND COURSE_SELECT.COURSE=COURSE.ID')
    Left = 4
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'STUDENT'
        ParamType = ptInput
      end>
  end
  object DS_total_credit_hour: TDataSource
    DataSet = Q_total_credit_hour
    Left = 4
    Top = 352
  end
  object Q_select: TQuery
    DatabaseName = 'dongling'
    Left = 4
    Top = 256
  end
  object T_student: TTable
    DatabaseName = 'dongling'
    TableName = 'dbo.student'
    Left = 4
    Top = 32
  end
  object Q_course_learned: TQuery
    DatabaseName = 'dongling'
    SQL.Strings = (
      'SELECT SCORE.SCORE, COURSE.ID, COURSE.NAME'
      'FROM SCORE, COURSE'
      'WHERE SCORE.STUDENT=:STUDENT'
      'AND SCORE.COURSE=COURSE.ID')
    Left = 580
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'STUDENT'
        ParamType = ptUnknown
      end>
  end
  object DS_course_learned: TDataSource
    DataSet = Q_course_learned
    Left = 580
    Top = 72
  end
  object Q_score_max: TQuery
    Active = True
    DatabaseName = 'dongling'
    SQL.Strings = (
      'SELECT MAX(SCORE)'
      'FROM SCORE'
      'WHERE COURSE=:COURSE')
    Left = 580
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'COURSE'
        ParamType = ptInput
      end>
  end
  object DS_score_max: TDataSource
    DataSet = Q_score_max
    Left = 580
    Top = 144
  end
  object Q_score_avg: TQuery
    Active = True
    DatabaseName = 'dongling'
    SQL.Strings = (
      'SELECT AVG(SCORE)'
      'FROM SCORE'
      'WHERE COURSE=:COURSE')
    Left = 580
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'COURSE'
        ParamType = ptInput
      end>
  end
  object DS_score_avg: TDataSource
    DataSet = Q_score_avg
    Left = 580
    Top = 216
  end
  object DS_score_min: TDataSource
    DataSet = Q_score_min
    Left = 580
    Top = 296
  end
  object Q_score_min: TQuery
    Active = True
    DatabaseName = 'dongling'
    SQL.Strings = (
      'SELECT MIN(SCORE)'
      'FROM SCORE'
      'WHERE COURSE=:COURSE')
    Left = 580
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'COURSE'
        ParamType = ptInput
      end>
  end
end
