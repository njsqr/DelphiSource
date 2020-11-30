unit ModifyProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, StdCtrls, Mask, DBTables;

type
  TModifyProductFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModifyProductFrm: TModifyProductFrm;

implementation
uses Login;
{$R *.dfm}



procedure TModifyProductFrm.Button1Click(Sender: TObject);
begin
   

   if dbedit1.text='' then
     showmessage('��Ʒ���Ʋ���Ϊ�գ�')
   else
      if dbedit4.text='' then
         showmessage('���߿�治��Ϊ�գ�')
      else
         if dbedit5.text='' then
            showmessage('���߿�治��Ϊ�գ�')
         else
          begin
              with ADOTable1 do
                begin
                 edit;
                 fieldvalues['ProductName']:=dbedit1.Text;
                 fieldvalues['Class']:=dbcombobox1.text;
                 fieldvalues['Spec']:=dbedit2.Text;
                 fieldvalues['Unit']:=dbedit3.Text;
                 fieldvalues['Min_sto']:=dbedit4.Text;
                 fieldvalues['Max_sto']:=dbedit5.Text;
                 post;
                 update;
                 end;
          showmessage('������Ʒ��Ϣ�Ѿ��ɹ��޸ģ�');
        end;
end;

procedure TModifyProductFrm.Button2Click(Sender: TObject);
begin
   if MessageDlg('ȷ��Ҫɾ��������Ʒ��Ϣ��',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
    ADOTable1.Delete;
    showmessage('������Ʒ��Ϣ�Ѿ��ɹ�ɾ����');
    end;
end;

procedure TModifyProductFrm.Button3Click(Sender: TObject);
begin
  ModifyProductFrm.hide;
end;



procedure TModifyProductFrm.FormShow(Sender: TObject);
begin
     ADOTable1.Active:=False;
     ADOTable1.Active:=True;
     DBEdit1.Setfocus;
end;

procedure TModifyProductFrm.FormCreate(Sender: TObject);
begin
   ADOTable1.Active:=True;   
end;

end.
