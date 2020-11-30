unit ModifyTxb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, ExtDlgs, ExtCtrls, Buttons,db,Adodb,Jpeg;
 //ADODB����tadoblobstream.Create(tblobfield(DataM.tab_066.fieldbyname('ͼƬ')),bmread);
  // jpeg ����tjpegimape;

type
  TModifyTxbFrm = class(TForm)
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
    DBNavigator1: TDBNavigator;
    DateTimePicker1: TDateTimePicker;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    Button4: TButton;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }

    procedure show_picture;
    Procedure SaveData;
    Procedure SavePhoto;

  public
    { Public declarations }
  end;

var
  ModifyTxbFrm: TModifyTxbFrm;
   showext,ext:string;
implementation

uses Data, PreModifyTxb;

{$R *.dfm}

procedure TModifyTxbFrm.Button3Click(Sender: TObject);
begin
  DataM.txb_tab.Close;
  premodifytxbfrm.Close;
  close;
end;

procedure TModifyTxbFrm.Button2Click(Sender: TObject);
begin
  ModifyTxbFrm.Hide;
  DataM.txb_tab.Close;
  premodifytxbfrm.show;
end;

procedure TmodifyTxbFrm.show_picture;
var
  strm:tadoblobstream;
  bitmap:tbitmap;
  JPEGImage:TJPEGImage;
begin
  strm := tadoblobstream.Create(tblobfield(DataM.txb_tab.fieldbyname('ͼƬ')),bmread);
  // BMP��JPEG����ͼ�����ݱ���ֱ���
  try //try1
    strm.position:=0;
    image1.Picture.Graphic := nil; //���ͼ��
    
    bitmap := tbitmap.Create ;
    JPEGImage:=tJPEGImage.Create;
    try //try11
      if ext='.bmp' then
        begin
          bitmap.LoadFromStream(strm);
          image1.Picture.Graphic := bitmap;
        end
      else
        if ext='.jpg' then
          begin
            JPEGImage.LoadFromStream(strm);
            image1.Picture.Graphic :=JPEGImage;
          end
        else
          image1.Picture.Graphic :=nil;
    finally
      bitmap.Free;
      JPEGImage.Free;
    end;         //end try11

  finally
    strm.Free ;
  end;     //end try1
end;


Procedure TModifyTxbFrm.SaveData;
begin
  DataM.txb_tab.FieldByName('��Ʒ�ͺ�').AsString := Trim(edit1.Text);
  DataM.txb_tab.FieldByName('���䳵��').AsString := Trim(edit2.Text);
  DataM.txb_tab.FieldByName('�������').AsString := Trim(edit11.Text);

  DataM.txb_tab.FieldByName('ͼֽ״̬').AsString := Trim(combobox1.Text);
  DataM.txb_tab.FieldByName('��������').AsVariant := datetimepicker1.Date;
  DataM.txb_tab.FieldByName('����').AsString := Trim(edit3.Text);
  DataM.txb_tab.FieldByName('����').AsString := Trim(edit4.Text);
  DataM.txb_tab.FieldByName('����ë��').AsString := Trim(edit5.Text);
  DataM.txb_tab.FieldByName('���ǳ�Ʒ').AsString := Trim(edit6.Text);
  DataM.txb_tab.FieldByName('ǰ��ë��').AsString := Trim(edit7.Text);
  DataM.txb_tab.FieldByName('ǰ�ǳ�Ʒ').AsString := Trim(edit8.Text);
  
  DataM.txb_tab.FieldByName('�ϸǷ���').AsString := Trim(combobox2.Text);
  // �����
  DataM.txb_tab.FieldByName('45��Ȧ').AsString := Trim(edit9.Text);
  DataM.txb_tab.FieldByName('�����').AsString := Trim(edit10.Text);
  DataM.txb_tab.FieldByName('�����ѹ�߰�').AsString := Trim(edit24.Text);
  //��������
  DataM.txb_tab.FieldByName('�������ܷ���').AsString := Trim(edit12.Text);
  DataM.txb_tab.FieldByName('�������ܷ���').AsString := Trim(edit13.Text);
  DataM.txb_tab.FieldByName('��������ѹ��').AsString := Trim(edit14.Text);
  DataM.txb_tab.FieldByName('����������˨').AsString := Trim(edit15.Text);
   // ���°�
  DataM.txb_tab.FieldByName('���°�').AsString := Trim(edit19.Text);
  DataM.txb_tab.FieldByName('���°�ѹ��').AsString := Trim(edit20.Text);
  DataM.txb_tab.FieldByName('���°���˨').AsString := Trim(edit21.Text);
  DataM.txb_tab.FieldByName('���°����߷�ʽ').AsString := Trim(edit22.Text);
  DataM.txb_tab.FieldByName('���°����߳���').AsString := Trim(edit23.Text);
   // ����
  DataM.txb_tab.FieldByName('�����ͺ�').AsString := Trim(edit16.Text);
  DataM.txb_tab.FieldByName('��������').AsString := Trim(edit17.Text);
  DataM.txb_tab.FieldByName('����ѹ�뷽ʽ').AsString := Trim(edit18.Text);

  DataM.txb_tab.FieldByName('��ע').AsString := Trim(edit25.Text);
  DataM.txb_tab.FieldByName('����˵��').AsString := Trim(memo1.Text);

