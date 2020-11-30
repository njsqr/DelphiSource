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
 // str:='select * from _138 where ������ like'
  //               +''''+'%'+querrytxbfrm.DBedit10.text+'%'+''''+'order by �������' ;
  str:='select * from SQR where ������ like'
                 +''''+'%'+querrytxbfrm.DBedit10.text+'%'+''''+'order by �������' ;

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
                cells[0,i]:=fieldbyname('�������').asstring;
                cells[1,i]:=fieldbyname('�������').asstring;
                cells[2,i]:=fieldbyname('������').asstring;
                cells[3,i]:=fieldbyname('�����λ').asstring;
                cells[4,i]:=fieldbyname('�������').asstring;
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
      cells[0,0]:='�������';
      cells[1,0]:='�������';
      cells[2,0]:='������';
      cells[3,0]:='�����λ';
      cells[4,0]:='�������';
    end;
end;

end.
