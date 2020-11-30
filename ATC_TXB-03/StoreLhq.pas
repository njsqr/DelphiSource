unit StoreLhq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB;

type
  TStoreLhqFrm = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StoreLhqFrm: TStoreLhqFrm;

implementation

uses Data, QuerryTxb;

{$R *.dfm}

procedure TStoreLhqFrm.FormShow(Sender: TObject);
var  str:string;
 count,i:integer;
begin
 // str:='select * from _138 where 存货规格 like'
  //               +''''+'%'+querrytxbfrm.DBedit10.text+'%'+''''+'order by 存货编码' ;
  str:='select * from SQR where 存货规格 like'
                 +''''+'%'+querrytxbfrm.DBedit10.text+'%'+''''+'order by 存货编码' ;

  with datam.Lhq_que do
    begin
      close;
      sql.clear;
      sql.add(str);
      open;

  //datam.DataSource1.DataSet:=datam.Lhq_que;
  //dbgrid1.DataSource:= datam.DataSource1;
      begin
        count:=recordcount;
        StringGrid1.RowCount:=recordcount+1;
        for i:=1 to recordcount do
          begin
            with stringgrid1 do
              begin
                cells[0,i]:=fieldbyname('存货编码').asstring;
                cells[1,i]:=fieldbyname('存货名称').asstring;
                cells[2,i]:=fieldbyname('存货规格').asstring;
                cells[3,i]:=fieldbyname('存货单位').asstring;
                cells[4,i]:=fieldbyname('结存数量').asstring;
              end;
            next;
          end;
      end;
    end;
end;

procedure TStoreLhqFrm.FormCreate(Sender: TObject);
begin
  with stringgrid1 do
    begin
      cells[0,0]:='存货编码';
      cells[1,0]:='存货名称';
      cells[2,0]:='存货规格';
      cells[3,0]:='存货单位';
      cells[4,0]:='结存数量';
    end;
end;

end.
