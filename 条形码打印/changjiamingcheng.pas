unit changjiamingcheng;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, ADODB;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
    col: TColumn;
   flag:integer;
   
implementation

uses changjia, modiychangjia, main;

{$R *.dfm}

procedure TForm3.Button4Click(Sender: TObject);
begin
  ADOTable1.Close;
  close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  ADOTable1.tableName:='tfactory';
  ADOTable1.Active:=true;
  DBGrid1.Columns[0].FieldName:='factory';
  DBGrid1.Columns[1].FieldName:='factoryname';
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  if flag=1 then
    begin
      flag:=0;
      form7.ShowModal;
    end
  else
    MessageBox(0,'请选择要修改的厂家信息！！！', '警告', MB_OK+mb_iconwarning);
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
  col:=column;
//  if column.Field.Text<>'' then
    flag:=1;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  flag:=0;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Button4Click(Sender);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  form5.ShowModal;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  if flag=1 then
    begin
      flag:=0;
      form3.AdoTable1.Locate(col.Field.FieldName,col.Field.Text,[lopartialkey]);
      form3.AdoTable1.Delete;
      Form1.FormShow(Sender);
    end
  else
    MessageBox(0,'请选择要删除的厂家信息！！！', '警告', MB_OK+mb_iconwarning);
end;
end.
