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
        CurTime:=inifile.ReadDateTime('ע����Ϣ','��ǰʱ��',now);
        TerTime:=inifile.ReadDateTime('ע����Ϣ','��ֹʱ��',now);
        if CurTime>TerTime then
          begin
            Application.MessageBox('����Ѿ����ڡ�','��ʾ',64);
            Application.Terminate;
          end
        else
          begin
            if trunc(CurTime)>trunc(now) then
              begin
                Application.MessageBox('ϵͳ�����Ѿ����޸Ĺ����������ʹ�á�','��ʾ',64);
                Application.Terminate;
              end
            else
              begin
                if trunc(now)-trunc(CurTime)>1 then
                  begin     //  ����һ�δ���δ򿪵��м��������Ҫ�ӳ�����ֹʱ���ڣ���֤30�졣
                    TerTime:=TerTime+Trunc(now)-Trunc(CurTime)-1;
                    inifile.WriteDateTime('ע����Ϣ','��ֹʱ��',tertime);
                  end ;
                CurTime:=Trunc(now);
              end;
            inifile.WriteDateTime('ע����Ϣ','��ǰʱ��',Curtime);
            label2.Caption :=inttostr(trunc(tertime)-trunc(curtime))+'��';
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
        inifile.WriteDateTime('ע����Ϣ','��ʼʱ��',trunc(now));
        inifile.WriteDateTime('ע����Ϣ','��ǰʱ��',trunc(now));
        inifile.WriteDateTime('ע����Ϣ','��ֹʱ��',trunc(now)+30);
      finally
        inifile.Free;
      end;
    label2.Caption:='30��';
    end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  close;
end;

end.
