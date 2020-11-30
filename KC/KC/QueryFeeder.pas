unit QueryFeeder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TQueryFeederFrm = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryFeederFrm: TQueryFeederFrm;
  count:integer;
implementation

uses Login;

{$R *.dfm}

procedure TQueryFeederFrm.FormShow(Sender: TObject);
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

procedure TQueryFeederFrm.Button1Click(Sender: TObject);
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
       query:='select * from Feeder where FeederName like'+''''+'%'+edit1.text+'%'+''''+'order by FeederID';
    if Radiobutton2.checked=true then
       if edit2.text='' then
          showmessage('请输入相应查询条件')
       else
       query:='select * from Feeder where LinkMan like'+''''+'%'+edit2.text+'%'+''''+'order by FeederID';
    if Radiobutton3.checked=true then
       query:='select * from Feeder order by FeederID ';
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
            cells[0,i]:=fieldbyname('FeederID').asstring;
            cells[1,i]:=fieldbyname('FeederName').asstring;
            cells[2,i]:=fieldbyname('Address').asstring;
            cells[3,i]:=fieldbyname('LinkMan').asstring;
            cells[4,i]:=fieldbyname('Tel').asstring;
            cells[5,i]:=fieldbyname('Fax').asstring;
            cells[6,i]:=fieldbyname('Zipcode').asstring;
            cells[7,i]:=fieldbyname('FeederRemark').asstring;
           end;
         next;
        end;
       end;
   end;
 end;
end;

procedure TQueryFeederFrm.Button2Click(Sender: TObject);
begin
    QueryFeederFrm.hide;
end;

procedure TQueryFeederFrm.FormCreate(Sender: TObject);
begin
     with stringgrid1 do
       begin
        cells[0,0]:='供货单位编号';
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