end;

Procedure TModifyTxbFrm.SavePhoto;
var
  strm:tmemorystream;
 // ext:string; ��Ϊȫ�ֱ���
begin
  if image1.picture.Graphic <> nil then //����image1����ͼ�񱣴����
    begin
      ext:=AnsiLowerCase(extractfileext(openpicturedialog1.FileName )); //ȡ���ļ�����չ��
     //AnsiLowerCase���ַ�Сд
     // showmessage(ext);//��û�д�ͼƬ����ʱ���������.bmp .jpg'!
      //����һ��������֤�ܹ���ʾͼƬ
      if not((ext='.bmp') or (ext='.jpg')) then
        ext:=showext;
    // showmessage(ext);

      strm := tmemorystream.Create ;
      try
        image1.Picture.Graphic.SaveToStream(strm);
        DataM.txb_tab.Edit ;
        strm.Position :=0;
        tblobfield(DataM.txb_tab.FieldByName('ͼƬ')).LoadFromStream(strm);
        DataM.txb_tab.Post;
      finally
        strm.Free ; //���߷�����strm����tblobstream�࣬�������е��������������
      end;
    end;
end;


procedure TModifyTxbFrm.Button1Click(Sender: TObject);
var sel:integer;

begin
  sel:=MessageBox(0,'Ҫ���޸ĸò�Ʒ���Լ�¼��','װ�䳵���ѯϵͳV1.0',MB_YESNO+MB_ICONQUESTION);

  if sel = IDYES then
     with datam.txb_tab do
       begin
         edit;
         SaveData;
         post;

         SavePhoto;
         edit;

         FieldValues['��չ��']:=ext;
         post;
         messagebox(modifytxbFrm.handle,'��Ʒ������Ϣ�Ѿ��ɹ��޸�!','��ϲ',mb_ok);
    end;

end;

procedure TModifyTxbFrm.SpeedButton1Click(Sender: TObject);
begin
  if openpicturedialog1.Execute then
    image1.Picture.LoadFromFile(openpicturedialog1.FileName );

end;

procedure TModifyTxbFrm.FormShow(Sender: TObject);
begin
  datam.DataSource6.DataSet:=datam.TXB_Tab;
  dbnavigator1.DataSource:=datam.DataSource6;

  edit1.Text :=DataM.txb_tab.FieldValues['��Ʒ�ͺ�'];
  radiogroup1.ItemIndex:=preModifyTxbFrm.radiogroup1.ItemIndex;

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
    datetimepicker1.Date :=now;
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
  ext:='';

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
    end;
end;

procedure TModifyTxbFrm.FormCreate(Sender: TObject);
begin
 // datam.DataSource6.DataSet:=datam.TXB_Tab;
 // dbnavigator1.DataSource:=datam.DataSource6;
end;

procedure TModifyTxbFrm.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  FormShow(Sender);
end;

procedure TModifyTxbFrm.Button4Click(Sender: TObject);
begin
  if MessageDlg('ȷ��Ҫɾ�����������Ϣ��',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
    datam.txb_Tab.Delete;
    showmessage('�������Ա��Ѿ��ɹ�ɾ����');
    FormShow(Sender);
    end;
end;

procedure TModifyTxbFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataM.txb_tab.Close;
  premodifytxbfrm.Close;
end;

procedure TModifyTxbFrm.ComboBox1Change(Sender: TObject);
begin
  if combobox1.ItemIndex=1 then
    begin
      Label4.Caption:='�ܿ�����';
      datetimepicker1.SetFocus;
    end
  else
    begin
      Label4.Caption:='��������';
      datetimepicker1.SetFocus;
    end;
end;

end.
