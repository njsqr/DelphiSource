unit ModifyCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TModifyCustomerFrm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModifyCustomerFrm: TModifyCustomerFrm;

implementation

{$R *.dfm}

procedure TModifyCustomerFrm.Button1Click(Sender: TObject);
begin
   if (dbedit1.text='')  then
     showmessage('请填写单位名称！')
   else
    begin
     with ADOTable1 do
       begin
        edit;
        fieldvalues['CustomerName']:=dbedit1.Text;
        fieldvalues['Address']:=dbedit2.Text;
        fieldvalues['LinkMan']:=dbedit3.Text;
        fieldvalues['Tel']:=dbedit4.Text;
        fieldvalues['Fax']:=dbedit5.Text;
        fieldvalues['Zipcode']:=dbedit6.Text;
        fieldvalues['CustomerRemark']:=dbMemo1.Text;
        post;
        update;
       end;
      showmessage('此条单位信息已经成功修改！');
    end;
end;

procedure TModifyCustomerFrm.Button2Click(Sender: TObject);
begin
    if MessageDlg('确定要删除此条单位信息吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
    ADOTable1.Delete;
    showmessage('此条单位信息已经成功删除！');
    end;
end;

procedure TModifyCustomerFrm.Button3Click(Sender: TObject);
begin
     ModifyCustomerFrm.hide;
end;

procedure TModifyCustomerFrm.FormShow(Sender: TObject);
begin
     ADOTable1.Active:=False;
     ADOTable1.Active:=True;
     DBEdit1.Setfocus;
end;

end.
