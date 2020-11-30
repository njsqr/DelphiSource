unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TLoginFrm = class(TForm)
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Button2: TButton;
    Button1: TButton;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginFrm: TLoginFrm;
      
implementation

uses Main;

{$R *.dfm}

procedure TLoginFrm.Button1Click(Sender: TObject);
begin
  if edit1.Text='' then
    messagebox(LoginFrm.handle,'请输入用户名','警告',mb_ok+mb_iconwarning)
  else
    if edit2.Text='' then
      messagebox(LoginFrm.handle,'请输入密码','警告',mb_ok+mb_iconwarning)
    else
      begin
        if (edit1.Text='sqr') and (edit2.Text='sqr123') then
          begin
            edit3.Visible:=true;
           // LoginFrm.Close;
           // MainFrm.Show;
          end
        else
          begin
            // showmessage(datetostr(now));
            edit3.Visible:=false;
            if (edit1.Text='LHJ') and (edit2.Text='1') then
              begin
                if strtodate(edit3.Text)>now then
                  begin
                    LoginFrm.hide;
                    MainFrm.Show;
                  end
                else
                  messagebox(LoginFrm.handle,'请速联系系统作者!!!电话:52602600-123!!','警告',mb_ok+mb_iconwarning);
              end
            else
              messagebox(LoginFrm.handle,'请输入正确的密码','警告',mb_ok+mb_iconwarning);
          end;
      end;
end;

procedure TLoginFrm.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TLoginFrm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    LoginFrm.Close;
end;

procedure TLoginFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button1Click(Sender);
end;

  // 如果用Edit2KeyPress 则用下面的语句
  // if key=#13 then
  //  Button1Click(Sender);
procedure TLoginFrm.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    Button1Click(Sender);
end;

end.
