program PrintBarCode;

uses
  Forms,
  UMain in 'UMain.pas' {frmmain},
  UPrint in 'UPrint.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmmain, frmmain);
  Application.Run;
end.
