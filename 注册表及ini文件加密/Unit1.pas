unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Registry, StdCtrls, ComCtrls, ExtCtrls;
  //ʹ��Registry��Ԫ����ע�����д��Ϣ������Ƿ���

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
              if (re_id<>0)and (re_id<>16) then //��Ϊ0������ע��
                //�粻��10������δע�ᣬ������δ��������;
                begin
                  inc(re_id);
                  Writeinteger('gc_id',re_id);//�����µı�־ֵд��ע�����
                end;
              if (re_id=16) then
                dy:=true;
            end
          else
            Writeinteger('gc_id',5); //������־���ó�ֵ

        end;
      if dy then
        begin
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

procedure TForm1.Button1Click(Sender: TObject);
Var
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
            Writeinteger('gc_id',1); //������־���ó�ֵ
            application.MessageBox('������������ӳ���Ҫע������ϵ02552602600-123','��ϲ����',mb_ok);
            CloseKey;
            Free;
          end;

    end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var hDiff:integer;
begin
  Animate1.Parent:=button2;//��animate�ĸ���������Ϊ��ť
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
