unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,inifiles;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
Var
  inifile: Tinifile;
  CurTime,TerTime:TDateTime;
begin
  if FileExists(Trim(ExtractFilePath(Application.ExeName)+
                 'regist.ini'))=True then
    begin
      try
        inifile:=Tinifile.Create(Trim(ExtractFilePath(Application.ExeName)+
                 'regist.ini'));
        CurTime:=inifile.ReadDateTime('注册信息','当前时间',now);
        TerTime:=inifile.ReadDateTime('注册信息','终止时间',now);
        if CurTime>TerTime then
          begin
            Application.MessageBox('软件已经过期。','提示',64);
            Application.Terminate;
          end
        else
          begin
            if trunc(CurTime)>trunc(now) then
              begin
                Application.MessageBox('系统日期已经被修改过，软件不能使用。','提示',64);
                Application.Terminate;
              end
            else
              begin
                if trunc(now)-trunc(CurTime)>1 then
                  begin     //  从上一次打开这次打开的中间的天数，要延长到终止时间内，保证30天。
                    TerTime:=TerTime+Trunc(now)-Trunc(CurTime)-1;
                    inifile.WriteDateTime('注册信息','终止时间',tertime);
                  end ;
                CurTime:=Trunc(now);
              end;
            inifile.WriteDateTime('注册信息','当前时间',Curtime);
            label2.Caption :=inttostr(trunc(tertime)-trunc(curtime))+'天';
          end;
        finally
          inifile.Free;
        end;
    end
  else
    begin
      try
        inifile:=Tinifile.Create(Trim(ExtractFilePath(Application.ExeName)+
                 'regist.ini'));
        inifile.WriteDateTime('注册信息','起始时间',trunc(now));
        inifile.WriteDateTime('注册信息','当前时间',trunc(now));
        inifile.WriteDateTime('注册信息','终止时间',trunc(now)+30);
      finally
        inifile.Free;
      end;
    label2.Caption:='30天';
    end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  close;
end;

end.
