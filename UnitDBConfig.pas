unit UnitDBConfig;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, System.StrUtils,
  Vcl.ComCtrls;
type
  TDBFormConfig = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    DB0Group: TGroupBox;
    DB0UserEdit: TEdit;
    StaticText1: TStaticText;
    DB0PasswordEdit: TMaskEdit;
    StaticText2: TStaticText;
    DB1Group: TGroupBox;
    DB1UserEdit: TEdit;
    StaticText3: TStaticText;
    DB1PasswordEdit: TMaskEdit;
    StaticText4: TStaticText;
    DB0ConnectionEdit: TEdit;
    StaticText5: TStaticText;
    DB1ConnectionEdit: TEdit;
    StaticText6: TStaticText;
    DB2Group: TGroupBox;
    DB2UserEdit: TEdit;
    StaticText7: TStaticText;
    DB2PasswordEdit: TMaskEdit;
    StaticText8: TStaticText;
    DB2ConnectionEdit: TEdit;
    StaticText9: TStaticText;
    TotalProgress: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  DBFormConfig: TDBFormConfig;
implementation
{$R *.dfm}
uses DataModule, U1;
procedure TDBFormConfig.Button1Click(Sender: TObject);
begin
DataModule1.IBDatabase1.Close;
DataModule1.IBDatabase1.Params.Clear;
DataModule1.IBDatabase1.DatabaseName:=DB0ConnectionEdit.Text;
DataModule1.IBDatabase1.Params.Add('user_name='+ DB0UserEdit.Text);
DataModule1.IBDatabase1.Params.Add('password='+ DB0PasswordEdit.Text);
DataModule1.IBQuery1.ParamByName('DB1CONNECTION').Value := DB1ConnectionEdit.Text;
DataModule1.IBQuery1.ParamByName('DB1USER').Value := DB1UserEdit.Text;
DataModule1.IBQuery1.ParamByName('DB1PASSWORD').Value := DB1PasswordEdit.Text;
DataModule1.IBQuery1.ParamByName('DB2CONNECTION').Value := DB2ConnectionEdit.Text;
DataModule1.IBQuery1.ParamByName('DB2USER').Value := DB2UserEdit.Text;
DataModule1.IBQuery1.ParamByName('DB2PASSWORD').Value := DB2PasswordEdit.Text;
DataModule1.Connection1 := DB0ConnectionEdit.Text;
DataModule1.Connection2 := DB1ConnectionEdit.Text;
DataModule1.Connection3 := DB2ConnectionEdit.Text;
DataModule1.User1 := DB0UserEdit.Text;
DataModule1.User2 := DB1UserEdit.Text;
DataModule1.User3 := DB2UserEdit.Text;
DataModule1.Password1 := DB0PasswordEdit.Text;
DataModule1.Password2 := DB1PasswordEdit.Text;
DataModule1.Password3 := DB2PasswordEdit.Text;
DataModule1.IBDatabase1.Open;
DataModule1.IBQuery1.Open;
if not DataModule1.ClientDataSet1.Active then
  DataModule1.ClientDataSet1.CreateDataSet
else
  DataModule1.ClientDataSet1.EmptyDataSet;
if not DataModule1.DetailDataSet.Active then
  DataModule1.DetailDataSet.CreateDataSet
else
  DataModule1.DetailDataSet.EmptyDataSet;
