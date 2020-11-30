unit changjia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Buttons, ExtCtrls, DB,ADODB;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses main, changjiamingcheng;

{$R *.dfm}

procedure TForm5.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  with form3.ADOTable1 do
    begin
      open;
      append;
      fieldvalues['factory']:=edit1.Text;
      fieldvalues['factoryname']:=edit2.text;
      post;
      update;
      form1.FormShow(sender);
      edit1.Clear;
      edit2.Clear;
      edit1.SetFocus;
    end;
end;

end.
