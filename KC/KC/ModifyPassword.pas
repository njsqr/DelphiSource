unit ModifyPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TModifyPasswordFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Edit4: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModifyPasswordFrm: TModifyPasswordFrm;

implementation

uses Login;

{$R *.dfm}

procedure TModifyPasswordFrm.FormShow(Sender: TObject);
begin
   edit1.Text:=LoginFrm.edit1.Text;
   edit2.text:='';
   edit3.text:='';
   edit4.text:='';
end;

procedure TModifyPasswordFrm.Button2Click(Sender: TObject);
begin
   edit1.Text:=LoginFrm.edit1.Text;
   edit2.text:='';
   edit3.text:='';
   edit4.text:='';
end;

procedure TModifyPasswordFrm.Button1Click(Sender: TObject);
var username,OldPassword,NewPassword,ConfirmPassword:string;
begin
    if edit2.text='' then
       showmessage('请输入旧密码！')
    else
       if edit3.text='' then
          showmessage('请输入新密码！')
       else
           if edit4.text='' then
              showmessage('请输入确认密码！')
     else
      begin
       Username:=edit1.text;
       Oldpassword:=edit2.text;
       NewPassword:=edit3.text;
       Confirmpassword:=edit4.text;
       
       with LoginFrm.ADOQuery1 do
       begin
       close;
       sql.clear;
       sql.add('select * from login where username='+''''+username+''''+'and password='+''''+oldpassword+'''');
       open;
       first;
       if recordcount=0 then
         begin
         showmessage('请输入正确的旧密码！');
         edit2.text:='';
         edit3.text:='';
         edit4.text:='';
         end
       else
         begin
          if NewPassword<>ConfirmPassword then
             begin
             showmessage('确认密码和新密码不一致，请重新输入！');
             edit2.text:='';
             edit3.text:='';
             edit4.text:='';
             end
          else
            begin
              close;
              sql.clear;
              sql.add('select * from login where username='+''''+username+''''+'and password='+''''+oldpassword+'''');

              open;
              edit;
              fieldvalues['password']:=NewPassword;
              post;
              update;
              showmessage('密码修改成功！');
              ModifyPasswordFrm.hide;
            end;
         end;
        end;
     end;
end;

procedure TModifyPasswordFrm.Button3Click(Sender: TObject);
begin
     ModifyPasswordFrm.hide;
end;

end.
