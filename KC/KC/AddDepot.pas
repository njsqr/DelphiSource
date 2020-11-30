unit AddDepot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAddDepotFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
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
  AddDepotFrm: TAddDepotFrm;

implementation

uses Login;

{$R *.dfm}

procedure TAddDepotFrm.Button1Click(Sender: TObject);
var str:string;
  DepotID:integer;
begin
  if (edit1.text='')or(edit2.text='')or(edit3.text='') then
     messagebox(AddDepotFrm.handle,'仓库信息填写不全！','警告',mb_ok+mb_iconwarning)
    else
     begin
      with LoginFrm.ADOQuery1 do
      begin
       close;
       sql.clear;
       sql.Add('select * from Depot');
       open;
       if recordcount=0 then
         DepotID:=0
       else
         begin
           last;
           DepotID:=recordcount;
         end;
       inc(DepotID);
       str:='Depo';
       str:=str+inttostr(DepotID);
       appendrecord([str,edit1.Text,edit2.Text,edit3.Text]);

      end;
      messagebox(AddDepotFrm.handle,'仓库信息已经成功添加','恭喜',mb_ok);
     end;
end;

procedure TAddDepotFrm.Button2Click(Sender: TObject);
begin
     edit1.Text:='';
     edit2.Text:='';
     edit3.Text:='';
     edit1.Setfocus;
end;

procedure TAddDepotFrm.Button3Click(Sender: TObject);
begin
    AddDepotFrm.Hide;
end;


procedure TAddDepotFrm.FormShow(Sender: TObject);
begin
    edit1.text:='';
    edit2.text:='';
    edit3.text:='';
    edit1.Setfocus;
end;

end.
