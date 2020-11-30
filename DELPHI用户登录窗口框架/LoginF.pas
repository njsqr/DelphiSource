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

function Login: Boolean;  //��¼����

implementation

{$R *.dfm}
function Login: Boolean;
begin
  //��̬������¼����
  with TfrmLogin.Create(nil) do
  begin
    //ֻ�з���OK��ʱ����Ϊ��¼�ɹ�
    Result := ShowModal() = mrOk;
    Free;
  end;
end;

function TfrmLogin.CheckUserInfo(AUserName, APassword: string): Boolean;
begin
  //�򵥵���֤�������޸�Ϊ�����ķ�ʽ
  Result := (AUserName = 'lihd') and (APassword = 'P@ssw0rd');
end;

procedure TfrmLogin.btn1Click(Sender: TObject);
begin
  Inc(FTryTimes); //���Ե�¼�Ĵ��� + 1

  if CheckUserInfo(edUserName.Text, edPasswd.Text) then
  begin
    //���ͨ����飬����OK
    Self.ModalResult := mrOk;
  end
  else
  begin
    if (FTryTimes > 2) then
    begin
      MessageBox(self.Handle, '���Ѿ����Ե�¼3�Σ�����ϵϵͳ����Ա��', '����', MB_OK + MB_ICONERROR);
      Self.ModalResult := mrCancel;
      Exit;
    end;

    //ͨ����������
    MessageBox(self.Handle, '������û��������룬����������!', '����', MB_OK + MB_ICONERROR);
    edUserName.SetFocus();
    edUserName.SelectAll();
  end;
end;

end.

