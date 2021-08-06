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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBFormConfig: TDBFormConfig;

implementation

{$R *.dfm}

uses DataModule;

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
DataModule1.IBDatabase1.Open;
DataModule1.IBQuery1.Open;
DataModule1.ClientDataSet1.CreateDataSet;
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
         CorrectCount := CorrectCount+1;
       finally
         //OutputStrings.Free;
       end;
    end
    else TotalCount:=TotalCount+1;
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
DBFormConfig.ModalResult := mrOK;
end;

procedure TDBFormConfig.Button2Click(Sender: TObject);
begin
DBFormConfig.ModalResult := mrCancel;
end;

end.
