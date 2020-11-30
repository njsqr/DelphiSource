unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, DBTables;

type
  TLoginFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    Edit2: TEdit;
    ADOConnection1: TADOConnection;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    
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
var username,password:string; 
begin
    
   if edit1.Text='' then
      messagebox(LoginFrm.handle,'请输入用户名','警告',mb_ok+mb_iconwarning)
   else
      if edit1.Text='' then
         messagebox(LoginFrm.handle,'请输入密码','警告',mb_ok+mb_iconwarning)
   else
    begin
    username:=edit1.text;
    password:=edit2.text;
     with ADOQuery1 do
      begin
       close;
       sql.clear;
       sql.add('select * from login where username=');
       sql.add(''''+username+''''+'and password='+''''+password+'''');
       open;
       first;
       if recordcount=1 then
          begin
           LoginFrm.Hide;
           MainFrm.Show;
           //加入状态栏
           mainfrm.StatusBar1.Panels[0].Text:='用户：'+username;
           mainfrm.StatusBar1.Panels[1].Text:='现在系统时间是：'+timetostr(time);
           mainfrm.StatusBar1.Panels[2].Text:='  欢迎进入库存管理信息系统！';
          end
      else
         messagebox(LoginFrm.handle,'请输入正确的密码','警告',mb_ok+mb_iconwarning);
      end;
    end;
end;

procedure TLoginFrm.Button2Click(Sender: TObject);
begin
   Application.terminate;
end;



procedure TLoginFrm.FormCreate(Sender: TObject);
//var  path,path1,str,str1:string;
begin
  { path:= ExpandFileName('物资管理.mdb');
   //path:= ExtractFilePath(Application.ExeName);
   str1:=extractfilepath(paramstr(0));
   showmessage(path);
   showmessage(str1);
   str:='Provider=Microsoft.Jet.OLEDB.4.0;';
   str:=str+'Data Source='+path+';';
   str:=str+'Mode=ReadWrite;Persist Security Info=False'; 
   str1:='Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source='+path+'物资管理.mdb;';
   str1:=str1+'Mode=ReadWrite;Extended Properties="";Jet OLEDB:System database="";Jet OLEDB:Registry Path="";';
   str1:=str1+'Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;';
   str1:=str1+'Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";';
   str1:=str1+'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don';
   str1:=str1+''''+'t Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False';
   ADOconnection1.ConnectionString:=str1;

   ADOconnection1.LoginPrompt:=false;
   ADOconnection1.Connected:=true;
 }
end;

end.
