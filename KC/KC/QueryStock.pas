unit QueryStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TQueryStockFrm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryStockFrm: TQueryStockFrm;
  count:integer;
implementation

uses Login;

{$R *.dfm}

procedure TQueryStockFrm.FormShow(Sender: TObject);
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
            cells[8,i]:='';
            cells[9,i]:='';
            cells[10,i]:='';
            cells[11,i]:='';
            cells[12,i]:='';
            cells[13,i]:='';
          end;
         next;
        end;
    Radiobutton1.checked:=true;
    Edit1.setfocus;
    edit1.text:='';
    edit2.text:='';
    edit3.text:='';
end;

procedure TQueryStockFrm.Button2Click(Sender: TObject);
begin
    QueryStockFrm.hide;
end;
 
procedure TQueryStockFrm.Button1Click(Sender: TObject);
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
            cells[8,i]:='';
            cells[9,i]:='';
            cells[10,i]:='';
            cells[11,i]:='';
            cells[12,i]:='';
            cells[13,i]:='';
          end;
         next;
        end;
    query:='';
    if Radiobutton1.checked=true then
       if edit1.text='' then
          showmessage('请输入相应查询条件')
       else
          query:='select * from Stock where ProductName like '+''''+'%'+edit1.text+'%'+''''+'order by StockID';
    if Radiobutton2.checked=true then
       if edit2.text='' then
          showmessage('请输入相应查询条件')
       else
          query:='select * from Stock where DepotName like'+''''+'%'+edit2.text+'%'+''''+'order by StockID';
    if Radiobutton3.checked=true then
       if edit3.text='' then
          showmessage('请输入相应查询条件')
       else
       query:='select * from Stock where FeederName like'+''''+'%'+edit3.text+'%'+''''+'order by StockID';
    if Radiobutton4.checked=true then
       query:='select * from Stock order by StockID ';
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
            cells[0,i]:=fieldbyname('StockID').asstring;
            cells[1,i]:=fieldbyname('FeederID').asstring;
            cells[2,i]:=fieldbyname('FeederName').asstring;
            cells[3,i]:=fieldbyname('DepotID').asstring;
            cells[4,i]:=fieldbyname('DepotName').asstring;
            cells[5,i]:=fieldbyname('ProductID').asstring;
            cells[6,i]:=fieldbyname('ProductName').asstring;
            cells[7,i]:=fieldbyname('Spec').asstring;
            cells[8,i]:=fieldbyname('Unit').asstring;
            cells[9,i]:=fieldbyname('Quantity').asstring;
            cells[10,i]:=fieldbyname('UnitPrice').asstring;
            cells[11,i]:=fieldbyname('Payment').asstring;
            cells[12,i]:=fieldbyname('StockDate').asstring;
            cells[13,i]:=fieldbyname('StockRemark').asstring;
           end;
         next;
        end;
       end;
   end;
  end;
end;

procedure TQueryStockFrm.FormCreate(Sender: TObject);
begin
      with stringgrid1 do
       begin
        cells[0,0]:='入库编号';
        cells[1,0]:='供货单位编号';
        cells[2,0]:='供货单位名称';
        cells[3,0]:='仓库编号';
        cells[4,0]:='仓库名称';
        cells[5,0]:='货品编号';
        cells[6,0]:='货品名称';
        cells[7,0]:='货品规格';
        cells[8,0]:='计量单位';
        cells[9,0]:='货品数量';
        cells[10,0]:='货品单价';
        cells[11,0]:='总付款';
        cells[12,0]:='入库时间';
        cells[13,0]:='备注信息';
       end;
    
end;

end.