TotalProgress.Max := 60000;
TotalProgress.Show;
DataModule1.IBQuery1.Last;
TotalProgress.Step :=TotalProgress.Max div DataModule1.IBQuery1.RecordCount;
DataModule1.IBQuery1.First;
while not DataModule1.IBQuery1.Eof do
begin
try
 TotalProgress.Position := TotalProgress.Position + TotalProgress.Step;
 TotalProgress.Update;
 DBFormConfig.Update;
 Application.ProcessMessages;
 DataModule1.ClientDataSet1.Insert;
 DataModule1.ClientDataSet1SID.Value := DataModule1.IBQuery1SID.AsInteger;
 DataModule1.ClientDataSet1Data.Value := DataModule1.IBQuery1SDATE.AsDateTime;
 DataModule1.ClientDataSet1Import_Quantity.Value := DataModule1.IBQuery1IPQ.AsInteger;
 DataModule1.ClientDataSet1Order_Quantity.Value := DataModule1.IBQuery1OPQ.AsInteger;
 DataModule1.ClientDataSet1D0B1.Value := DataModule1.IBQuery1D0B1.AsInteger;
 DataModule1.ClientDataSet1D0B2.Value := DataModule1.IBQuery1D0B2.AsInteger;
 DataModule1.ClientDataSet1D1B1.Value := DataModule1.IBQuery1D1B1.AsInteger;
 DataModule1.ClientDataSet1D2B2.Value := DataModule1.IBQuery1D2B2.AsInteger;
 DataModule1.IBQuery2.Close;
 DataModule1.IBQuery2.ParamByName('SID').Value := DataModule1.IBQuery1SID.AsInteger;
 DataModule1.IBQuery2.Open;
 DataModule1.IBQuery2.Last;
 DataModule1.IBQuery2.First;
 var CorrectCount := 0;
 var TotalCount := 0;
 while not DataModule1.IBQuery2.Eof do
 begin
 try
    var Opis : string;
    Opis := DataModule1.IBQuery2OP.AsString;
    var index := Opis.IndexOf('Bezug:');
    if index<>-1 then
    begin
       //var OutputStrings : TStringList;
       var WordCount := 0;
       //OutputStrings := TStringList.Create;
       Opis := Opis.Remove(0,index);
       Opis := Opis.Replace('/','');
       try
         WordCount := Opis.CountChar('');
         {OutputStrings.LineBreak := '';
         OutputStrings.Text := Opis;
         if OutputStrings.Count-1=DataModule1.IBQuery2WAR_IN_DB.Value then
         CorrectCount := CorrectCount+1;}
         if WordCount=DataModule1.IBQuery2WAR_IN_DB.Value then
         begin
         CorrectCount := CorrectCount+1;
         TotalCount:=TotalCount+1;
         end
         else
         begin
           TotalCount:=TotalCount+1;
           DataModule1.DetailDataSet.Insert;
           DataModule1.DetailDataSetSID.Value := DataModule1.IBQuery1SID.AsInteger;
           DataModule1.DetailDataSetIMPORT_ORDER_ID.Value := DataModule1.IBQuery2ID.AsInteger;
           DataModule1.DetailDataSetREF_NS.Value := DataModule1.IBQuery2REF.AsInteger;
           DataModule1.DetailDataSet.Post;
         end;
       finally
         //OutputStrings.Free;
       end;
    end
    else
    begin
    TotalCount:=TotalCount+1;
    DataModule1.DetailDataSet.Insert;
    DataModule1.DetailDataSetSID.Value := DataModule1.IBQuery1SID.AsInteger;
    DataModule1.DetailDataSetIMPORT_ORDER_ID.Value := DataModule1.IBQuery2ID.AsInteger;
    DataModule1.DetailDataSetREF_NS.Value := DataModule1.IBQuery2REF.AsInteger;
    DataModule1.DetailDataSet.Post;
    end;
 finally
    DataModule1.IBQuery2.Next;
 end;
 end;
 DataModule1.ClientDataSet1CorrectWar.Value := CorrectCount;
 if (TotalCount=CorrectCount) and (DataModule1.IBQuery1B.Value=1) then
                                 DataModule1.ClientDataSet1IsCorrect.Value := 1
 else DataModule1.ClientDataSet1IsCorrect.Value := 0;
 DataModule1.ClientDataSet1.Post;
finally
 DataModule1.IBQuery1.Next;
end;
end;
TotalProgress.Hide;
TotalProgress.Position :=0;
DataModule1.DetailDataSet.IndexFieldNames := 'SID';
DataModule1.DetailDataSet.MasterSource :=DataModule1.DataSource2;
DataModule1.DetailDataSet.MasterFields := 'SID';
DataModule1.ClientDataSet1.First;
DBFormConfig.ModalResult := mrOK;
end;
procedure TDBFormConfig.Button2Click(Sender: TObject);
begin
DBFormConfig.ModalResult := mrCancel;
end;
procedure TDBFormConfig.FormShow(Sender: TObject);
begin
if DataModule1.Connection1<>'' then
  DB0ConnectionEdit.Text := DataModule1.Connection1;
if DataModule1.Connection2<>'' then
  DB1ConnectionEdit.Text := DataModule1.Connection2;
if DataModule1.Connection3<>'' then
  DB2ConnectionEdit.Text := DataModule1.Connection3;
if DataModule1.User1<>'' then
  DB0UserEdit.Text := DataModule1.User1;
if DataModule1.User2<>'' then
  DB1UserEdit.Text := DataModule1.User2;
if DataModule1.User3<>'' then
  DB2UserEdit.Text := DataModule1.User3;
if DataModule1.Password1<>'' then
  DB0PasswordEdit.Text := DataModule1.Password1;
if DataModule1.Password2<>'' then
  DB1PasswordEdit.Text := DataModule1.Password2;
if DataModule1.Password3<>'' then
  DB2PasswordEdit.Text := DataModule1.Password3;
end;

end.
