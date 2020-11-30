unit AddTxb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtDlgs, ExtCtrls, Buttons,db;

type
  TAddTxbFrm = class(TForm)
    SpeedButton1: TSpeedButton;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Memo1: TMemo;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label21: TLabel;
    Label2: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    GroupBox2: TGroupBox;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label3: TLabel;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit9: TEdit;
    Edit8: TEdit;
    Edit7: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit25: TEdit;
    Edit24: TEdit;
    Edit2: TEdit;
    Edit11: TEdit;
    Edit10: TEdit;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    Procedure Inition;
    Procedure SavePhoto;
    Procedure SaveData;

  public
    { Public declarations }
  end;

var
  AddTxbFrm: TAddTxbFrm;
        ext:string;

implementation

uses Data, PreAddTxb;

{$R *.dfm}

procedure TAddTxbFrm.SpeedButton1Click(Sender: TObject);
begin
  if openpicturedialog1.Execute then
    image1.Picture.LoadFromFile(openpicturedialog1.FileName );
end;

Procedure TAddTxbFrm.Inition;
begin
  edit1.Text :='';
  radiogroup1.ItemIndex:=-1;
  edit2.Text :='';
  edit11.Text :='';
  combobox1.ItemIndex:=0;
  edit3.Text :='';
  edit4.Text :='';
  edit5.Text :='';
  edit6.Text :='';
  edit7.Text :='';
  edit8.Text :='';
  combobox2.ItemIndex:=0;
  edit9.Text :='';
  edit10.Text :='';
  edit24.Text :='';
  //��������
  edit12.Text :='';
  edit13.Text :='';
  edit14.Text :='';
  edit15.Text :='';

  datetimepicker1.Date :=now;
 //���°�
  edit19.Text :='';
  edit20.Text :='';
  edit21.Text :='';
  edit22.Text :='';
  edit23.Text :='';
 //����
  edit16.Text :='';
  edit17.Text :='';
  edit18.Text :='';

  edit25.Text :='';
  memo1.Text :='';
  image1.picture.Graphic:= nil;
  edit1.Setfocus;
end;
  
Procedure TAddTxbFrm.SaveData;
begin
  DataM.txb.FieldByName('��Ʒ�ͺ�').AsString := Trim(edit1.Text);
  DataM.txb.FieldByName('���䳵��').AsString := Trim(edit2.Text);
  DataM.txb.FieldByName('�������').AsString := Trim(edit11.Text);

  DataM.txb.FieldByName('ͼֽ״̬').AsString := Trim(combobox1.Text);
  DataM.txb.FieldByName('��������').AsVariant := datetimepicker1.Date;
  DataM.txb.FieldByName('����').AsString := Trim(edit3.Text);
  DataM.txb.FieldByName('����').AsString := Trim(edit4.Text);
  DataM.txb.FieldByName('����ë��').AsString := Trim(edit5.Text);
  DataM.txb.FieldByName('���ǳ�Ʒ').AsString := Trim(edit6.Text);
  DataM.txb.FieldByName('ǰ��ë��').AsString := Trim(edit7.Text);
  DataM.txb.FieldByName('ǰ�ǳ�Ʒ').AsString := Trim(edit8.Text);
  
  DataM.txb.FieldByName('�ϸǷ���').AsString := Trim(combobox2.Text);
  // �����
  DataM.txb.FieldByName('45��Ȧ').AsString := Trim(edit9.Text);
  DataM.txb.FieldByName('�����').AsString := Trim(edit10.Text);
  DataM.txb.FieldByName('�����ѹ�߰�').AsString := Trim(edit24.Text);
  //��������
  DataM.txb.FieldByName('�������ܷ���').AsString := Trim(edit12.Text);
  DataM.txb.FieldByName('�������ܷ���').AsString := Trim(edit13.Text);
  DataM.txb.FieldByName('��������ѹ��').AsString := Trim(edit14.Text);
  DataM.txb.FieldByName('����������˨').AsString := Trim(edit15.Text);
   // ���°�
  DataM.txb.FieldByName('���°�').AsString := Trim(edit19.Text);
  DataM.txb.FieldByName('���°�ѹ��').AsString := Trim(edit20.Text);
  DataM.txb.FieldByName('���°���˨').AsString := Trim(edit21.Text);
  DataM.txb.FieldByName('���°����߷�ʽ').AsString := Trim(edit22.Text);
  DataM.txb.FieldByName('���°����߳���').AsString := Trim(edit23.Text);
   // ����
  DataM.txb.FieldByName('�����ͺ�').AsString := Trim(edit16.Text);
  DataM.txb.FieldByName('��������').AsString := Trim(edit17.Text);
  DataM.txb.FieldByName('����ѹ�뷽ʽ').AsString := Trim(edit18.Text);

  DataM.txb.FieldByName('��ע').AsString := Trim(edit25.Text);
  DataM.txb.FieldByName('����˵��').AsString := Trim(memo1.Text);

