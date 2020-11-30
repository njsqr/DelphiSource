unit bujianmingcheng;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  TForm4 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  col_b: TColumn;
  flag_b:integer;
implementation

uses bujianxinxi, main, modiybujian;

{$R *.dfm}

procedure TForm4.Button4Click(Sender: TObject);
begin
  ADOQuery1.Close;
  close;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  form6.ShowModal;
end;

procedure TForm4.FormShow(Sender: TObject);
var str:string;
      n:integer;
begin
  str:=form1.ComboBox1.Text;
  n:=pos('-',str);
  with ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select * from tmap where factory='+''''+copy(str,1,n-1)+'''');
      open;
    end;
  DBGrid1.Columns[0].FieldName:='factory';
  DBGrid1.Columns[1].FieldName:='mapid';
  DBGrid1.Columns[2].FieldName:='mapname';
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  if flag_b=1 then
    begin
      flag_b:=0;
      form8.ShowModal;
    end
  else
    MessageBox(0,'请选择要修改的部件信息！！！', '警告', MB_OK+mb_iconwarning);
end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
  col_b:=column;
  if column.Field.Text<>'' then
    if column.FieldName='factory' then
      showmessage('请选择部件代码或部件名称！！！'+#13+#13+'    这里不修改厂家信息！！！')
    else
      flag_b:=1;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Button4Click(Sender);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  flag_b:=0;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  if flag_b=1 then
    begin
      flag_b:=0;
      AdoTable1.TableName:='tmap';
      AdoTable1.Close;
      AdoTable1.Open;
      AdoTable1.Locate(col_b.Field.FieldName,col_b.Field.Text,[lopartialkey]);
      AdoTable1.Delete;
      AdoTable1.Close;
      AdoQuery1.Close;
      AdoQuery1.Open;
      Form1.FormShow(Sender);

    end
  else
    MessageBox(0,'请选择要删除的部件信息！！！', '警告', MB_OK+mb_iconwarning);

end;

end.
