{-------------------------------------------------------------------------------
  Simple Print Jobs Monitoring and Controlling

  Purposes  : List all print jobs on available printers (local or shared) and
              each of the print job can be controlled (pause,resume,cancel/delete)
  Tools     : D5
  OS        : Windows 98 but works on XP etc. as reported by some users

  Author  : Kadek Cipta (Chipmunk) Nov.2003
  kadekcipta@yahoo.com / kadekcipta@hotmail.com
 -------------------------------------------------------------------------------}


unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,WinSpool, ExtCtrls, ComCtrls, Menus;

type

  TPrinterJobCallback = procedure(const JobInfo : PJobInfo2) of object;

  TMain = class(TForm)
    Timer1: TTimer;
    lvMain: TListView;
    MainMenu1: TMainMenu;
    Jobs1: TMenuItem;
    DeleteSelectedItem1: TMenuItem;
    DeleteAllItems1: TMenuItem;
    Process1: TMenuItem;
    RefreshPrinters1: TMenuItem;
    Monitoring1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    MonitorSharedPrinters1: TMenuItem;
    N2: TMenuItem;
    CancelJob1: TMenuItem;
    PauseJob1: TMenuItem;
    RestartJob1: TMenuItem;
    ResumeJob1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DeleteSelectedItem1Click(Sender: TObject);
    procedure DeleteAllItems1Click(Sender: TObject);
    procedure Monitoring1Click(Sender: TObject);
    procedure RefreshPrinters1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure MonitorSharedPrinters1Click(Sender: TObject);
    procedure CancelJob1Click(Sender: TObject);
    procedure PauseJob1Click(Sender: TObject);
    procedure RestartJob1Click(Sender: TObject);
    procedure ResumeJob1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSharedPrinters : Boolean;
    FPrinters : TStrings;

    function ControlJob(const Command : DWORD):Boolean;
    procedure FreeItem(const Index : Integer);
    procedure DoRefreshPrintersList;
    procedure JobCallback(const JobInfo : PJobInfo2);
  public
    function ListPrinters(var List: TStrings): boolean;
    function ListPrinterJobs(const PrinterName: string;Callback : TPrinterJobCallback): boolean;
  end;

var
  Main: TMain;

implementation

{$R *.DFM}


uses Printers,AboutFrm;

{ TForm1 }

function TMain.ListPrinters(var List: TStrings): boolean;
var
  PInfo       : PChar;
  dwNeeded    : DWORD;
  dwReturned  : DWORD;
  Buffer      : PChar;
  i           : integer;
  Flags       : DWORD;
  Level       : DWORD;
begin
  {allocate spaces only for Windows 9X/NT}
  {See Win32 SDK Help for details}
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Flags := PRINTER_ENUM_CONNECTIONS or PRINTER_ENUM_LOCAL;
    Level := 4;
  end
  else
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 5;
  end;

  if FSharedPrinters then Flags := Flags or PRINTER_ENUM_SHARED;
   
  dwNeeded := 0;
  EnumPrinters(Flags,nil,Level,nil,0,dwNeeded,dwReturned);
  if dwNeeded = 0 then
  begin
    Result := false;
    Exit;//no printers installed
  end;
  {allocate enough space}
  GetMem(Buffer,dwNeeded);
  try
    if EnumPrinters(Flags,nil,Level,Buffer,dwNeeded,dwNeeded,dwReturned) then
    begin
      pInfo := Buffer;
      for i:= 0 to dwReturned-1 do
      begin
        if Level = 4 then
        begin
          List.Add(PPrinterInfo4(pInfo)^.pPrintername);
          Inc(pInfo,SizeOf(TPrinterInfo4));
        end
        else
        begin
          List.Add(PPrinterInfo5(pInfo)^.pPrintername);
          Inc(pInfo,SizeOf(TPrinterInfo5));
        end;
      end;
    end
    else
    begin
      MessageDlg('Error Enum Printers!',mtError,[mbOK],0);
      Result := false;
      Exit;
    end;
  finally
    Freemem(Buffer,dwNeeded);
  end;
  Result := true;
end;

function TMain.ListPrinterJobs(const PrinterName: string;Callback : TPrinterJobCallback):Boolean;
var
  pJob    : PJobInfo2;
  pJobs   : pointer;
  i       : integer;
  hPrinter: THandle;
  Needed,
  Returned : DWORD;
