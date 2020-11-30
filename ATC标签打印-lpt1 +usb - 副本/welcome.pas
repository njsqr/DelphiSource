unit welcome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls,Registry;

type
  TFrm_welcome = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_welcome: TFrm_welcome;
  re_id,max:integer;
implementation

uses main;

{$R *.dfm}

procedure TFrm_welcome.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled:=false;
  Frm_Welcome.hide;
  Frm_main.Show;
end;

procedure TFrm_welcome.FormCreate(Sender: TObject);
var
  registerTemp:TRegistry;
  inputstr,get_id:string;
  dy,clickedok:boolean;
begin
  max:=60;
  dy:=false;
  //����Ƿ�ע���ڡ�����ʹ�õı�־��false������ʹ�á�
  registerTemp:=TRegistry.Create;//׼��ʹ��ע���
  with registerTemp do
    begin
      RootKey:=HKEY_LOCAL_MACHINE; //����ڴ˸���
      if OpenKey('Software\Microsoft\Windows\CurrentVersion\Mark',true) then
       //����һĿ¼����ű�־ֵ����Ȼ�ɷ����Ѵ��ڵ�Ŀ¼�¡���ô�������ѷ��ְɣ�
        begin
          if valueexists('gc_id') then
            //��gc_id��ֵ����־�����жϴ��ڷ�
            begin
              re_id:=readinteger('gc_id');//��gc_id��ֵ
              if (re_id<>0)and (re_id<>max) then //��Ϊ0������ע��
                //�粻��max������δע�ᣬ������δ��������;
                begin
                  Label6.Caption:='��ʣ�� '+inttostr(max-re_id-1)+'  ��';
                  inc(re_id);
                  Writeinteger('gc_id',re_id);//�����µı�־ֵд��ע�����
                  //��������ִ��
                  timer1.Interval:=4000;
                  timer1.Enabled:=true;
                end;
              if (re_id=max) then
                dy:=true;
            end
          else
            Writeinteger('gc_id',1); //������־���ó�ֵ

        end;
      if dy then
        begin
          inputstr:='';
          clickedok:=InputQuery('ע���������','��ʹ�õ��Ƿ�ע�����,������ע����:',inputstr);
          if clickedok then
            begin
              get_id:=inttostr(27583758*2);//ע����Ϊ55167516��
              if get_id=inputstr then
                begin
                  Writeinteger('gc_id',0); //ע�ᣬ��ֵ0��
                  CloseKey;
                  Free;
                end
              else //�������ע�����
                if inputstr='���������ĳ�����ã�����лл������' then
                  begin
                    Writeinteger('gc_id',max-1); //��ֵ1�Σ������ӳ���Ч�ڣ�
                    CloseKey;
                    Free;

                    timer1.Interval:=4000;
                    timer1.Enabled:=true;
                  end
                else
                  begin
                    application.MessageBox('ע�����������������ϵ��02552602600-123','�����',mb_ok);
                    CloseKey;
                    Free;
                    application.Terminate;//������ֹ
                  end;
            end
          else //�粻�����ע����
            begin
              application.MessageBox('��û������ע���룡����������ϵ��02552602600-123','�����',mb_ok);
              CloseKey;
              Free;
              application.Terminate;//������ֹ
            end;
        end;
    end;
end;

procedure TFrm_welcome.Label4Click(Sender: TObject);
var
  registerTemp:TRegistry;
begin
  registerTemp:=TRegistry.Create;//׼��ʹ��ע���
  with registerTemp do
    begin
      RootKey:=HKEY_LOCAL_MACHINE; //����ڴ˸���
      if OpenKey('Software\Microsoft\Windows\CurrentVersion\Mark',true) then
       //����һĿ¼����ű�־ֵ����Ȼ�ɷ����Ѵ��ڵ�Ŀ¼�¡���ô�������ѷ��ְɣ�
        if valueexists('gc_id') then
          //��gc_id��ֵ����־�����жϴ��ڷ�
          begin
            re_id:=readinteger('gc_id');//��gc_id��ֵ
            if (re_id=max-1) then //
                //�絽max-1�����ӳ���;
              begin
                Writeinteger('gc_id',1); //������־���ó�ֵ
                application.MessageBox('������������ӳ���Ҫע������ϵ02552602600-123','��ϲ����',mb_ok);
                CloseKey;
                Free;
              end;
          end;

    end;
end;

end.
