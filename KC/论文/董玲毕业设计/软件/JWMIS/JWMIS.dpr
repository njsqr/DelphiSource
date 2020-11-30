program JWMIS;

uses
  Forms,
  u_main in 'u_main.pas' {F_main},
  u_login in 'u_login.pas' {F_login},
  MainFrm in '..\Printer\MainFrm.pas' {MainForm},
  AbortFrm in '..\Printer\AbortFrm.pas' {AbortForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TF_login, F_login);
  Application.CreateForm(TF_main, F_main);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAbortForm, AbortForm);
  Application.Run;
end.