begin
  if not OpenPrinter(PChar(PrinterName),hPrinter,nil) then
  begin
    Result := false;
    Exit;
  end;
  {get spaces, it should fail (false) but other than ERROR_INSUFFICIENT_BUFFER}
  if not EnumJobs(hPrinter,0,$FFFFFFFF,2,nil,0,Needed,Returned) then
  begin
    if GetLastError <> ERROR_INSUFFICIENT_BUFFER then
    begin
      ClosePrinter(hPrinter);
      Result := false;
      Exit;
    end;
  end;
  GetMem(pJobs,Needed);
  if pJobs = nil then
  begin
    Result := false;
    ClosePrinter(hPrinter);
    Exit;
  end;
  if not EnumJobs(hPrinter,0,$FFFFFFFF,2,pJobs,Needed,Needed,Returned) then
  begin
    ClosePrinter(hPrinter);
    Freemem(pJobs,Needed);
    Result := false;
    Exit;
  end;
  ClosePrinter(hPrinter);
  pJob := PJobInfo2(pJobs);

  for i:=0 to Returned-1 do
  begin
    //if (pJob^.Status and JOB_STATUS_PRINTING) <> 0 then
      Callback(pJob);
    Inc(pJob);
  end;

  Freemem(pJobs,Needed);
  Result := true;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  FSharedPrinters := false;
  FPrinters := TStringList.Create;
  ListPrinters(FPrinters);
end;

