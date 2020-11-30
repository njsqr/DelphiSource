program PrnStatus;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {Main},
  AboutFrm in 'AboutFrm.pas' {About};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
