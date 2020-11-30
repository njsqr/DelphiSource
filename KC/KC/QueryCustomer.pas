unit QueryCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TQueryCustomerFrm = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    RadioButton3: TRadioButton;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
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
  QueryCustomerFrm: TQueryCustomerFrm;
  count:integer;
implementation

uses Login;

{$R *.dfm}

procedure TQueryCustomerFrm.Button1Click(Sender: TObject);
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
            cells[7,i]:='';
           end;
         next;
       end;
    query:='';
    if Radiobutton1.checked=true then
       if edit1.text='' then
          showmessage('请输入相应查询条件')
       else
          query:='select * from Customer where CustomerName like'+''''+'%'+edit1.text+'%'+''''+'order by CustomerID';
    if Radiobutton2.checked=true then
       if edit2.text='' then
          showmessage('请输入相应查询条件')
       else
          query:='select * from Customer where LInkMan like'+''''+'%'+edit2.text+'%'+''''+'order by CustomerID';
    if Radiobutton3.checked=true then
          query:='select * from Customer order by CustomerID ';
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
            cells[0,i]:=fieldbyname('CustomerID').asstring;
            cells[1,i]:=fieldbyname('CustomerName').asstring;
            cells[2,i]:=fieldbyname('Address').asstring;
            cells[3,i]:=fieldbyname('LinkMan').asstring;
            cells[4,i]:=fieldbyname('Tel').asstring;
            cells[5,i]:=fieldbyname('Fax').asstring;
            cells[6,i]:=fieldbyname('Zipcode').asstring;
            cells[7,i]:=fieldbyname('CustomerRemark').asstring;
           end;
         next;
        end;
       end;
   end;
  end; 
end;

procedure TQueryCustomerFrm.Button2Click(Sender: TObject);
begin
       QueryCustomerFrm.hide;
end;

procedure TQueryCustomerFrm.FormShow(Sender: TObject);
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
    edit1.text:='';
    edit2.text:='';
    edit1.setfocus;
end;

procedure TQueryCustomerFrm.FormCreate(Sender: TObject);
begin
     with stringgrid1 do
       begin
        cells[0,0]:='收货单位编号';
        cells[1,0]:='单位名称';
        cells[2,0]:='单位地址';
        cells[3,0]:='联系人姓名';
        cells[4,0]:='联系电话';
        cells[5,0]:='传真号码';
        cells[6,0]:='邮政编码';
        cells[7,0]:='备注信息';
       end;
end;

end.
