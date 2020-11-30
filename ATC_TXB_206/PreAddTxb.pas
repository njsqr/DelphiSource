unit PreAddTxb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,db;

type
  TPreAddTxbFrm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button2: TButton;
    Button1: TButton;
    Label3: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreAddTxbFrm: TPreAddTxbFrm;

implementation

uses Data, AddTxb;

{$R *.dfm}

procedure TPreAddTxbFrm.Button1Click(Sender: TObject);
begin
  if Combobox1.text='' then
      messagebox(PreAddTxbFrm.handle,'������Ҫ��ӵĲ�Ʒ�ͺţ�','����',mb_ok+mb_iconwarning)
    else
      if radiogroup1.ItemIndex=-1 then
        messagebox(PreAddtxbFrm.handle,'��ѡ��Ҫ��ӵĲ�Ʒ����ϵ�У�','����',mb_ok+mb_iconwarning)
      else
        if combobox1.ItemIndex=-1 then
          messagebox(PreAddtxbFrm.handle,'��ѡ��Ҫ��ӵĲ�Ʒ���㡢����ͬ���ͺţ�','����',mb_ok+mb_iconwarning)
        else
          begin
            if radiogroup1.ItemIndex=0 then
              datam.TXB_Tab.TableName:='066'
            else
              if radiogroup1.ItemIndex=1 then
                datam.TXB_Tab.TableName:='066D'
              else
                if radiogroup1.ItemIndex=2 then
                  datam.TXB_Tab.TableName:='086'
                else
                  if radiogroup1.ItemIndex=3 then
                    datam.TXB_Tab.TableName:='106K'
                  else
                    if radiogroup1.ItemIndex=4 then
                      datam.TXB_Tab.TableName:='106'
                    else
                      if radiogroup1.ItemIndex=5 then
                        datam.TXB_Tab.TableName:='166'
                      else
                        datam.TXB_Tab.TableName:='206';

            datam.TXB_Tab.Active:=true;
                                        //,[lopartialkey]
            if datam.TXB_Tab.Locate('��Ʒ�ͺ�',edit1.Text,[]) then
              begin
                DataM.txb_tab.Close;
                messagebox(PreAddtxbFrm.handle,'������Ҫ��ӵĲ�Ʒ�ͺ��Ѵ��ڣ�'+#13+'���ʵ������','����',mb_ok+mb_iconwarning);
              end
            else
              begin
                if not datam.TXB_Tab.Locate('��Ʒ�ͺ�',Combobox1.Text,[lopartialkey]) then
                  begin
                    DataM.txb_tab.Close;
                    messagebox(PreAddtxbFrm.handle,'������Ҫ��ӵĲ�Ʒ�ͺŲ����ڣ�','����',mb_ok+mb_iconwarning);
                  end
                else
                  begin
                   //     edit2.Text :=edit1.Text ;
                    PreAddTxbFrm.Hide;
                    Addtxbfrm.show;
                  end;
              end;
          end;
end;

procedure TPreAddTxbFrm.Button2Click(Sender: TObject);
begin
  DataM.txb.Close;
  DataM.txb_tab.Close;
  close;
end;

procedure TPreAddTxbFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataM.txb_tab.Close;
  DataM.txb.Close;
end;

procedure TPreAddTxbFrm.RadioGroup1Click(Sender: TObject);
begin
  combobox1.Clear;
  with DataM.txb_tab do
    begin
      close;
      if radiogroup1.ItemIndex=0 then
        TableName:='066'
      else
        if radiogroup1.ItemIndex=1 then
          TableName:='066D'
        else
          if radiogroup1.ItemIndex=2 then
            TableName:='086'
          else
            if radiogroup1.ItemIndex=3 then
              TableName:='106K'
            else
              if radiogroup1.ItemIndex=4 then
                TableName:='106'
              else
                if radiogroup1.ItemIndex=5 then
                  TableName:='166'
                else
                 TableName:='206';

      DataM.txb_tab.IndexFieldNames:='��Ʒ�ͺ�';
      open;
      first;
      while not eof do
        begin
          combobox1.items.insert(-1,fieldbyname('��Ʒ�ͺ�').asstring);
          Next;
        end;
      close;
    end;
    combobox1.ItemIndex:=1;
end;

procedure TPreAddTxbFrm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button1Click(Sender);
end;

procedure TPreAddTxbFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button1Click(Sender);
end;

end.
