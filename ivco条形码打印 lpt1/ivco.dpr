program ivco;

uses
  Forms,
  main in 'main.pas' {Frm_main},
  wl in 'wl.pas' {Frm_wl},
  add in 'add.pas' {Frm_add},
  modify in 'modify.pas' {Frm_modify},
  welcome in 'welcome.pas' {Frm_welcome};

{$R *.res}

begin
  Application.Initialize;
  Application.HelpFile := 'F:\delphi\ivco�������ӡ\HELP.HLP';
  Application.Title := 'IVECO�������ӡ';
  Application.CreateForm(TFrm_welcome, Frm_welcome);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.CreateForm(TFrm_wl, Frm_wl);
  Application.CreateForm(TFrm_add, Frm_add);
  Application.CreateForm(TFrm_modify, Frm_modify);
  Application.Run;
end.
