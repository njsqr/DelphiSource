unit u_main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, DBTables, ExtCtrls, DBCtrls, StdCtrls, Mask, Grids, DBGrids;

type
  TF_main = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    T_course_apply: TTable;
    DS_course_apply: TDataSource;
    T_teacher: TTable;
    DS_teacher: TDataSource;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    i_classroom: TEdit;
    i_time: TEdit;
    B_submit: TButton;
    B_clear_all: TButton;
    B_print_course: TButton;
    B_disable: TButton;
    Label11: TLabel;
    i_course_id: TEdit;
    DBGrid4: TDBGrid;
    Label12: TLabel;
    GroupBox2: TGroupBox;
    B_print_score: TButton;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    o_num_total: TEdit;
    o_score_max: TEdit;
    o_score_avg: TEdit;
    o_score_min: TEdit;
    o_num_failed: TEdit;
    Q_score_list: TQuery;
    Q_info: TQuery;
    B_query: TButton;
    Label18: TLabel;
    o_course_name: TDBEdit;
    T_course_info: TTable;
    DS_course_info: TDataSource;
    Q_course_not_actived: TQuery;
    DS_course_not_actived: TDataSource;
    Q_course_actived: TQuery;
    DS_course_actived: TDataSource;
    Q_submit: TQuery;
    DS_score_list: TDataSource;
    B_pass: TButton;
    B_reject: TButton;
    Q_update: TQuery;
    TabSheet3: TTabSheet;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    Label19: TLabel;
    Label20: TLabel;
    Button1: TButton;
    T_course_select: TTable;
    DS_course_select: TDataSource;
    T_score: TTable;
    DS_score: TDataSource;
    T_counter_F: TTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_submitClick(Sender: TObject);
    procedure B_disableClick(Sender: TObject);
    procedure B_clear_allClick(Sender: TObject);
    procedure B_print_courseClick(Sender: TObject);
    procedure B_queryClick(Sender: TObject);
    procedure B_print_scoreClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure B_passClick(Sender: TObject);
    procedure B_rejectClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_main: TF_main;

implementation

uses MainFrm;

{$R *.DFM}

procedure TF_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TF_main.B_submitClick(Sender: TObject);
begin
  With Q_submit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE COURSE');
    SQL.Add('SET CLASSROOM="'+i_classroom.Text+
                   '", CLASSTIME="'+i_time.Text+
                   '", STATE="3"');
    SQL.Add('WHERE ID="'+Q_course_not_actived['ID']+'"');
    ExecSQL;
  end;
  TabSheet2Show(nil);
  i_classroom.Text:='';
  i_time.Text:='';
end;

procedure TF_main.B_disableClick(Sender: TObject);
begin
  With Q_submit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE COURSE');
    SQL.Add('SET STATE="4"');
    SQL.Add('WHERE ID="'+Q_course_actived['ID']+'"');
    ExecSQL;
  end;
  TabSheet2Show(nil);
end;

procedure TF_main.B_clear_allClick(Sender: TObject);
begin
  if Application.MessageBox(
    '确认要清除所有已分配资源？',
    '操作确认',
    MB_OKCANCEL)=IDOK then
  begin
    With Q_submit do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE COURSE');
      SQL.Add('SET STATE="4"');
      SQL.Add('WHERE STATE="3"');
      ExecSQL;
    end;
    TabSheet2Show(nil);
  end;
end;

procedure TF_main.B_print_courseClick(Sender: TObject);
begin
  With MainForm do
  begin
    i_header.Text:='课程安排';
    Q_print_contents.Close;
    Q_print_contents.SQL.Clear;
    Q_print_contents.SQL.Add('SELECT COURSE.ID, COURSE.NAME,'+
       ' TEACHER.NAME AS TEACHER, COURSE.CLASSROOM,'+
       ' COURSE.CLASSTIME, COURSE.PERIOD,'+
       ' COURSE.CREDIT_HOUR, COURSE.INTRO'+
       ' FROM COURSE, TEACHER'+
       ' WHERE COURSE.STATE="3"'+
       ' AND COURSE.TEACHER=TEACHER.ID');
    Q_print_contents.Open;
    StringGrid1.RowCount:=8;
    StringGrid1.Cells[0,0]:='课程编号';
    StringGrid1.Cells[1,0]:='10';
    StringGrid1.Cells[0,1]:='课程名称';
    StringGrid1.Cells[1,1]:='15';
    StringGrid1.Cells[0,2]:='主讲教师';
    StringGrid1.Cells[1,2]:='10';
    StringGrid1.Cells[0,3]:='上课地点';
    StringGrid1.Cells[1,3]:='10';
    StringGrid1.Cells[0,4]:='上课时间';
    StringGrid1.Cells[1,4]:='10';
    StringGrid1.Cells[0,5]:='学时';
    StringGrid1.Cells[1,5]:='5';
    StringGrid1.Cells[0,6]:='学分';
    StringGrid1.Cells[1,6]:='5';
    StringGrid1.Cells[0,7]:='课程简介';
    StringGrid1.Cells[1,7]:='20';
    ShowModal;
  end;
