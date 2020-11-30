unit QueryStorage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TQueryStorageFrm = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    RadioButton3: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryStorageFrm: TQueryStorageFrm;
  count:integer;
implementation

uses Login;

{$R *.dfm}

procedure TQueryStorageFrm.FormCreate(Sender: TObject);
begin
     with stringgrid1 do
       begin
        cells[0,0]:='库存编号';
        cells[1,0]:='仓库编号';
        cells[2,0]:='仓库名称';
        cells[3,0]:='货品编号';
        cells[4,0]:='货品名称';
        cells[5,0]:='货品规格';
        cells[6,0]:='计量单位';
        cells[7,0]:='库存数量';

      end;
end;

procedure TQueryStorageFrm.FormShow(Sender: TObject);
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
            cells[7,i]:='';
          end;
         next;
        end;

    Radiobutton1.checked:=true;
    Edit1.setfocus;
    edit1.text:='';
    edit2.text:='';
    
end;

procedure TQueryStorageFrm.Button1Click(Sender: TObject);
var i:integer;
    query:string;
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
            cells[7,i]:='';
           end;
         next;
        end;
    query:='';
    if Radiobutton1.checked=true then
       if edit1.text='' then
          showmessage('请输入相应查询条件')
       else
          query:='select * from Storage where DepotName like '+''''+'%'+edit1.text+'%'+''''+'order by StorageID';
    if Radiobutton2.checked=true then
       if edit2.text='' then
          showmessage('请输入相应查询条件')
       else
          query:='select * from Storage where ProductName like'+''''+'%'+edit2.text+'%'+''''+'order by StorageID';
   if Radiobutton3.checked=true then
          query:='select * from Storage order by StorageID ';
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
            cells[0,i]:=fieldbyname('StorageID').asstring;
            cells[1,i]:=fieldbyname('DepotID').asstring;
            cells[2,i]:=fieldbyname('DepotName').asstring;
            cells[3,i]:=fieldbyname('ProductID').asstring;
            cells[4,i]:=fieldbyname('ProductName').asstring;
            cells[5,i]:=fieldbyname('Spec').asstring;
            cells[6,i]:=fieldbyname('Unit').asstring;
            cells[7,i]:=fieldbyname('Quantity').asstring;
           end;
          next;
         end;
       end;
   end;
 end;
end;

procedure TQueryStorageFrm.Button2Click(Sender: TObject);
begin
   QueryStorageFrm.hide;
end;

end.
