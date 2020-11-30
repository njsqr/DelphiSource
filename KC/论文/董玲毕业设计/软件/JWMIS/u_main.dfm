object F_main: TF_main
  Left = 251
  Top = 304
  Width = 696
  Height = 480
  Caption = #25945#21153#22788#19987#29992
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 673
    Height = 441
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #35838#31243#35774#32622#23457#25209
      OnShow = TabSheet1Show
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 84
        Height = 13
        Caption = #24453#23457#25209#30340#35838#31243#65306
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 48
        Width = 217
        Height = 345
        DataSource = DS_course_apply
        ReadOnly = True
        TabOrder = 0
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
      object GroupBox1: TGroupBox
        Left = 256
        Top = 32
        Width = 377
        Height = 361
        Caption = #20855#20307#20449#24687
        TabOrder = 1
        object Label2: TLabel
          Left = 32
          Top = 32
          Width = 36
          Height = 13
          Caption = #21517#31216#65306
        end
        object Label3: TLabel
          Left = 32
          Top = 64
          Width = 36
          Height = 13
          Caption = #25945#24072#65306
        end
        object Label4: TLabel
          Left = 32
          Top = 96
          Width = 36
          Height = 13
          Caption = #23398#20998#65306
        end
        object Label5: TLabel
          Left = 32
          Top = 128
          Width = 36
          Height = 13
          Caption = #23398#26102#65306
        end
        object Label6: TLabel
          Left = 32
          Top = 160
          Width = 36
          Height = 13
          Caption = #31616#20171#65306
        end
        object DBEdit1: TDBEdit
          Left = 96
          Top = 28
          Width = 121
          Height = 21
          DataField = 'NAME'
          DataSource = DS_course_apply
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 96
          Top = 60
          Width = 121
          Height = 21
          DataField = 'teacher'
          DataSource = DS_course_apply
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 96
          Top = 92
          Width = 121
          Height = 21
          DataField = 'CREDIT_HOUR'
          DataSource = DS_course_apply
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 96
          Top = 124
          Width = 121
          Height = 21
          DataField = 'PERIOD'
          DataSource = DS_course_apply
          TabOrder = 3
        end
        object DBMemo1: TDBMemo
          Left = 40
          Top = 184
          Width = 297
          Height = 105
          DataField = 'INTRO'
          DataSource = DS_course_apply
          TabOrder = 4
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 240
          Top = 24
          Width = 113
          Height = 129
          Caption = #30003#35831#39033#30446
          DataField = 'STATE'
          DataSource = DS_course_apply
          Items.Strings = (
            #30003#35831#22686#21152#26032#35838
            #30003#35831#21024#38500#26087#35838
            #30003#35831#20462#25913#35838#31243)
          TabOrder = 5
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object B_pass: TButton
          Left = 80
          Top = 312
          Width = 75
          Height = 25
          Caption = #36890#36807#23457#25209
          TabOrder = 6
          OnClick = B_passClick
        end
        object B_reject: TButton
          Left = 232
          Top = 312
          Width = 75
          Height = 25
          Caption = #25298#32477#35831#27714
          TabOrder = 7
          OnClick = B_rejectClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35838#31243#36164#28304#20998#37197
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label7: TLabel
        Left = 32
        Top = 16
        Width = 89
        Height = 13
        AutoSize = False
        Caption = #24453#20998#37197#35838#31243#65306
      end
      object Label8: TLabel
        Left = 24
        Top = 240
        Width = 72
        Height = 13
        Caption = #24050#20998#37197#35838#31243#65306
      end
      object Label9: TLabel
        Left = 32
        Top = 184
        Width = 60
        Height = 13
        Caption = #19978#35838#25945#23460#65306
      end
      object Label10: TLabel
        Left = 176
        Top = 184
        Width = 60
        Height = 13
        Caption = #19978#35838#26102#38388#65306
      end
      object DBGrid2: TDBGrid
        Left = 16
        Top = 32
        Width = 633
        Height = 137
        DataSource = DS_course_not_actived
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBGrid3: TDBGrid
        Left = 16
        Top = 256
        Width = 633
        Height = 145
        DataSource = DS_course_actived
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object i_classroom: TEdit
        Left = 24
        Top = 208
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object i_time: TEdit
        Left = 168
        Top = 208
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object B_submit: TButton
        Left = 304
        Top = 206
        Width = 75
        Height = 25
        Caption = #25552#20132#20998#37197
        Default = True
        TabOrder = 2
        OnClick = B_submitClick
      end
      object B_clear_all: TButton
        Left = 544
        Top = 206
        Width = 97
        Height = 25
        Caption = #28165#38500#25152#26377#20998#37197
        TabOrder = 5
        OnClick = B_clear_allClick
      end
      object B_print_course: TButton
        Left = 464
        Top = 206
        Width = 81
        Height = 27
        Caption = #25171#21360#35838#31243#20449#24687
        TabOrder = 6
        OnClick = B_print_courseClick
      end
      object B_disable: TButton
        Left = 384
        Top = 206
        Width = 75
        Height = 25
        Caption = #21462#28040#20998#37197
        TabOrder = 7
        OnClick = B_disableClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = #36873#35838#32467#26524#26597#35810#31649#29702
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Label19: TLabel
        Left = 24
        Top = 8
        Width = 73
        Height = 13
        AutoSize = False
        Caption = #36873#35838#32467#26524
      end
      object Label20: TLabel
        Left = 392
        Top = 8
        Width = 65
        Height = 13
        AutoSize = False
        Caption = #25104#32489#21333
      end
      object DBGrid5: TDBGrid
        Left = 16
        Top = 32
        Width = 257
        Height = 369
        DataSource = DS_course_select
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBGrid6: TDBGrid
        Left = 392
        Top = 32
        Width = 257
        Height = 369
        DataSource = DS_score
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Button1: TButton
        Left = 280
        Top = 176
        Width = 105
        Height = 49
        Caption = #36716#31227#20840#37096#32467#26524'>>'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #25104#32489#21333
      ImageIndex = 2
      object Label11: TLabel
        Left = 48
        Top = 22
        Width = 60
        Height = 13
        Caption = #35838#31243#32534#21495#65306
      end
      object Label12: TLabel
        Left = 344
        Top = 24
        Width = 48
        Height = 13
        Caption = #25104#32489#21333#65306
      end
      object Label18: TLabel
        Left = 48
        Top = 64
        Width = 60
        Height = 13
        Caption = #35838#31243#21517#31216#65306
      end
      object i_course_id: TEdit
        Left = 120
        Top = 16
        Width = 113
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid4: TDBGrid
        Left = 336
        Top = 48
        Width = 305
        Height = 289
        DataSource = DS_score_list
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object GroupBox2: TGroupBox
        Left = 40
        Top = 104
        Width = 249
        Height = 233
        Caption = #32479#35745#20449#24687
        TabOrder = 2
        object Label13: TLabel
          Left = 24
          Top = 32
          Width = 60
          Height = 13
          Caption = #35838#31243#20154#25968#65306
        end
        object Label14: TLabel
          Left = 24
          Top = 72
          Width = 60
          Height = 13
          Caption = #26368#39640#25104#32489#65306
        end
        object Label15: TLabel
          Left = 24
          Top = 152
          Width = 60
          Height = 13
          Caption = #26368#20302#25104#32489#65306
        end
        object Label16: TLabel
          Left = 24
          Top = 112
          Width = 60
          Height = 13
          Caption = #24179#22343#25104#32489#65306
        end
        object Label17: TLabel
          Left = 24
          Top = 192
          Width = 72
          Height = 13
          Caption = #19981#21450#26684#20154#25968#65306
        end
        object o_num_total: TEdit
          Left = 104
          Top = 28
          Width = 121
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object o_score_max: TEdit
          Left = 104
          Top = 68
          Width = 121
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object o_score_avg: TEdit
          Left = 104
          Top = 108
          Width = 121
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object o_score_min: TEdit
          Left = 104
          Top = 148
          Width = 121
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object o_num_failed: TEdit
          Left = 104
          Top = 188
          Width = 121
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object B_print_score: TButton
        Left = 120
        Top = 352
        Width = 75
        Height = 25
        Caption = #25171#21360#25104#32489#21333
        TabOrder = 3
        OnClick = B_print_scoreClick
      end
      object B_query: TButton
        Left = 248
        Top = 18
        Width = 75
        Height = 25
        Caption = #26597#35810
        Default = True
        TabOrder = 4
        OnClick = B_queryClick
      end
      object o_course_name: TDBEdit
        Left = 120
        Top = 60
        Width = 161
        Height = 28
        DataField = 'NAME'
        DataSource = DS_course_info
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
  end
  object T_course_apply: TTable
    DatabaseName = 'dongling'
    Filter = 'STATE='#39'0'#39' OR STATE='#39'1'#39' OR STATE='#39'2'#39
    Filtered = True
    TableName = 'dbo.course'
    Top = 32
  end
  object DS_course_apply: TDataSource
    DataSet = T_course_apply
    Top = 64
  end
  object T_teacher: TTable
    DatabaseName = 'dongling'
    IndexFieldNames = 'ID'
    MasterFields = 'TEACHER'
    MasterSource = DS_course_apply
    TableName = 'dbo.teacher'
    Top = 96
  end
  object DS_teacher: TDataSource
    DataSet = T_teacher
    Top = 128
  end
  object Q_score_list: TQuery
    DatabaseName = 'dongling'
    SQL.Strings = (
      'SELECT STUDENT.CLASS, STUDENT.ID, STUDENT.NAME, SCORE.SCORE'
      'FROM STUDENT, SCORE'
      'WHERE SCORE.COURSE like :COURSE '
      'AND SCORE.STUDENT=STUDENT.name')
    Left = 660
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'COURSE'
        ParamType = ptInput
      end>
  end
  object Q_info: TQuery
    DatabaseName = 'dongling'
    Left = 660
    Top = 344
  end
  object T_course_info: TTable
    DatabaseName = 'dongling'
    TableName = 'dbo.course'
    Left = 660
    Top = 280
  end
  object DS_course_info: TDataSource
    DataSet = T_course_info
    Left = 660
    Top = 312
  end
  object Q_course_not_actived: TQuery
    DatabaseName = 'dongling'
    SQL.Strings = (
      
        'SELECT COURSE.ID, COURSE.NAME, TEACHER.NAME AS TEACHER, COURSE.P' +
        'ERIOD'
      'FROM COURSE, TEACHER'
      'WHERE COURSE.STATE='#39'4'#39
      'AND COURSE.TEACHER=TEACHER.NAME')
    Top = 216
  end
  object DS_course_not_actived: TDataSource
    DataSet = Q_course_not_actived
    Top = 248
  end
  object Q_course_actived: TQuery
    DatabaseName = 'dongling'
    SQL.Strings = (
      
        'SELECT COURSE.ID, COURSE.NAME, COURSE.CLASSROOM, COURSE.CLASSTIM' +
        'E, COURSE.PERIOD, TEACHER.NAME AS TEACHER'
      'FROM COURSE, TEACHER'
      'WHERE COURSE.STATE='#39'3'#39
      'AND COURSE.TEACHER=TEACHER.NAME'
      '')
    Top = 280
  end
  object DS_course_actived: TDataSource
    DataSet = Q_course_actived
    Top = 312
  end
  object Q_submit: TQuery
    DatabaseName = 'dongling'
    Top = 344
  end
  object DS_score_list: TDataSource
    DataSet = Q_score_list
    Left = 660
    Top = 248
  end
  object Q_update: TQuery
    DatabaseName = 'dongling'
    Top = 160
  end
  object T_course_select: TTable
    DatabaseName = 'dongling'
    TableName = 'dbo.course_select'
    Left = 660
    Top = 32
  end
  object DS_course_select: TDataSource
    DataSet = T_course_select
    Left = 660
    Top = 64
  end
  object T_score: TTable
    DatabaseName = 'dongling'
    TableName = 'dbo.score'
    Left = 660
    Top = 96
  end
  object DS_score: TDataSource
    DataSet = T_score
    Left = 660
    Top = 128
  end
  object T_counter_F: TTable
    DatabaseName = 'dongling'
    Filter = 'ID='#39'F'#39
    Filtered = True
    TableName = 'dbo.counter'
    Left = 660
    Top = 160
  end
end
