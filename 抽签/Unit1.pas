unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, ADODB;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ADOTable1: TADOTable;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
 // a:array[1..5] of Integer;
begin
  //flag:=true;
  Randomize;

  I:=random(115);
  //showmessage(inttostr(i));

   adotable1.Locate('ÐòºÅ',inttostr(i),[lopartialkey]);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

end.
