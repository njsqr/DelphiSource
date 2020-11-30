unit QuerySell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TQuerySellFrm = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuerySellFrm: TQuerySellFrm;
  count:integer;
implementation

uses Login;

{$R *.dfm}

procedure TQuerySellFrm.FormShow(Sender: TObject);
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

procedure TQuerySellFrm.Button1Click(Sender: TObject);
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
          showmessage('��������Ӧ��ѯ����')
       else
          query:='select * from Sell where ProductName like '+''''+'%'+edit1.text+'%'+''''+'order by SellID';
    if Radiobutton2.checked=true then
       if edit2.text='' then
          showmessage('��������Ӧ��ѯ����')
       else
          query:='select * from Sell where DepotName like'+''''+'%'+edit2.text+'%'+''''+'order by SellID';
    if Radiobutton3.checked=true then
       if edit3.text='' then
          showmessage('��������Ӧ��ѯ����')
       else
          query:='select * from Sell where CustomerName like'+''''+'%'+edit3.text+'%'+''''+'order by SellID';
    if Radiobutton4.checked=true then
          query:='select * from Sell order by SellID ';
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
          showmessage('�Բ���û�з��������Ĳ�ѯ����������²�ѯ��');
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
            cells[0,i]:=fieldbyname('SellID').asstring;
            cells[1,i]:=fieldbyname('CustomerID').asstring;
            cells[2,i]:=fieldbyname('CustomerName').asstring;
            cells[3,i]:=fieldbyname('DepotID').asstring;
            cells[4,i]:=fieldbyname('DepotName').asstring;
            cells[5,i]:=fieldbyname('ProductID').asstring;
            cells[6,i]:=fieldbyname('ProductName').asstring;
            cells[7,i]:=fieldbyname('Spec').asstring;
            cells[8,i]:=fieldbyname('Unit').asstring;
            cells[9,i]:=fieldbyname('Quantity').asstring;
            cells[10,i]:=fieldbyname('UnitPrice').asstring;
            cells[11,i]:=fieldbyname('Payment').asstring;
            cells[12,i]:=fieldbyname('SellDate').asstring;
            cells[13,i]:=fieldbyname('SellRemark').asstring;
           end;
         next;
        end;
       end;
   end;
 end;
end;

procedure TQuerySellFrm.FormCreate(Sender: TObject);
begin
    with stringgrid1 do
       begin
        cells[0,0]:='������';
        cells[1,0]:='�ջ���λ���';
        cells[2,0]:='�ջ���λ����';
        cells[3,0]:='�ֿ���';
        cells[4,0]:='�ֿ�����';
        cells[5,0]:='��Ʒ���';
        cells[6,0]:='��Ʒ����';
        cells[7,0]:='��Ʒ���';
        cells[8,0]:='������λ';
        cells[9,0]:='��Ʒ����';
        cells[10,0]:='��Ʒ����';
        cells[11,0]:='���տ�';
        cells[12,0]:='����ʱ��';
        cells[13,0]:='��ע��Ϣ';
      end;
end;

procedure TQuerySellFrm.Button2Click(Sender: TObject);
begin
    QuerySellFrm.hide;
end;

end.
