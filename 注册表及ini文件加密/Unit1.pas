unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Registry, StdCtrls, ComCtrls, ExtCtrls;
  //使用Registry单元，向注册表中写信息，检查是否超期

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Animate1: TAnimate;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
Var
  re_id:integer;
  registerTemp:TRegistry;
  inputstr,get_id:string;
  dy,clickedok:boolean;

begin
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
              if (re_id<>0)and (re_id<>16) then //如为0，则已注册
                //如不到10，即虽未注册，但次数未到，可用;
                begin
                  inc(re_id);
                  Writeinteger('gc_id',re_id);//将更新的标志值写入注册表中
                end;
              if (re_id=16) then
                dy:=true;
            end
          else
            Writeinteger('gc_id',5); //建立标志，置初值

        end;
      if dy then
        begin
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

procedure TForm1.Button1Click(Sender: TObject);
Var
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
            Writeinteger('gc_id',1); //建立标志，置初值
            application.MessageBox('软件试用期已延长！要注册请联系02552602600-123','恭喜您！',mb_ok);
            CloseKey;
            Free;
          end;

    end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var hDiff:integer;
begin
  Animate1.Parent:=button2;//将animate的父对象设置为按钮
  hDiff:=button2.Height-Animate1.Height;
  Animate1.SetBounds(hdiff div 2,hdiff div 2,Animate1.Width,Animate1.Height);
  Animate1.Active:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  bitmap:Tbitmap;
  rect1:trect;
begin
  rect1.Left:=0;
  rect1.Right:=width;
  rect1.Top:=0;
  rect1.Bottom:=height;
  bitmap:=tbitmap.Create;
  opendialog1.Filter:='bitmap file (*.bmp)|*.bmp';
  if opendialog1.Execute then
    begin
      bitmap.LoadFromFile(opendialog1.FileName);
      form1.Canvas.StretchDraw(rect1,bitmap);
      bitmap.FreeImage;
    end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  try
    form2:=tform2.create(Application);
    form2.showmodal;
  finally
    form2.free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Application.HelpFile:=Trim(ExtractFilePath(Application.ExeName))+'\help\HELP1.HLP';
  Application.HelpCommand(help_finder,0)
end;

procedure TForm1.Button4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_F1	 then
    Button4Click(Sender);
end;

end.
