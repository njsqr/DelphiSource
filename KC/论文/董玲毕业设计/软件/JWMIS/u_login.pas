unit u_login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls;

type
  TF_login = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    i_user: TEdit;
    i_passwd: TEdit;
    Button1: TButton;
    Button2: TButton;
    T_user: TTable;
    Database1: TDatabase;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_login: TF_login;

implementation

uses u_main;

{$R *.DFM}

procedure TF_login.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TF_login.Button1Click(Sender: TObject);
begin
  try
    Database1.Connected:=True;
    T_user.Filter:='ID='''+i_user.Text+'''';
    T_user.Filtered:=True;
    T_user.Open;
  except
    Application.MessageBox('����ϵͳ����Ա��ϵ��', '���ݿ����Ӵ���', MB_OK);
    Application.Terminate;
  end;
  if T_user.RecordCount=1 then
  begin
    if T_user['PASSWD']=i_passwd.Text then
    begin
      if T_user['AUTHORITY']='3' then
      begin
        F_login.Hide;
        F_main.show;
      end
      else
       Application.MessageBox('��ѡ����ʵĵ�¼�����', '�û�Ȩ�޴���',MB_OK);
    end
    else
      Application.MessageBox('��ȷ�����룬ע���Сд��', '���벻ƥ��', MB_OK);
  end
  else
    Application.MessageBox('��ȷ���û����Ƿ���ȷ��', '�޴��û�', MB_OK);
end;

end.
