unit ShortProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DB, ADODB;

type
  TShortProductFrm = class(TForm)
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShortProductFrm: TShortProductFrm;

implementation

uses Login;

{$R *.dfm}

procedure TShortProductFrm.FormCreate(Sender: TObject);

begin
     with stringgrid1 do
       begin
        cells[0,0]:='货品编号';
        cells[1,0]:='货品名称';
        cells[2,0]:='货品类型';
        cells[3,0]:='货品规格';
        cells[4,0]:='计量单位';
        cells[5,0]:='底线库存';
        cells[6,0]:='实际库存';
       end;




end;

procedure TShortProductFrm.Button1Click(Sender: TObject);
begin
    ShortProductFrm.hide;
end;

procedure TShortProductFrm.FormShow(Sender: TObject);
var ProductID,SumQuantity:string;
    i,j,flag:integer;
begin
    flag:=0;
    with Adoquery1 do
      begin
       close;
       sql.clear;
       sql.add('select sum(Quantity) as SumQuantity ,ProductID from Storage group by ProductID');
       open;
       first;
       j:=1;
       for i:=1 to recordcount do
        begin
         ProductID:=fieldbyname('ProductID').asstring;
         SumQuantity:=fieldbyname('SumQuantity').asstring;
         with adoquery2 do
           begin
            close;
            sql.clear;
            sql.add('select * from Product where ProductID='+''''+ProductID+'''');
            open;
            first;

            if recordcount<>0 then
            if fieldbyname('Min_sto').AsFloat>strtofloat(sumquantity) then
            with stringgrid1 do
             begin
              cells[0,j]:=fieldbyname('ProductID').asstring;
              cells[1,j]:=fieldbyname('ProductName').asstring;
              cells[2,j]:=fieldbyname('Class').asstring;
              cells[3,j]:=fieldbyname('Spec').asstring;
              cells[4,j]:=fieldbyname('Unit').asstring;
              cells[5,j]:=fieldbyname('Min_sto').asstring;
              cells[6,j]:=Adoquery1.fieldbyname('SumQuantity').asstring;
              flag:=1;
              j:=j+1;
             end;
           end;
         next;
        end; //for
      end;  //query
  if flag<>1 then
  showmessage('没有短线货品！');
end;

end.
