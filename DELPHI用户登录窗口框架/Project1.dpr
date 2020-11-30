program Project1;

uses
  Forms,
  Windows,
  LoginF in 'LoginF.pas' {frmLogin},
  mainDM in 'mainDM.pas' {dmMain: TDataModule},
  MainF in 'MainF.pas' {frmMain},
  UWellcome in 'UWellcome.pas' {FWellcome};

{$R *.res}

var

  mymutex: THandle;

begin

  mymutex := CreateMutex(nil, True, '营收数据自检系统');
  if GetLastError <> ERROR_ALREADY_EXISTS then
  begin
    Application.Title := '营收数据自检系统';
    Application.Initialize;
    //显示封面
    Application.CreateForm(TFWellcome, FWellcome);
    FWellcome.Show;
    try
      //创建需要的资源
    Application.CreateForm(TdmMain, dmMain);
//  Application.CreateForm(TfrmMain, frmMain);
  //...其它
    finally
      Sleep(5000);//延时一秒
      FWellcome.Free;
    end;

    if LoginF.Login()  then  //呼叫登录窗口：就这一行，简单吧！
      Application.CreateForm(TfrmMain, frmMain);
    Application.Run;
  end
  else
    begin
      MessageBox(mymutex, '程序已在运行中', '提示:营收数据自检系统',  mb_IconInformation + mb_Ok);

    end;
end.
