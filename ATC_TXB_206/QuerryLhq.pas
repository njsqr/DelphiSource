unit QuerryLhq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TQuerryLhqFrm = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    RadioGroup1: TRadioGroup;
    StringGrid2: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuerryLhqFrm: TQuerryLhqFrm;
         count:integer;
implementation

uses Data;

{$R *.dfm}

procedure TQuerryLhqFrm.Button1Click(Sender: TObject);
var query,str:string;
    i:integer;
begin
  query:='';
 // if Radiobutton1.checked=true then
    if edit1.text='' then
      showmessage('请输入相应查询离合器型号!')
    else
      if Radiogroup1.ItemIndex=-1 then        showmessage('请选择相应查询系列型号!')      else        begin          if Radiogroup1.ItemIndex=0 then            query:='select * from 066 where 离合器 like'                   +''''+'%'+edit1.text+'%'+''''+'order by 产品型号'
          else
            if Radiogroup1.ItemIndex=1 then
              query:='select * from 086 where 离合器 like'                     +''''+'%'+edit1.text+'%'+''''+'order by 产品型号'
            else
              if Radiogroup1.ItemIndex=2 then
                query:='select * from 106 where 离合器 like'                   +''''+'%'+edit1.text+'%'+''''+'order by 产品型号'
              else
                if Radiogroup1.ItemIndex=3 then
                  query:='select * from 066D where 离合器 like'                     +''''+'%'+edit1.text+'%'+''''+'order by 产品型号'
                else
                  if Radiogroup1.ItemIndex=4 then
                    query:='select * from 106K where 离合器 like'                       +''''+'%'+edit1.text+'%'+''''+'order by 产品型号'
                  else
                    if Radiogroup1.ItemIndex=5 then
                       query:='select * from 166 where 离合器 like'                          +''''+'%'+edit1.text+'%'+''''+'order by 产品型号'
                    else
                      query:='select * from 206 where 离合器 like'
                         +''''+'%'+edit1.text+'%'+''''+'order by 产品型号' ;
        end;
 { if Radiobutton2.checked=true then
    if edit2.text='' then
      showmessage('请输入相应查询感温包型号!')
    else
      begin          if Radiogroup1.ItemIndex=0 then            query:='select * from 066 where 感温包 like'                   +''''+'%'+edit2.text+'%'+''''+'order by 产品型号'
          else
            if Radiogroup1.ItemIndex=1 then
              query:='select * from 086 where 感温包 like'                     +''''+'%'+edit2.text+'%'+''''+'order by 产品型号'
            else
              query:='select * from 106 where 感温包 like'
                 +''''+'%'+edit2.text+'%'+''''+'order by 产品型号' ;
        end;         }  if query<>'' then
    begin
      with datam.Txb do
        begin
          close;
          sql.clear;
          sql.add(query);
          open;
          first;
          if recordcount=0 then
            begin
              showmessage('对不起，没有符合条件的查询结果！请重新查询！');
              //edit1.TEXT:='LHQ-';
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
                      cells[0,i]:=fieldbyname('产品型号').asstring;
                      cells[1,i]:=fieldbyname('感温包').asstring;
                      cells[2,i]:=fieldbyname('离合器').asstring;
                      cells[3,i]:=fieldbyname('图纸状态').asstring;
                      cells[4,i]:=fieldbyname('替代机型').asstring;
                    end;
                  next;
                end;
            end;
        end;
    end;
  //*************库存表查询 *********
  if flag<>0 then
    begin
      label1.caption:='公司库存离合器结存数量：';

      str:='select * from SQR where 存货规格 like'
                     +''''+'%'+edit1.text+'%'+''''+'order by 存货编码' ;

      with datam.Lhq_que do
        begin
          close;
          sql.clear;
          sql.add(str);
          open;

          begin
            count:=recordcount;
            StringGrid2.RowCount:=recordcount+1;
            for i:=1 to recordcount do
              begin
                with stringgrid2 do
                  begin
                    cells[0,i]:=fieldbyname('存货编码').asstring;
                    cells[1,i]:=fieldbyname('存货名称').asstring;
                    cells[2,i]:=fieldbyname('存货规格').asstring;
                    cells[3,i]:=fieldbyname('结存数量').asstring;
                  end;
                next;
              end;
          end;
        end;
      end
    else
      label1.caption:='由于没有找到离合器库存表，而无法查询！！';

    //*********end表*****
end;

procedure TQuerryLhqFrm.FormCreate(Sender: TObject);
begin
  with stringgrid1 do
    begin
      cells[0,0]:='产品型号';
      cells[1,0]:='感温包';
      cells[2,0]:='离合器';
      cells[3,0]:='图纸状态';
      cells[4,0]:='替代机型';

    end;

  with stringgrid2 do
    begin
      cells[0,0]:='存货编码';
      cells[1,0]:='存货名称';
      cells[2,0]:='存货规格';
      cells[3,0]:='结存数量';
    end;
end;

procedure TQuerryLhqFrm.FormShow(Sender: TObject);
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
        end;
      next;
    end;
  edit1.text:='LHQ-';
  edit1.setfocus;
end;

procedure TQuerryLhqFrm.Button2Click(Sender: TObject);
begin
  datam.Txb.CLOSE;
  CLOSE;
end;

procedure TQuerryLhqFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button1Click(Sender);
end;

procedure TQuerryLhqFrm.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    Button1Click(Sender);
end;

end.
