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
  //软件是否到注册期、允许使用的标志；false是允许使用。
  registerTemp:=TRegistry.Create;//准备使用注册表
  with registerTemp do
    begin
      RootKey:=HKEY_LOCAL_MACHINE; //存放在此根下
      if OpenKey('Software\Microsoft\Windows\CurrentVersion\Mark',true) then
       //建立一目录，存放标志值。当然可放在已存在的目录下。怎么样，很难发现吧？
        begin
          if valueexists('gc_id') then
            //用gc_id的值作标志，先判断存在否？
            begin
              re_id:=readinteger('gc_id');//读gc_id的值
              if (re_id<>0)and (re_id<>max) then //如为0，则已注册
                //如不到max，即虽未注册，但次数未到，可用;
                begin
                  Label6.Caption:='还剩： '+inttostr(max-re_id-1)+'  次';
                  inc(re_id);
                  Writeinteger('gc_id',re_id);//将更新的标志值写入注册表中
                  //程序往下执行
                  timer1.Interval:=4000;
                  timer1.Enabled:=true;
                end;
              if (re_id=max) then
                dy:=true;
            end
          else
            Writeinteger('gc_id',1); //建立标志，置初值

        end;
      if dy then
        begin
          inputstr:='';
          clickedok:=InputQuery('注册码输入框','您使用的是非注册软件,请输入注册码:',inputstr);
          if clickedok then
            begin
              get_id:=inttostr(27583758*2);//注册码为55167516；
              if get_id=inputstr then
                begin
                  Writeinteger('gc_id',0); //注册，置值0；
                  CloseKey;
                  Free;
                end
              else //如输入的注册码错
                if inputstr='作者制作的程序真好！！！谢谢！！！' then
                  begin
                    Writeinteger('gc_id',max-1); //置值1次，可以延长有效期；
                    CloseKey;
                    Free;

                    timer1.Interval:=4000;
                    timer1.Enabled:=true;
                  end
                else
                  begin
                    application.MessageBox('注册码错误！请与作者联系！02552602600-123','警告框',mb_ok);
                    CloseKey;
                    Free;
                    application.Terminate;//程序中止
                  end;
            end
          else //如不输入的注册码
            begin
              application.MessageBox('您没有输入注册码！请与作者联系！02552602600-123','警告框',mb_ok);
              CloseKey;
              Free;
              application.Terminate;//程序中止
            end;
        end;
    end;
end;

procedure TFrm_welcome.Label4Click(Sender: TObject);
var
  registerTemp:TRegistry;
begin
  registerTemp:=TRegistry.Create;//准备使用注册表
  with registerTemp do
    begin
      RootKey:=HKEY_LOCAL_MACHINE; //存放在此根下
      if OpenKey('Software\Microsoft\Windows\CurrentVersion\Mark',true) then
       //建立一目录，存放标志值。当然可放在已存在的目录下。怎么样，很难发现吧？
        if valueexists('gc_id') then
          //用gc_id的值作标志，先判断存在否？
          begin
            re_id:=readinteger('gc_id');//读gc_id的值
            if (re_id=max-1) then //
                //如到max-1，可延长用;
              begin
                Writeinteger('gc_id',1); //建立标志，置初值
                application.MessageBox('软件试用期已延长！要注册请联系02552602600-123','恭喜您！',mb_ok);
                CloseKey;
                Free;
              end;
          end;

    end;
end;

end.
