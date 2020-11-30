unit AddFeeder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAddFeederFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddFeederFrm: TAddFeederFrm;

implementation

uses Login;

{$R *.dfm}

procedure TAddFeederFrm.Button1Click(Sender: TObject);
var str:string;
 FeederID:integer;
begin
  if (edit1.text='') then
    messagebox(AddFeederFrm.handle,'请填写单位名称！','警告',mb_ok+mb_iconwarning)
  else
    begin
      with LoginFrm.ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.Add('select * from Feeder');
          open;
          if recordcount=0 then
            FeederID:=0
          else
            begin
              last;
              FeederID:=recordcount;
            end;
          inc(FeederID);
          str:='Feed';
          str:=str+inttostr(FeederID);
          appendrecord([str,edit1.Text,edit2.Text,edit3.Text,edit4.Text,edit5.Text,edit6.Text,memo1.Text]);
        end;
      messagebox(AddFeederFrm.handle,'供货单位信息已经成功添加','恭喜',mb_ok);
    end;
end;

procedure TAddFeederFrm.FormShow(Sender: TObject);
begin
    edit1.text:='';
    edit2.text:='';
    edit3.text:='';
    edit4.text:='';
    edit5.text:='';
    edit6.text:='';
    Memo1.Text:='';
    edit1.Setfocus;
end;

procedure TAddFeederFrm.Button2Click(Sender: TObject);
begin
    edit1.text:='';
    edit2.text:='';
    edit3.text:='';
    edit4.text:='';
    edit5.text:='';
    edit6.text:='';
    Memo1.Text:='';
    edit1.Setfocus;
end;

procedure TAddFeederFrm.Button3Click(Sender: TObject);
begin
    AddFeederFrm.Hide;
end;

end.
