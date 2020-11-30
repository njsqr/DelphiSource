unit modiybujian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    ADOTable1: TADOTable;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses bujianmingcheng, main;

{$R *.dfm}

procedure TForm8.Button2Click(Sender: TObject);
begin
  AdoTable1.Close;
  close;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
  ADOTable1.tableName:='tmap';
  ADOTable1.Active:=true;
  AdoTable1.Locate(col_b.Field.FieldName,col_b.Field.Text,[lopartialkey]);
  Edit3.Text:=AdoTable1.FieldValues['factory'];
  Edit1.Text:=AdoTable1.FieldValues['mapid'];
  Edit2.Text:=AdoTable1.FieldValues['mapname'];
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
  with AdoTable1 do
    begin
      open;
      edit;
      fieldvalues['mapid']:=Edit1.Text;
      fieldvalues['mapname']:=Edit2.Text;
      post;
      update;
    end;
  form4.ADOQuery1.Close;
  form4.ADOQuery1.Open;;
  form1.FormShow(sender);
  Button2Click(Sender);
end;

end.
