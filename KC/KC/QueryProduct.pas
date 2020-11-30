unit QueryProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TQueryProductFrm = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryProductFrm: TQueryProductFrm;
  count:integer;
implementation
uses Login;
{$R *.dfm}

procedure TQueryProductFrm.Button1Click(Sender: TObject);
var query:string;
    i:integer;
begin
    for i:=1 to count do
         begin
          with stringgrid1 do
           begin
            cells[0,i]:='';
            cells[1,i]:='';
            cells[2,i]:='';
            cells[3,i]:='';
            cells[4,i]:='';
            cells[5,i]:='';
            cells[6,i]:='';
           end;
         next;
        end;
    query:='';
    if Radiobutton1.checked=true then
       if edit1.text='' then
          showmessage('请输入相应查询条件')
       else
       query:='select * from Product where ProductName like'+''''+'%'+edit1.text+'%'+''''+'order by ProductID';
    if Radiobutton2.checked=true then
       query:='select * from Product order by ProductID ';
    if query<>'' then
    begin
    with LoginFrm.ADOQuery1 do
     begin
       close;
       sql.clear;
       sql.add(query);
       open;
       first;
       if recordcount=0 then
          begin
          showmessage('对不起，没有符合条件的查询结果！请重新查询！');
          edit1.setfocus;
          end
       else
        begin
         count:=recordcount;
         StringGrid1.RowCount:=recordcount+1;
         for i:=1 to recordcount do
         begin
          with stringgrid1 do
           begin
            cells[0,i]:=fieldbyname('ProductID').asstring;
            cells[1,i]:=fieldbyname('ProductName').asstring;
            cells[2,i]:=fieldbyname('Class').asstring;
            cells[3,i]:=fieldbyname('Spec').asstring;
            cells[4,i]:=fieldbyname('Unit').asstring;
            cells[5,i]:=fieldbyname('Min_sto').asstring;
            cells[6,i]:=fieldbyname('Max_sto').asstring;
           end;
         next;
        end;
       end;
   end;
  end; 
end;

procedure TQueryProductFrm.FormShow(Sender: TObject);
var i:integer;
begin
    for i:=1 to count do
         begin
          with stringgrid1 do
           begin
            cells[0,i]:='';
            cells[1,i]:='';
            cells[2,i]:='';
            cells[3,i]:='';
            cells[4,i]:='';
            cells[5,i]:='';
            cells[6,i]:='';
           end;
         next;
        end;
    Radiobutton1.checked:=true;
    edit1.text:='';
    edit1.setfocus;
end;

procedure TQueryProductFrm.Button2Click(Sender: TObject);
begin
     QueryProductFrm.Hide;
end;



procedure TQueryProductFrm.FormCreate(Sender: TObject);
begin
     with stringgrid1 do
       begin
        cells[0,0]:='货品编号';
        cells[1,0]:='货品名称';
        cells[2,0]:='货品类别';
        cells[3,0]:='货品规格';
        cells[4,0]:='计量单位';
        cells[5,0]:='底线库存';
        cells[6,0]:='高线库存';
       end;
end;

end.