procedure TMain.Timer1Timer(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to FPrinters.Count - 1 do
    ListPrinterJobs(FPrinters[i],JobCallback);
end;

procedure TMain.JobCallback(const JobInfo: PJobInfo2);
var
  tmp,S : String;
  Row,i : Integer;
  InList : Boolean;

begin
  with JobInfo^ do
  begin
    if (Status and JOB_STATUS_ERROR) <> 0 then S := S + 'Error ';
    if (Status and JOB_STATUS_PAUSED) <> 0 then S := S + 'Paused ';
    if (Status and JOB_STATUS_DELETING) <> 0 then S := S + 'Deleting ';
    if (Status and JOB_STATUS_SPOOLING) <> 0 then S := S + 'Spooling ';
    if (Status and JOB_STATUS_PRINTING) <> 0 then S := S + 'Printing ';
    if (Status and JOB_STATUS_OFFLINE) <> 0 then S := S + 'Offline ';
    if (Status and JOB_STATUS_PAPEROUT) <> 0 then S := S + 'Paperout ';
    if (Status and JOB_STATUS_PRINTED) <> 0 then S := S + 'Printed ';

    {Notes : Smart update item in the list}

    {If an item (job) with specified ID has been in the list then
     just update it only when it's changed - to avoid flicker but lot typing}

    Row := -1;
    InList := false;
    for i := 0 to lvMain.Items.Count - 1 do
    begin
      InList := PJobInfo2(lvMain.Items[i].Data)^.JobId = JobInfo^.JobId;
      if InList then
      begin
        Row := i;
        Break;
      end;
    end;
    if InList then
    begin
      with lvMain do
      begin
        tmp := StrPas(JobInfo^.pMachineName);//machine name
        if Items[Row].Caption <> tmp then Items[Row].Caption := tmp;
        tmp := StrPas(JobInfo^.pPrinterName);//printer name
        if Items[Row].SubItems[0] <> tmp then Items[Row].SubItems[0]:= tmp;
        tmp := StrPas(JobInfo^.pDocument);//doc name
        if Items[Row].SubItems[1] <> tmp then Items[Row].SubItems[1] := tmp;
        tmp := S;
        if Items[Row].SubItems[2] <> tmp then Items[Row].SubItems[2] := tmp;//status
        tmp := StrPas(JobInfo^.pUserName);//owner
        if Items[Row].SubItems[3] <> tmp then Items[Row].SubItems[3] := tmp;
        tmp := Format('%10.2f KB',[JobInfo^.Size/1000]);
        if Items[Row].SubItems[4] <> tmp then Items[Row].SubItems[4] := tmp;
        tmp := IntToStr(JobInfo^.PagesPrinted);
        if Items[Row].SubItems[5] <> tmp then Items[Row].SubItems[5] := tmp;
        tmp := DateTimeToStr(SystemTimeToDateTime(JobInfo^.Submitted));
        if Items[Row].SubItems[6] <> tmp then Items[Row].SubItems[6] := tmp;
      end;
    end
    else
    {Otherwise, add it to the list and data is assigned with JobID}
    begin
      with lvMain.Items.Add do
      begin
        Data := New(PJobInfo2);//Pointer(JobInfo^.JobID);
        PJobInfo2(Data)^:= JobInfo^;
        Caption := StrPas(JobInfo^.pMachineName);//machine name
        SubItems.Add(StrPas(JobInfo^.pPrinterName));//printer name
        SubItems.Add(StrPas(JobInfo^.pDocument));//doc name
        SubItems.Add(S);//status
        SubItems.Add(StrPas(JobInfo^.pUserName));//owner
        SubItems.Add(Format('%10.2f KB',[JobInfo^.Size/1000]));
        SubItems.Add(IntToStr(JobInfo^.PagesPrinted));
        SubItems.Add(DateTimeToStr(SystemTimeToDateTime(JobInfo^.Submitted)));
      end;
    end;
  end;
end;

procedure TMain.FormDestroy(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to lvMain.Items.Count - 1 do
    FreeItem(i);
  lvMain.Items.Clear;
  FPrinters.Free;
end;

procedure TMain.DeleteSelectedItem1Click(Sender: TObject);
var
  LI : TListItem;
begin
  LI := lvMain.Selected;
  if LI <> nil then
  begin
    FreeItem(LI.Index);
    LI.Delete;
  end;
end;

procedure TMain.DeleteAllItems1Click(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to lvMain.Items.Count - 1 do
    FreeItem(i);
  lvMain.Items.Clear;
end;

procedure TMain.Monitoring1Click(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  Timer1.Enabled := (Sender as TMenuItem).Checked;   
end;

procedure TMain.RefreshPrinters1Click(Sender: TObject);
begin
  DoRefreshPrintersList;
end;

procedure TMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMain.About1Click(Sender: TObject);
begin
  ShowAbout('About Me',FPrinters);
end;

procedure TMain.DoRefreshPrintersList;
var
  PrevState : Boolean;
begin
  PrevState := Timer1.Enabled;
  if Timer1.Enabled then Timer1.Enabled := false;
  FPrinters.Clear;
  ListPrinters(FPrinters);
  Timer1.Enabled := PrevState;
end;

procedure TMain.MonitorSharedPrinters1Click(Sender: TObject);
begin
  FSharedPrinters := not FSharedPrinters;
  (Sender as TMenuItem).Checked := FSharedPrinters;
  DoRefreshPrintersList;
end;

procedure TMain.FreeItem(const Index: Integer);
begin
  if (Index >= 0) and (Index < lvMain.Items.Count) then
  begin
    Dispose(PJobInfo2(lvMain.Items[Index].Data));
  end;
end;

procedure TMain.CancelJob1Click(Sender: TObject);
begin
  ControlJob(JOB_CONTROL_CANCEL);
end;

function TMain.ControlJob(const Command: DWORD): Boolean;
var
  hp : THandle;
  pJob : PJobInfo2;
  LI : TListItem;
  PrevState : Boolean;
begin
  Result := false;
  LI := lvMain.Selected;
  if LI = nil then Exit;
  pJob := PJobInfo2(LI.Data);
  PrevState := Timer1.Enabled;

  Timer1.Enabled := false;

  if OpenPrinter(PChar(LI.Caption + '\' + LI.SubItems[0]),hp,nil) then
  begin
    Result := SetJob(hp,pJob^.JobId,2,pJob,Command);
    ClosePrinter(hp);
  end
  else
    ShowMessage('Error OpenPrinter() : ' + IntToStr(pJob^.JobID) + ' ' + LI.SubItems[0]);

  Timer1.Enabled := PrevState;
end;

procedure TMain.PauseJob1Click(Sender: TObject);
begin
  ControlJob(JOB_CONTROL_PAUSE);
end;

procedure TMain.RestartJob1Click(Sender: TObject);
begin
  ControlJob(JOB_CONTROL_RESTART);
end;

procedure TMain.ResumeJob1Click(Sender: TObject);
begin
  ControlJob(JOB_CONTROL_RESUME);
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Timer1.Enabled then Timer1.Enabled := false;
end;

end.
