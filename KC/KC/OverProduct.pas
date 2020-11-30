unit OverProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids;

type
  TOverProductFrm = class(TForm)
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OverProductFrm: TOverProductFrm;

implementation

{$R *.dfm}



procedure TOverProductFrm.FormCreate(Sender: TObject);

begin

     with stringgrid1 do
       begin
        cells[0,0]:='货品编号';
        cells[1,0]:='货品名称';
        cells[2,0]:='货品类型';
        cells[3,0]:='货品规格';
        cells[4,0]:='计量单位';
        cells[5,0]:='高线库存';
        cells[6,0]:='实际库存';
       end;
end;

procedure TOverProductFrm.FormShow(Sender: TObject);
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
            //sql.add('select * from Product where ProductID='+''''+ProductID+''''+'and cast(Max_sto as float)< SumQu');
            sql.add('select * from Product where ProductID='+''''+ProductID+'''');

            open;
            first;

            if recordcount<>0 then
              if fieldbyname('Max_sto').AsFloat<strtofloat(SumQuantity) then
                with stringgrid1 do
                  begin
                    cells[0,j]:=fieldbyname('ProductID').asstring;
                    cells[1,j]:=fieldbyname('ProductName').asstring;
                    cells[2,j]:=fieldbyname('Class').asstring;
                    cells[3,j]:=fieldbyname('Spec').asstring;
                    cells[4,j]:=fieldbyname('Unit').asstring;
                    cells[5,j]:=fieldbyname('Max_sto').asstring;
                    cells[6,j]:=Adoquery1.fieldbyname('SumQuantity').asstring;
                    flag:=1;
                    inc(j);
                  end;
                //else
                 // dec(j);
           end;
          next;
        end; //for
    end;  //query

  if flag<>1 then
    showmessage('没有超储货品！');

end;

procedure TOverProductFrm.Button1Click(Sender: TObject);
begin
    OverProductFrm.hide;
end;

end.
