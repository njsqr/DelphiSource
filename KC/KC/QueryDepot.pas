unit QueryDepot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TQueryDepotFrm = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    RadioButton3: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryDepotFrm: TQueryDepotFrm;
  count:integer;
implementation

uses Login;

{$R *.dfm}

procedure TQueryDepotFrm.Button1Click(Sender: TObject);
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
           end;
         next;
       end;
    query:='';   
    if Radiobutton1.checked=true then
       if edit1.text='' then
          showmessage('请输入相应查询条件')
       else
          query:='select * from Depot where DepotName like'+''''+'%'+edit1.text+'%'+''''+'order by DepotID';
    if Radiobutton2.checked=true then
       if edit2.text='' then
          showmessage('请输入相应查询条件')
       else
          query:='select * from Depot where Principal like'+''''+'%'+edit2.text+'%'+''''+'order by DepotID';
    if Radiobutton3.checked=true then
          query:='select * from Depot order by DepotID ';
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
            cells[0,i]:=fieldbyname('DepotID').asstring;
            cells[1,i]:=fieldbyname('DepotName').asstring;
            cells[2,i]:=fieldbyname('Address').asstring;
            cells[3,i]:=fieldbyname('Principal').asstring;
           end;
         next;
        end;
       end;
   end;
  end;
end;



procedure TQueryDepotFrm.Button2Click(Sender: TObject);
begin
    QueryDepotFrm.hide;
end;

procedure TQueryDepotFrm.FormShow(Sender: TObject);
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
           end;
         next;
       end;
    Radiobutton1.checked:=true;
    edit1.text:='';
    edit2.text:='';
    edit1.setfocus;
end;

procedure TQueryDepotFrm.FormCreate(Sender: TObject);
begin
     with stringgrid1 do
       begin
        cells[0,0]:='仓库编号';
        cells[1,0]:='仓库名称';
        cells[2,0]:='仓库位置';
        cells[3,0]:='仓库管理员';
       end;
end;

end.