end;

procedure TF_main.B_queryClick(Sender: TObject);
begin
  //查询课程名
  T_course_info.Filter:='ID='''+i_course_id.Text+'''';
  T_course_info.Filtered:=True;
  T_course_info.Open;
  if T_course_info.RecordCount=1 then
  begin
    //显示成绩列表
    Q_score_list.Close;
    Q_score_list.Params[0].AsString:=i_course_id.Text;
    Q_score_list.Open;
   //查询课程统计信息
    Q_info.Close;
    Q_info.SQL.Clear;
    Q_info.SQL.Add('SELECT COUNT(STUDENT) as 人数,AVG(SCORE) as 平均分,MAX(SCORE) as 最高分,MIN(SCORE) as 最低分'+' FROM SCORE WHERE COURSE like '+quotedstr(i_course_id.Text));
    Q_info.Open;
    o_num_total.Text:=Q_info.FieldValues['人数'];
    o_score_max.Text:=Q_info.FieldValues['最高分'];
    o_score_avg.Text:=Q_info.FieldValues['平均分'];
    o_score_min.Text:=Q_info.FieldValues['最低分'];
    Q_info.Close;
    Q_info.SQL.Clear;
    Q_info.SQL.Add('SELECT COUNT(STUDENT) FROM SCORE '+'WHERE COURSE like '+quotedstr(i_course_id.Text)+' AND SCORE<60');
    Q_info.Open;
    o_num_failed.Text:=Q_info.Fields[0].AsString;

  end
  else
    Application.MessageBox('请确认课程编号','错误的编号',MB_OK);
end;

procedure TF_main.B_print_scoreClick(Sender: TObject);
begin
  With MainForm do
  begin
    i_header.Text:='成绩单：'+o_course_name.Text;
    Q_print_contents.Close;
    Q_print_contents.SQL.Clear;
    Q_print_contents.SQL:=Q_score_list.SQL;
    Q_print_contents.Params[0].AsString:=i_course_id.Text;
    Q_print_contents.Open;
    StringGrid1.RowCount:=4;
    StringGrid1.Cells[0,0]:='班级';
    StringGrid1.Cells[1,0]:='10';
    StringGrid1.Cells[0,1]:='学号';
    StringGrid1.Cells[1,1]:='15';
    StringGrid1.Cells[0,2]:='姓名';
    StringGrid1.Cells[1,2]:='20';
    StringGrid1.Cells[0,3]:='成绩';
    StringGrid1.Cells[1,3]:='10';
    ShowModal
  end;
end;

procedure TF_main.TabSheet2Show(Sender: TObject);
begin
  Q_course_not_actived.Close;
  Q_course_actived.Close;
  Q_course_not_actived.Open;
  Q_course_actived.Open;
end;

procedure TF_main.TabSheet1Show(Sender: TObject);
begin
  T_course_apply.Open;
  T_teacher.Open;
end;

procedure TF_main.B_passClick(Sender: TObject);
begin
  Q_update.Close;
  Q_update.SQL.Clear;
  Q_update.SQL.Add('UPDATE COURSE');
  Q_update.SQL.Add('SET STATE="4"');
  Q_update.SQL.Add('WHERE ID="'+T_course_apply['ID']+'"');
  Q_update.ExecSQL;
  T_course_apply.Refresh;
end;

procedure TF_main.B_rejectClick(Sender: TObject);
begin  
  Q_update.Close;
  Q_update.SQL.Clear;
  Q_update.SQL.Add('UPDATE COURSE');
  Q_update.SQL.Add('SET STATE="6"');
  Q_update.SQL.Add('WHERE ID="'+T_course_apply['ID']+'"');
  Q_update.ExecSQL;
  T_course_apply.Refresh;
end;

procedure TF_main.Button1Click(Sender: TObject);
var
  counter:integer;
begin
  T_counter_F.Open;
  counter:=T_counter_F['COUNTER_VALUE'];
  T_course_select.First;
  while not T_course_select.Eof do
  begin
    inc(counter);
    T_score.AppendRecord([counter,
      T_course_select['STUDENT'],T_course_select['COURSE'],
      0]);
    T_course_select.Delete;
  end;
  T_counter_F.Edit;
  T_counter_F['COUNTER_VALUE']:=counter;
  T_counter_F.Post;
end;

procedure TF_main.TabSheet3Show(Sender: TObject);
begin
  T_course_select.Open;
  T_score.Open;
end;

end.
