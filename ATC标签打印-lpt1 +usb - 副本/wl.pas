unit wl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons;

type
  TFrm_wl = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    Button5: TButton;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }

   { OldGridWnd:TWndMethod;
    procedure NewGridWnd(var Message:TMessage);     }
    
  public
    { Public declarations }
  end;

var
  Frm_wl: TFrm_wl;
     col: TColumn;
    flag:integer;

implementation

uses main, add, modify;

{$R *.dfm}

procedure TFrm_wl.FormShow(Sender: TObject);
begin
  ADOTable1.Close;
  ADOTable1.Open;
  DBGrid1.Columns[0].FieldName:='mapid';
  DBGrid1.Columns[1].FieldName:='mapname';
  DBGrid1.Columns[2].FieldName:='memo';

  Button4Click(Sender);
end;

procedure TFrm_wl.FormCreate(Sender: TObject);
begin
  ADOTable1.Connection:=Frm_main.ADOConnection1;
  DataSource1.DataSet:=ADOTable1;
  DBGrid1.DataSource:=DataSource1;
  ADOTable1.tableName:='tmap';
  ADOTable1.Open;


end;

procedure TFrm_wl.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then 
    TDBGrid(sender).Canvas.Brush.color:=clRed; //��ǰ���Ժ�ɫ��ʾ��������ʹ�ñ�����ǳ��ɫ 
    TDBGrid(sender).Canvas.pen.mode:=pmmask;
    col:=Column;
    TDBGrid(sender).DefaultDrawColumnCell (Rect,DataCol,Column,State); 

end;

procedure TFrm_wl.Button2Click(Sender: TObject);
begin
   AdoTable1.Locate(col.Field.FieldName,col.Field.Text,[lopartialkey]);
   AdoTable1.Delete;
   Frm_main.FormShow(sender);
   FormShow(Sender);
end;

procedure TFrm_wl.Button3Click(Sender: TObject);
begin
   ADOTable1.Close;
   Frm_main.FormShow(sender);
   close;
end;

procedure TFrm_wl.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   ADOTable1.Close;
end;

procedure TFrm_wl.Button1Click(Sender: TObject);
begin
  frm_add.showmodal;
end;

procedure TFrm_wl.Button5Click(Sender: TObject);
begin
  frm_modify.showmodal;
end;

procedure TFrm_wl.DBGrid1TitleClick(Column: TColumn);
var i : integer; 
begin 
  for i:= 1 to DBGrid1.Columns.Count do
    begin
      //�ָ����б�������ΪĬ��
      DBGrid1.Columns[i-1].Title.Font.Color := clWindowText;
      DBGrid1.Columns[i-1].Title.Font.Style := [];
    end;
  if ADOtable1.Sort<>(Column.FieldName+' ASC') then //�ж�ԭ����ʽ
    begin
      ADOtable1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clRed; //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
      Column.Title.Font.Style := [fsBold];
    end
  else
  begin
    ADOTable1.Sort := Column.FieldName+' DESC';
    Column.Title.Font.Color := clBlue; //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
    Column.Title.Font.Style := [fsBold];
  end;
end;


procedure TFrm_wl.Button4Click(Sender: TObject);
begin
  DBGrid1TitleClick(DBGrid1.Columns[0]);
end;

procedure TFrm_wl.BitBtn1Click(Sender: TObject);
begin
  AdoTable1.Locate(col.Field.FieldName,col.Field.Text,[lopartialkey]);
  AdoTable1.Delete;
  Frm_main.FormShow(sender);
  FormShow(Sender);
end;

end.
