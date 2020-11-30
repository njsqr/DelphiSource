unit Welcome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TWelcomeFrm = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WelcomeFrm: TWelcomeFrm;

implementation

uses login;
{$R *.dfm}

procedure TWelcomeFrm.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled:=false;
  WelcomeFrm.hide;
  loginFrm.Show;
end;

procedure TWelcomeFrm.FormCreate(Sender: TObject);
begin
  
  timer1.Interval:=2000;
  timer1.Enabled:=true;
end;

end.
