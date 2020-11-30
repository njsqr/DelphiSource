unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,Db, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Edit2: TEdit;
    Label3: TLabel;
    Button3: TButton;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DATA;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  datamodule1.ADOTable1.Close;
  close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var flag,flag1,flag2,flag3,i:integer;
STR,str1:string;
begin
  flag1:=1;
  flag2:=1;
  datamodule1.ADOTable1.Close;
  case Length(Edit1.Text) of
    7  :  flag:=10;
    8  :  flag:=20;
    9  :  flag:=30;
    12 :  flag:=40;
    13 :  flag:=50;
    14 :  flag:=60;
    17 :  flag:=70;
    25 :  flag:=75;
    27 :  flag:=80;
    30 :  flag:=90;
    35 :  flag:=100;
    42 :  flag:=110;
  else
     flag:=0;
  end;

  if flag<>0 then
    begin
      datamodule1.ADOTable1.tableName:='table'+inttostr(flag);
      datamodule1.ADOTable1.Active:=true;
    end;

  case flag of
    10,20      :       //依维柯的奥特佳代码
      begin
        if datamodule1.ADOTable1.Locate('码值',copy(edit1.Text,1,6),[lopartialkey]) then
          begin
            label7.Visible:=true;
            label8.Visible:=false;
            edit2.Text:=datamodule1.ADOTable1.FieldValues['车厂'];
            edit3.Text:=datamodule1.ADOTable1.FieldValues['型号'];
            edit4.Text:=copy(edit1.Text,7,2);
            edit5.Text:='';

          end
        else
          begin
            label8.Visible:=true;
            label7.Visible:=false;
            edit2.Text:='';
            edit3.Text:='';
            edit4.Text:='';
            edit5.Text:='';
           end;
      end;
    30,40,50,60:    //30,60 :依维柯 ;40,50：GPD
      begin
        str:=edit1.Text;
        //showmessage(str);
        if copy(str,1,1)='0' then  copy(edit1.Text,2,Length(Edit1.Text)-1) ;
        if datamodule1.ADOTable1.Locate('码值',edit1.Text,[lopartialkey]) then
          begin
            label7.Visible:=true;
            label8.Visible:=false;
            edit2.Text:=datamodule1.ADOTable1.FieldValues['车厂'];
            edit3.Text:=datamodule1.ADOTable1.FieldValues['型号'];
            edit4.Text:='';
            edit5.Text:='';

          end
        else
          begin
            label8.Visible:=true;
            label7.Visible:=false;
            edit2.Text:='';
            edit3.Text:='';
            edit4.Text:='';
            edit5.Text:='';
           end;
      end;
    70         :         //比亚迪     ATC小包
      begin
        str:=edit1.Text;
        flag3:=0;
        //showmessage(str);
        if datamodule1.ADOTable1.Locate('码值',copy(str,1,8),[lopartialkey]) then
          begin        //byd
            label7.Visible:=true;
            label8.Visible:=false;
            edit2.Text:=datamodule1.ADOTable1.FieldValues['车厂'];
            edit3.Text:=datamodule1.ADOTable1.FieldValues['型号'];
            str:= edit1.Text;

            edit4.Text:=copy(str,9,4);
            str:=edit1.Text;
            edit5.Text:=copy(str,13,5);
          end
        else
          begin
            if (str[1] ='q')or(str[1] ='Q') then
              flag3:=1;
            if (str[1] ='B')or(str[1] ='b')  then
              if  str[14] in ['A','B','C','a','b','c']  then
                flag3:=1;
           //   showmessage((flag3));
            if datamodule1.ADOTable1.Locate('码值',copy(str,1,5+flag3),[lopartialkey]) then
               begin        //ATC小包
                 label7.Visible:=true;
                 label8.Visible:=false;
                 edit2.Text:=datamodule1.ADOTable1.FieldValues['车厂'];
                 edit3.Text:=datamodule1.ADOTable1.FieldValues['型号'];
                 str:= edit1.Text;

                 edit4.Text:=copy(str,6+flag3,6);
                 str:=edit1.Text;
                 edit5.Text:=copy(str,14+flag3,4-flag3);
               end

            else
              begin
                label8.Visible:=true;
                label7.Visible:=false;
                edit2.Text:='';
                edit3.Text:='';
                edit4.Text:='';
                edit5.Text:='';
              end;
          end;
      end;
    75         :          //柳汽
      begin
        str:=edit1.Text;
        str1:=edit1.Text;
        if datamodule1.ADOTable1.Locate('码值',copy(str,1,13),[lopartialkey]) and (copy(str1,24,2)='00') then
          begin
            label7.Visible:=true;
            label8.Visible:=false;
            edit2.Text:=datamodule1.ADOTable1.FieldValues['车厂'];
            edit3.Text:=datamodule1.ADOTable1.FieldValues['型号'];
            str:= edit1.Text;

            edit4.Text:=copy(str,14,6);
            str:=edit1.Text;
            edit5.Text:=copy(str,20,4);

          end
        else
          begin
            label8.Visible:=true;
            label7.Visible:=false;
            edit2.Text:='';
            edit3.Text:='';
            edit4.Text:='';
            edit5.Text:='';
           end;
      end;
    80         :          //吉利 的机壳
      begin
        str:=edit1.Text;
        //showmessage(str);
        if datamodule1.ADOTable1.Locate('码值',copy(str,1,21),[lopartialkey]) then
          begin
            label7.Visible:=true;
            label8.Visible:=false;
            edit2.Text:=datamodule1.ADOTable1.FieldValues['车厂'];
            edit3.Text:=datamodule1.ADOTable1.FieldValues['型号'];
            str:= edit1.Text;

            edit4.Text:=copy(str,22,6);
           // str:=edit1.Text;
            edit5.Text:='';

          end
        else
          begin
            label8.Visible:=true;
            label7.Visible:=false;
            edit2.Text:='';
            edit3.Text:='';
            edit4.Text:='';
            edit5.Text:='';
           end;
      end;
    90         :        //福田
      begin
        str:=edit1.Text;
        //showmessage(str);
        if datamodule1.ADOTable1.Locate('码值',copy(str,1,18),[lopartialkey]) then
          begin
            label7.Visible:=true;
            label8.Visible:=false;
            edit2.Text:=datamodule1.ADOTable1.FieldValues['车厂'];
            edit3.Text:=datamodule1.ADOTable1.FieldValues['型号'];

            if not trystrtoint(copy(str,19,2),i) then flag1:=0;
            if not trystrtoint(copy(str,21,2),i) or (i>12) or (i<1) then flag1:=0;
            if not trystrtoint(copy(str,23,2),i) or (i>31) or (i<1) then flag1:=0;
            if flag1=0 then
              begin
                label8.Visible:=true;
                label7.Visible:=false;
                showmessage('日期不对！');
              end
            else edit4.Text:=copy(str,19,6);
            if not trystrtoint(copy(str,25,6),i) then flag2:=0;
            if flag2=0 then
              begin
                label8.Visible:=true;
                label7.Visible:=false;
                showmessage('序列号不对！');
              end
            else edit5.Text:=copy(str,25,6);

          end
        else
          begin
            label8.Visible:=true;
            label7.Visible:=false;
            edit2.Text:='';
            edit3.Text:='';
            edit4.Text:='';
            edit5.Text:='';
           end;
      end;
    100        :       //神龙
      begin
        str:=edit1.Text;
        str1:=edit1.Text;
        if datamodule1.ADOTable1.Locate('码值',copy(str,1,25),[lopartialkey]) and (copy(str1,34,2)='48')then
          begin
            label7.Visible:=true;
            label8.Visible:=false;
            edit2.Text:=datamodule1.ADOTable1.FieldValues['车厂'];
            edit3.Text:=datamodule1.ADOTable1.FieldValues['型号'];
            str:= edit1.Text;

            edit4.Text:=copy(str,26,7);
            str:=edit1.Text;
            edit5.Text:=copy(str,34,2);

          end
        else
          begin
            label8.Visible:=true;
            label7.Visible:=false;
            edit2.Text:='';
            edit3.Text:='';
            edit4.Text:='';
            edit5.Text:='';
           end;
      end;
    110        :        //吉利 的机壳
      begin
        str:=edit1.Text;
        //showmessage(str);
        if datamodule1.ADOTable1.Locate('码值',copy(str,11,21),[lopartialkey]) then
          begin
            label7.Visible:=true;
            label8.Visible:=false;
            str:= edit1.Text;
            edit2.Text:=datamodule1.ADOTable1.FieldValues['车厂']+copy(str,1,10);
            edit3.Text:=datamodule1.ADOTable1.FieldValues['型号'];
            str:= edit1.Text;
            edit4.Text:=copy(str,32,6);
            str:=edit1.Text;
            edit5.Text:=copy(str,38,5);

          end
        else
          begin
            label8.Visible:=true;
            label7.Visible:=false;
            edit2.Text:='';
            edit3.Text:='';
            edit4.Text:='';
            edit5.Text:='';
           end;
      end;
  else
    begin
      MessageBox(0,'数据库文件中此条形码找不到！'+#13
      +'此条形码不正确！！！', '警告', MB_OK+mb_iconwarning);
    end;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  label7.Visible:=false;
  label8.Visible:=false;
  edit1.SetFocus;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button1Click(Sender);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  label7.Visible:=false;
  label8.Visible:=false;
end;



procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_space then
    Button3Click(Sender)
end;

end.
