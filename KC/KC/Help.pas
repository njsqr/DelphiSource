unit Help;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  THelpFrm = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HelpFrm: THelpFrm;

implementation

{$R *.dfm}

procedure THelpFrm.Timer1Timer(Sender: TObject);
begin
     HelpFrm.close;
end;

procedure THelpFrm.Image1Click(Sender: TObject);
begin
     HelpFrm.close;
end;

end.
