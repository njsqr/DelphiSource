unit ModifyStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, DBCtrls, DB, ADODB;

type
  TModifyStockFrm = class(TForm)
    Groupbox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModifyStockFrm: TModifyStockFrm;
  OldQuantity,Quantity:string;
implementation

uses Login;

{$R *.dfm}

procedure TModifyStockFrm.FormShow(Sender: TObject);
begin
   ADOTable1.Active:=False;
   ADOTable1.Active:=True;
   dbedit9.setfocus;
   OldQuantity:=DBEdit9.text;
end;

procedure TModifyStockFrm.Button1Click(Sender: TObject);
begin
  if DBEdit9.text='' then
    showmessage('�������Ʒ����')
  else
    if DBEdit10.text='' then
      showmessage('�������Ʒ����')
    else
      if DBEdit11.text='' then
        showmessage('���������ʱ��')
      else

     begin
       with LoginFrm.adoquery1 do
       begin
         close;
         sql.Clear;
         sql.add('select * from Storage where ProductID='+''''+DBEdit5.text+''''+' and  DepotID='+''''+DBEdit3.text+'''');
         open;
         first;
         Quantity:=floattostr(strtofloat(DBEdit9.Text)+fieldbyname('Quantity').asfloat-strtofloat(OldQuantity));
         if (strtofloat(Quantity)>=0) and (strtofloat(OldQuantity)<>strtofloat(DBEdit9.Text))then
           begin
             edit;
             fieldvalues['Quantity']:=Quantity;
             post;

             with ADOTable1 do
             begin
               edit;
               fieldvalues['Quantity']:=dbedit9.Text;
               fieldvalues['UnitPrice']:=dbedit10.Text;
               fieldvalues['StockDate']:=dbedit11.Text;
               fieldvalues['StockRemark']:=dbmemo1.Text;
               fieldvalues['Payment']:=strtofloat(dbedit9.Text)*strtofloat(dbedit10.text);
               post;
               update;
             end;

             OldQuantity:=dbedit9.text;
             showmessage('���������Ϣ�Ѿ��ɹ��޸ģ�');
           end
         else
           showmessage('��������û���޸Ļ��޸ĺ�����С���㣬���������Ϣ���ܳɹ��޸ģ�');
       end;
     end;
end;

procedure TModifyStockFrm.Button2Click(Sender: TObject);
begin
    if MessageDlg('ȷ��Ҫɾ�����������Ϣ��',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
    ADOTable1.Delete;
    showmessage('���������Ϣ�Ѿ��ɹ�ɾ����');
    end;
end;

procedure TModifyStockFrm.Button3Click(Sender: TObject);
begin
    ModifyStockFrm.hide;
end;

procedure TModifyStockFrm.FormCreate(Sender: TObject);
begin
    ADOTable1.Active:=True;
end;

procedure TModifyStockFrm.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  OldQuantity:=DBEdit9.text;
end;

end.
