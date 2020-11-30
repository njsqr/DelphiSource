unit PreModifyTxb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,db;

type
  TPreModifyTxbFrm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button2: TButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreModifyTxbFrm: TPreModifyTxbFrm;

implementation

uses Data, ModifyTxb;

{$R *.dfm}

procedure TPreModifyTxbFrm.Button1Click(Sender: TObject);
begin
  if Combobox1.text='' then
      messagebox(PreModifyTxbFrm.handle,'������Ҫ�޸ĵĲ�Ʒ�ͺ�','����',mb_ok+mb_iconwarning)
    else
      if radiogroup1.ItemIndex=-1 then
        messagebox(PreModifytxbFrm.handle,'��ѡ��Ҫ�޸ĵĲ�Ʒ����ϵ��','����',mb_ok+mb_iconwarning)
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
          if not datam.TXB_Tab.Locate('��Ʒ�ͺ�',Combobox1.Text,[lopartialkey]) then
            begin
              DataM.txb_tab.Close;
              messagebox(PreModifytxbFrm.handle,'������Ҫ�޸ĵĲ�Ʒ�ͺŲ����ڣ�','����',mb_ok+mb_iconwarning);
            end
          else
            begin
             //     edit2.Text :=edit1.Text ;
              PreModifyTxbFrm.Hide;
              Modifytxbfrm.show;
            end;
        end;
end;

procedure TPreModifyTxbFrm.Button2Click(Sender: TObject);
begin
  DataM.txb.Close;
  DataM.txb_tab.Close;
  close;
end;

procedure TPreModifyTxbFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataM.txb_tab.Close;
  DataM.txb.Close;
end;

procedure TPreModifyTxbFrm.RadioGroup1Click(Sender: TObject);
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

procedure TPreModifyTxbFrm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    Button1Click(Sender);
end;

end.
