unit u_main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids, Db, DBTables;

type
  TF_main = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    i_course_id: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid1: TDBGrid;
    B_add: TButton;
    B_del: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    Label11: TLabel;
    DBGrid2: TDBGrid;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DS_course_info: TDataSource;
    B_show: TButton;
    T_course_info: TTable;
    T_teacher: TTable;
    DS_teacher: TDataSource;
    DS_course_selected: TDataSource;
    Q_course_selected: TQuery;
    T_counter_X: TTable;
    Q_total_credit_hour: TQuery;
    DS_total_credit_hour: TDataSource;
    Q_select: TQuery;
    T_student: TTable;
    Q_course_learned: TQuery;
    DS_course_learned: TDataSource;
    Q_score_max: TQuery;
    DS_score_max: TDataSource;
    Q_score_avg: TQuery;
    DS_score_avg: TDataSource;
    DS_score_min: TDataSource;
    Q_score_min: TQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_showClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure B_addClick(Sender: TObject);
    procedure B_delClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure B_printClick(Sender: TObject);
    procedure i_course_idChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_main: TF_main;

implementation

uses u_login, MainFrm;

{$R *.DFM}

procedure TF_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_login.Database1.Connected:=False;
  F_login.i_user.Text:='';
  F_login.i_passwd.Text:='';
  F_login.show;
end;

procedure TF_main.B_showClick(Sender: TObject);
begin
  T_course_info.Filter:='ID='''+i_course_id.Text+
    ''' and STATE=''3''';
  T_course_info.Filtered:=True;
  T_course_info.Open;
  T_teacher.Open;
end;

procedure TF_main.TabSheet1Show(Sender: TObject);
begin
  Q_course_selected.Close;
  Q_course_selected.Params[0].AsString:=F_login.i_user.Text;
  Q_course_selected.Open;
  Q_total_credit_hour.Close;
  Q_total_credit_hour.Params[0].AsString:=F_login.i_user.Text;
  Q_total_credit_hour.Open;
end;

procedure TF_main.B_addClick(Sender: TObject);
var
  counter:integer;
begin
  //修改计数值
  T_counter_X.Open;
  counter:=T_counter_X['COUNTER_VALUE'];
  Inc(counter);
  T_counter_X.Edit;
  T_counter_X['COUNTER_VALUE']:=counter;
  T_counter_X.Post;
  //添加课程
  if T_course_info.Active and (T_course_info.RecordCount=1) then
  begin
    With Q_select do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO COURSE_SELECT');
      SQL.Add('(ID, COURSE, STUDENT)');
      SQL.Add('VALUES ('+IntToStr(counter)+',"'
        +i_course_id.Text+'","'+F_login.i_user.Text+'");');
      ExecSQL;
    end;
    TabSheet1Show(nil);
  end
  else
    Application.MessageBox('课程编号有误','出错',MB_OK);
end;

procedure TF_main.B_delClick(Sender: TObject);
begin
  With Q_select do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM COURSE_SELECT');
    SQL.Add('WHERE ID='+IntToStr(Q_course_selected.FieldValues['SEL_ID'])+';');
    ExecSQL;
  end;
  TabSheet1Show(nil);
end;

procedure TF_main.FormShow(Sender: TObject);
begin
  T_student.Filter:='ID='''+F_login.i_user.Text+'''';
  T_student.Filtered:=True;
  T_student.Open;
  F_main.Caption:='选课、成绩查询系统。用户:'+F_login.i_user.Text;
end;

procedure TF_main.TabSheet2Show(Sender: TObject);
begin
  Q_course_learned.Close;
  Q_course_learned.Params[0].AsString:=F_login.i_user.Text;
  Q_course_learned.Open;
end;

procedure TF_main.DBGrid2CellClick(Column: TColumn);
begin
  Q_score_max.Close;
  Q_score_max.Params[0].AsString:=Q_course_learned['ID'];
  Q_score_max.Open;
  Q_score_avg.Close;
  Q_score_avg.Params[0].AsString:=Q_course_learned['ID'];
  Q_score_avg.Open;
  Q_score_min.Close;
  Q_score_min.Params[0].AsString:=Q_course_learned['ID'];
  Q_score_min.Open;
end;

procedure TF_main.B_printClick(Sender: TObject);
begin
  With MainForm do
  begin
    i_header.Text:='课表：'+F_login.i_user.Text;
    Q_print_contents.Close;
    Q_print_contents.SQL.Clear;
    Q_print_contents.SQL.Add('SELECT COURSE.ID, COURSE.NAME, COURSE.CLASSROOM, COURSE.TIME');
    Q_print_contents.SQL.Add('FROM COURSE, COURSE_SELECT');
    Q_print_contents.SQL.Add('WHERE COURSE_SELECT.STUDENT="'+F_login.i_user.Text+'"');
    Q_print_contents.SQL.Add('AND COURSE_SELECT.COURSE=COURSE.ID;');
    Q_print_contents.Open;
    StringGrid1.RowCount:=4;
    StringGrid1.Cells[0,0]:='课程编号';
    StringGrid1.Cells[1,0]:='10';
    StringGrid1.Cells[0,1]:='课程名称';
    StringGrid1.Cells[1,1]:='30';
    StringGrid1.Cells[0,2]:='上课地点';
    StringGrid1.Cells[1,2]:='50';
    StringGrid1.Cells[0,3]:='上课时间';
    StringGrid1.Cells[1,3]:='50';
    ShowModal
  end;
end;

procedure TF_main.i_course_idChange(Sender: TObject);
begin
  T_course_info.Close;
  T_teacher.Close;
end;

end.
