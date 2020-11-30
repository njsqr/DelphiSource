unit PreQuerryTxb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,db;

type
  TPreQuerryTxbFrm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button2: TButton;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreQuerryTxbFrm: TPreQuerryTxbFrm;

implementation

uses Data, QuerryTxb, QuerryLhq, StoreLhq;

{$R *.dfm}

procedure TPreQuerryTxbFrm.Button1Click(Sender: TObject);
begin
  if Combobox1.text='' then
      messagebox(PreQuerryTxbFrm.handle,'请输入要查询的产品型号','警告',mb_ok+mb_iconwarning)
    else
      if radiogroup1.ItemIndex=-1 then
        messagebox(PreQuerrytxbFrm.handle,'请选择要查询的产品所属系列','警告',mb_ok+mb_iconwarning)
      else
        if radiogroup1.ItemIndex=3 then
          begin
            PreQuerryTxbFrm.Hide;
            QuerryLhqfrm.show;
          end
        else
          begin
            if radiogroup1.ItemIndex=0 then
              datam.TXB_Tab.TableName:='066'
            else
              if radiogroup1.ItemIndex=1 then
                datam.TXB_Tab.TableName:='086'
              else
                datam.TXB_Tab.TableName:='106';
            datam.TXB_Tab.Active:=true;
            if not datam.TXB_Tab.Locate('产品型号',Combobox1.Text,[lopartialkey]) then
              begin
                messagebox(PreQuerrytxbFrm.handle,'您输入要查询的产品型号不存在！','警告',mb_ok+mb_iconwarning);
                DataM.txb_tab.Close;
              end
            else
              begin
                PreQuerryTxbFrm.Hide;
                Querrytxbfrm.show;
                if checkbox1.Checked =true then
                  storeLhqFrm.show;
              end;
          end;
end;

procedure TPreQuerryTxbFrm.Button2Click(Sender: TObject);
begin
  DataM.txb.Close;
  DataM.txb_tab.Close;
  close;
end;

procedure TPreQuerryTxbFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataM.txb.Close;
  DataM.txb_tab.Close;
end;

procedure TPreQuerryTxbFrm.RadioGroup1Click(Sender: TObject);
begin
  combobox1.Clear;
  if radiogroup1.ItemIndex=3 then
    begin
      label2.Caption:='离合器型号';
      PreQuerryTxbFrm.Hide;
      QuerryLhqfrm.show;
    end
  else
    with DataM.txb_tab do
    begin
      label2.Caption:='产品型号';
      close;
      if radiogroup1.ItemIndex=0 then
        TableName:='066'
      else
        if radiogroup1.ItemIndex=1 then
          TableName:='086'
        else
          TableName:='106';
      DataM.txb_tab.IndexFieldNames:='产品型号';
      open;
      first;
      while not eof do
        begin
          combobox1.items.insert(-1,fieldbyname('产品型号').asstring);
          Next;
        end;
      close;
    end;
    combobox1.ItemIndex:=1;
end;

procedure TPreQuerryTxbFrm.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    Button1Click(Sender);
end;

procedure TPreQuerryTxbFrm.FormCreate(Sender: TObject);
begin
  if flag<>0 then
    checkbox1.Visible:=true
  else
    checkbox1.Visible:=false;
end;

procedure TPreQuerryTxbFrm.FormActivate(Sender: TObject);
begin
   if radiogroup1.ItemIndex=3 then
     combobox1.Text:='LHQ-';
end;

end.
