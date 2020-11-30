unit modiychangjia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DB, ADODB;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses changjiamingcheng, main;

{$R *.dfm}

procedure TForm7.FormShow(Sender: TObject);
begin
  form3.AdoTable1.Locate(col.Field.FieldName,col.Field.Text,[lopartialkey]);
  Edit1.Text:=form3.AdoTable1.FieldValues['factory'];
  Edit2.Text:=form3.AdoTable1.FieldValues['factoryname'];

end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  with form3.AdoTable1 do
    begin
      open;
      edit;
      fieldvalues['factory']:=Edit1.Text;
      fieldvalues['factoryname']:=Edit2.Text;
      post;
      update;
    end;
  form1.FormShow(sender);
  Button2Click(Sender);
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  close;
end;

end.