end;

Procedure TAddTxbFrm.SavePhoto;
var
  strm:tmemorystream;
 // ext:string; ��Ϊȫ�ֱ���
begin
  if image1.picture.Graphic <> nil then //����image1����ͼ�񱣴����
    begin
      ext:=AnsiLowerCase(extractfileext(openpicturedialog1.FileName)); //ȡ���ļ�����չ��
      strm := tmemorystream.Create ;
      try
        image1.Picture.Graphic.SaveToStream(strm);
        DataM.txb.Edit ;
        strm.Position :=0;
        tblobfield(DataM.txb.FieldByName('ͼƬ')).LoadFromStream(strm);
        DataM.txb.Post;
      finally
        strm.Free ; //���߷�����strm����tblobstream�࣬�������е��������������
      end;
    end;
end;

procedure TAddTxbFrm.Button1Click(Sender: TObject);
var sel:integer;
begin
  sel:=MessageBox(0,'Ҫ��Ӹò�Ʒ���Լ�¼��','װ�䳵���ѯϵͳV1.0',MB_YESNO+MB_ICONQUESTION);

  if sel = IDYES then
    begin
      if edit1.text='' then
        messagebox(AddTxbFrm.handle,'�������Ʒ�ͺ�','����',mb_ok+mb_iconwarning)
      else
        if radiogroup1.ItemIndex=-1 then
          messagebox(AddtxbFrm.handle,'��ѡ������ϵ��','����',mb_ok+mb_iconwarning)
        else
          begin
            with datam.txb do
              begin
                close;
                sql.Clear;
                if radiogroup1.ItemIndex=0 then
                  sql.Add('select * from 066 where ��Ʒ�ͺ�='+''''+edit1.Text+'''')
                else
                  if radiogroup1.ItemIndex=1 then
                    sql.Add('select * from 086 where ��Ʒ�ͺ�='+''''+edit1.Text+'''')
                  else
                    sql.Add('select * from 106 where ��Ʒ�ͺ�='+''''+edit1.Text+'''');
                OPEN;
                if recordcount<>0 then
                  messagebox(AddtxbFrm.handle,'�������Ʒ�ͺ��Ѵ��ڣ�','����',mb_ok+mb_iconwarning)
                else
                  begin
                    append;
                    SaveData;
                    post;

                    SavePhoto;
                    edit;
                    FieldValues['��չ��']:=ext;
                    post;
                    messagebox(AddtxbFrm.handle,'��Ʒ������Ϣ�Ѿ��ɹ����','��ϲ',mb_ok);
                  end;
              end;
          end;
    end;

end; 
procedure TAddTxbFrm.Button2Click(Sender: TObject);
begin
  PreAddTxbFrm.Show;
end;

procedure TAddTxbFrm.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TAddTxbFrm.FormShow(Sender: TObject);
begin
 // datam.DataSource6.DataSet:=datam.TXB_Tab;
//  dbnavigator1.DataSource:=datam.DataSource6;

  edit1.Text :=preAddTxbFrm.Edit1.Text;
  radiogroup1.ItemIndex:=preAddTxbFrm.radiogroup1.ItemIndex;

  if DataM.txb_tab.FieldValues['���䳵��']<>null then
    edit2.Text :=DataM.txb_tab.FieldValues['���䳵��']
  else  edit2.Text :='';

  if DataM.txb_tab.FieldValues['�������']<>null then
    edit11.Text :=DataM.txb_tab.FieldValues['�������']
  else edit11.Text :='';

  if DataM.txb_tab.FieldValues['ͼֽ״̬']='����' then
    begin
      combobox1.ItemIndex:=0;
      Label4.Caption:='��������';
     // datetimepicker1.Visible:=true;
      end
  else
    if DataM.txb_tab.FieldValues['ͼֽ״̬']='�ܿ�' then
      begin
        combobox1.ItemIndex:=1;
        Label4.Caption:='�ܿ�����';
      //  datetimepicker1.Visible:=false;
      end
    else
      combobox1.ItemIndex:=-1;
  if DataM.txb_tab.FieldValues['����']<>null then
    edit3.Text :=DataM.txb_tab.FieldValues['����']
  else  edit3.Text :='';
  if DataM.txb_tab.FieldValues['����']<>null then
    edit4.Text :=DataM.txb_tab.FieldValues['����']
  else  edit4.Text :='';
  if DataM.txb_tab.FieldValues['����ë��']<>null then
    edit5.Text :=DataM.txb_tab.FieldValues['����ë��']
  else  edit5.Text :='';
  if DataM.txb_tab.FieldValues['���ǳ�Ʒ']<>null then
  edit6.Text :=DataM.txb_tab.FieldValues['���ǳ�Ʒ']
  else  edit6.Text :='';
  if DataM.txb_tab.FieldValues['ǰ��ë��']<>null then
    edit7.Text :=DataM.txb_tab.FieldValues['ǰ��ë��']
  else  edit7.Text :='';
  if DataM.txb_tab.FieldValues['ǰ�ǳ�Ʒ']<>null then
  edit8.Text :=DataM.txb_tab.FieldValues['ǰ�ǳ�Ʒ']
    else  edit8.Text :='';
  if DataM.txb_tab.FieldValues['�ϸǷ���']='����' then
    combobox2.ItemIndex:=0
  else
    if DataM.txb_tab.FieldValues['�ϸǷ���']='����' then
      combobox2.ItemIndex:=1
    else
      if DataM.txb_tab.FieldValues['�ϸǷ���']='��ǰ' then
        combobox2.ItemIndex:=2
      else
        if DataM.txb_tab.FieldValues['�ϸǷ���']='���' then
          combobox2.ItemIndex:=3
        else
          combobox2.ItemIndex:=-1;
  if DataM.txb_tab.FieldValues['45��Ȧ']<>null then
    edit9.Text :=DataM.txb_tab.FieldValues['45��Ȧ']
  else  edit9.Text :='';
  if DataM.txb_tab.FieldValues['�����']<>null then
    edit10.Text :=DataM.txb_tab.FieldValues['�����']
  else  edit10.Text :='';
  if DataM.txb_tab.FieldValues['�����ѹ�߰�']<>null then
    edit24.Text :=DataM.txb_tab.FieldValues['�����ѹ�߰�']
  else  edit24.Text :='';
  //��������
  if DataM.txb_tab.FieldValues['�������ܷ���']<>null then
    edit12.Text :=DataM.txb_tab.FieldValues['�������ܷ���']
  else  edit12.Text :='';
  if DataM.txb_tab.FieldValues['�������ܷ���']<>null then
    edit13.Text :=DataM.txb_tab.FieldValues['�������ܷ���']
  else  edit13.Text :='';
  if DataM.txb_tab.FieldValues['��������ѹ��']<>null then
    edit14.Text :=DataM.txb_tab.FieldValues['��������ѹ��']
  else  edit14.Text :='';
  if DataM.txb_tab.FieldValues['����������˨']<>null then
    edit15.Text :=DataM.txb_tab.FieldValues['����������˨']
  else  edit15.Text :='';

  // datetimepicker1.Date :=DataM.txb.FieldValues['��������'];
  if DataM.txb_tab.FieldValues['��������']<>null then
    datetimepicker1.Date :=DataM.txb_tab.FieldValues['��������']
  else
    datetimepicker1.Date :=null;
 //���°�
  if DataM.txb_tab.FieldValues['���°�']<>null then
    edit19.Text :=DataM.txb_tab.FieldValues['���°�']
  else  edit19.Text :='';
  if DataM.txb_tab.FieldValues['���°�ѹ��']<>null then
    edit20.Text :=DataM.txb_tab.FieldValues['���°�ѹ��']
  else  edit20.Text :='';
  if DataM.txb_tab.FieldValues['���°���˨']<>null then
  edit21.Text :=DataM.txb_tab.FieldValues['���°���˨']
  else  edit21.Text :='';
  if DataM.txb_tab.FieldValues['���°����߷�ʽ']<>null then
   edit22.Text :=DataM.txb_tab.FieldValues['���°����߷�ʽ']
  else
    edit22.Text :='';
  if DataM.txb_tab.FieldValues['���°����߳���']<>null then
  edit23.Text :=DataM.txb_tab.FieldValues['���°����߳���']
  else  edit23.Text :='';
 //����
  if DataM.txb_tab.FieldValues['�����ͺ�']<>null then
    edit16.Text :=DataM.txb_tab.FieldValues['�����ͺ�']
  else  edit16.Text :='';
  if DataM.txb_tab.FieldValues['��������']<>null then
    edit17.Text :=DataM.txb_tab.FieldValues['��������']
  else  edit17.Text :='';
  if DataM.txb_tab.FieldValues['����ѹ�뷽ʽ']<>null then
    edit18.Text :=DataM.txb_tab.FieldValues['����ѹ�뷽ʽ']
  else  edit18.Text :='';

  if DataM.txb_tab.FieldValues['��ע']<>null then
    edit25.Text :=DataM.txb_tab.FieldValues['��ע']
  else  edit25.Text :='';
  if DataM.txb_tab.FieldValues['����˵��']<>null then
    memo1.Text :=DataM.txb_tab.FieldValues['����˵��']
  else  memo1.Text :='';

  //�����չ��
 { ext:='';

  if (datam.TXB_Tab.FieldValues['��չ��']='.bmp') or (datam.Txb_Tab.FieldValues['��չ��']='.jpg') then
    begin

      ext:=datam.Txb_Tab.FieldValues['��չ��'];
    //  showmessage(ext);
      show_picture;
      showext:=ext;
     // showmessage(showext);
      panel1.Caption:='';
    end
  else
    begin
      image1.Picture.Graphic :=nil;
      panel1.Caption:='����ͼƬ';
    end;  }

end;

end.
