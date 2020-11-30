unit LoginF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLogin = class(TForm)
    btn1: TButton;
    edUserName: TEdit;
    edPasswd: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    FTryTimes: Integer;
    function CheckUserInfo(AUserName, APassword: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

function Login: Boolean;  //登录函数

implementation

{$R *.dfm}
function Login: Boolean;
begin
  //动态创建登录窗口
  with TfrmLogin.Create(nil) do
  begin
    //只有返回OK的时候认为登录成功
    Result := ShowModal() = mrOk;
    Free;
  end;
end;

function TfrmLogin.CheckUserInfo(AUserName, APassword: string): Boolean;
begin
  //简单的验证，可以修改为其它的方式
  Result := (AUserName = 'lihd') and (APassword = 'P@ssw0rd');
end;

procedure TfrmLogin.btn1Click(Sender: TObject);
begin
  Inc(FTryTimes); //尝试登录的次数 + 1

  if CheckUserInfo(edUserName.Text, edPasswd.Text) then
  begin
    //如果通过检查，返回OK
    Self.ModalResult := mrOk;
  end
  else
  begin
    if (FTryTimes > 2) then
    begin
      MessageBox(self.Handle, '你已经尝试登录3次，请联系系统管理员。', '错误', MB_OK + MB_ICONERROR);
      Self.ModalResult := mrCancel;
      Exit;
    end;

    //通不过，报错
    MessageBox(self.Handle, '错误的用户名或密码，请重新输入!', '错误', MB_OK + MB_ICONERROR);
    edUserName.SetFocus();
    edUserName.SelectAll();
  end;
end;

end.

