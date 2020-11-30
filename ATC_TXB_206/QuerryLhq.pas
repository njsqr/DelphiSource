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
      showmessage('��������Ӧ��ѯ������ͺ�!')
    else
      if Radiogroup1.ItemIndex=-1 then        showmessage('��ѡ����Ӧ��ѯϵ���ͺ�!')      else        begin          if Radiogroup1.ItemIndex=0 then            query:='select * from 066 where ����� like'                   +''''+'%'+edit1.text+'%'+''''+'order by ��Ʒ�ͺ�'
          else
            if Radiogroup1.ItemIndex=1 then
              query:='select * from 086 where ����� like'                     +''''+'%'+edit1.text+'%'+''''+'order by ��Ʒ�ͺ�'
            else
              if Radiogroup1.ItemIndex=2 then
                query:='select * from 106 where ����� like'                   +''''+'%'+edit1.text+'%'+''''+'order by ��Ʒ�ͺ�'
              else
                if Radiogroup1.ItemIndex=3 then
                  query:='select * from 066D where ����� like'                     +''''+'%'+edit1.text+'%'+''''+'order by ��Ʒ�ͺ�'
                else
                  if Radiogroup1.ItemIndex=4 then
                    query:='select * from 106K where ����� like'                       +''''+'%'+edit1.text+'%'+''''+'order by ��Ʒ�ͺ�'
                  else
                    if Radiogroup1.ItemIndex=5 then
                       query:='select * from 166 where ����� like'                          +''''+'%'+edit1.text+'%'+''''+'order by ��Ʒ�ͺ�'
                    else
                      query:='select * from 206 where ����� like'
                         +''''+'%'+edit1.text+'%'+''''+'order by ��Ʒ�ͺ�' ;
        end;
 { if Radiobutton2.checked=true then
    if edit2.text='' then
      showmessage('��������Ӧ��ѯ���°��ͺ�!')
    else
      begin          if Radiogroup1.ItemIndex=0 then            query:='select * from 066 where ���°� like'                   +''''+'%'+edit2.text+'%'+''''+'order by ��Ʒ�ͺ�'
          else
            if Radiogroup1.ItemIndex=1 then
              query:='select * from 086 where ���°� like'                     +''''+'%'+edit2.text+'%'+''''+'order by ��Ʒ�ͺ�'
            else
              query:='select * from 106 where ���°� like'
                 +''''+'%'+edit2.text+'%'+''''+'order by ��Ʒ�ͺ�' ;
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
              showmessage('�Բ���û�з��������Ĳ�ѯ����������²�ѯ��');
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
                      cells[0,i]:=fieldbyname('��Ʒ�ͺ�').asstring;
                      cells[1,i]:=fieldbyname('���°�').asstring;
                      cells[2,i]:=fieldbyname('�����').asstring;
                      cells[3,i]:=fieldbyname('ͼֽ״̬').asstring;
                      cells[4,i]:=fieldbyname('�������').asstring;
                    end;
                  next;
                end;
            end;
        end;
    end;
  //*************�����ѯ *********
  if flag<>0 then
    begin
      label1.caption:='��˾�����������������';

      str:='select * from SQR where ������ like'
                     +''''+'%'+edit1.text+'%'+''''+'order by �������' ;

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
                    cells[0,i]:=fieldbyname('�������').asstring;
                    cells[1,i]:=fieldbyname('�������').asstring;
                    cells[2,i]:=fieldbyname('������').asstring;
                    cells[3,i]:=fieldbyname('�������').asstring;
                  end;
                next;
              end;
          end;
        end;
      end
    else
      label1.caption:='����û���ҵ�������������޷���ѯ����';

    //*********end��*****
end;

procedure TQuerryLhqFrm.FormCreate(Sender: TObject);
begin
  with stringgrid1 do
    begin
      cells[0,0]:='��Ʒ�ͺ�';
      cells[1,0]:='���°�';
      cells[2,0]:='�����';
      cells[3,0]:='ͼֽ״̬';
      cells[4,0]:='�������';

    end;

  with stringgrid2 do
    begin
      cells[0,0]:='�������';
      cells[1,0]:='�������';
      cells[2,0]:='������';
      cells[3,0]:='�������';
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
