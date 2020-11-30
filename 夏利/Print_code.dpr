program Print_code;

uses
  Forms,
  main in 'main.pas' {F_main};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÏÄÀûÌõĞÎÂë';
  Application.CreateForm(TF_main, F_main);
  Application.Run;
end.
