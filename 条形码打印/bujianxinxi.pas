unit bujianxinxi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses bujianmingcheng, main;

{$R *.dfm}

procedure TForm6.Button2Click(Sender: TObject);
begin
  Form4.ADOQuery1.Close;
  Form4.ADOQuery1.Open;
  close;
end;

procedure TForm6.Button1Click(Sender: TObject);
var n:integer;
begin
  n:=pos('-',edit3.Text);
  with Form4.ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select * from tmap');
      open;
      append;
      fieldvalues['factory']:=copy(edit3.Text,1,n-1);
      fieldvalues['mapid']:=edit1.Text;
      fieldvalues['mapname']:=edit2.Text;
      post;
      update;
      Close;
      Open;
      form4.FormShow(sender);
      form1.FormShow(sender);
      edit1.Clear;
      edit2.Clear;
      edit1.SetFocus;
    end; 
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Text:=form1.ComboBox1.Text;
  Edit1.SetFocus;
end;

end.
