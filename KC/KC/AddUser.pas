unit AddUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAddUserFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddUserFrm: TAddUserFrm;

implementation

uses Login;

{$R *.dfm}

procedure TAddUserFrm.FormShow(Sender: TObject);
begin
   edit1.Text:='';
   edit2.text:='';
   edit3.text:='';
   combobox1.text:='��ͨ�û�';
end;

procedure TAddUserFrm.Button2Click(Sender: TObject);
begin
   edit1.Text:='';
   edit2.text:='';
   edit3.text:='';
   combobox1.text:='��ͨ�û�';
end;

procedure TAddUserFrm.Button3Click(Sender: TObject);
begin
   AddUserFrm.hide;
end;

procedure TAddUserFrm.Button1Click(Sender: TObject);

begin
    if edit1.text='' then
       showmessage('�������û�����')
    else
       if edit2.text='' then
          showmessage('���������룡')
       else
           if edit3.text='' then
              showmessage('������ȷ�����룡')
     else
      begin
       with LoginFrm.ADOQuery1 do
        begin
         close;
         sql.clear;
         sql.add('select * from login where username='+''''+edit1.text+'''');
         open;
         first;
         if recordcount<>0 then
           begin
            showmessage('�Բ��𣬴��û��Ѿ����ڣ�������ѡ���û�����');
            edit1.Text:='';
            edit2.text:='';
            edit3.text:='';
            combobox1.text:='��ͨ�û�';
           end
         else
           if edit2.text<>edit3.text then
             begin
              showmessage('�������벻һ�£����������룡');
              edit2.text:='';
              edit3.text:='';
              combobox1.text:='��ͨ�û�';
             end
           else
           begin

            last;
            appendrecord([edit1.Text,edit2.Text,combobox1.text]);

            showmessage('���û���ӳɹ���');
            edit1.Text:='';
            edit2.text:='';
            edit3.text:='';
            combobox1.text:='��ͨ�û�';
            end;
         end;
     end;
end;

end.
