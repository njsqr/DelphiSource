unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TMainFrm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Splitter2: TSplitter;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Splitter1: TSplitter;
    BitBtn4: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFrm: TMainFrm;

implementation

uses PreModifyTxb, PreQuerryTxb, PreAddTxb;

{$R *.dfm}

procedure TMainFrm.BitBtn4Click(Sender: TObject);
begin
  PreModifyTxbFrm.show;
end;

procedure TMainFrm.BitBtn2Click(Sender: TObject);
begin
  PreQuerryTxbFrm.show;
end;

procedure TMainFrm.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('确认要退出本系统吗吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      showmessage('谢谢，您使用奥特佳特性表系统V1.0！');
      Application.terminate;
    end;
end;


procedure TMainFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BitBtn3Click(Sender);
end;

procedure TMainFrm.BitBtn1Click(Sender: TObject);
begin
  PreAddTxbFrm.show;
end;

end.
