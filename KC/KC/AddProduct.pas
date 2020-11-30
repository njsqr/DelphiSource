unit AddProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, ADODB;

type
  TAddProductFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddProductFrm: TAddProductFrm;

implementation
uses Login;
{$R *.dfm}

procedure TAddProductFrm.Button1Click(Sender: TObject);
var str:string;
  ProductID:integer;
begin
    if edit1.text='' then
     messagebox(AddProductFrm.handle,'请输入货品名称','警告',mb_ok+mb_iconwarning)
    else
      if edit4.text='' then
         messagebox(AddProductFrm.handle,'请输入底线库存','警告',mb_ok+mb_iconwarning)
      else
         if edit5.text='' then
            messagebox(AddProductFrm.handle,'请输入高线库存','警告',mb_ok+mb_iconwarning)
         else
           begin
             with LoginFrm.ADOQuery1 do
              begin
               close;
               sql.Clear;
               sql.Add('select * from Product');
               OPEN;
               if recordcount=0 then
                 ProductID:=0
               else
                 begin
                   last;
                   ProductID:=recordcount;
                 end;
               inc(ProductID);
               str:='Prod';
               str:=str+inttostr(ProductID);
               appendrecord([str,edit1.Text,combobox1.Text,edit2.Text,edit3.Text,edit4.Text,edit5.Text]);
              end;
           messagebox(AddProductFrm.handle,'货品信息已经成功添加','恭喜',mb_ok);
          end;

end;

procedure TAddProductFrm.Button2Click(Sender: TObject);
begin
     edit1.Text:='';
     edit2.Text:='';
     edit3.Text:='';
     edit4.Text:='0';
     edit5.Text:='';
     edit1.Setfocus;
end;

procedure TAddProductFrm.Button3Click(Sender: TObject);
begin
     AddProductFrm.Hide;
end;



procedure TAddProductFrm.FormShow(Sender: TObject);
begin
    edit1.text:='';
    edit2.text:='';
    edit3.text:='';
    edit4.text:='0';
    edit5.text:='';
    edit1.Setfocus;
end;

end.
