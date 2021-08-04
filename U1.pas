unit U1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, IBX.IBQuery,
  IBX.IBCustomDataSet, IBX.IBDatabase, Vcl.StdCtrls, IBX.IBUpdateSQL,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.Grids, Vcl.DBGrids;

type
  TForm3 = class(TForm)
    Button1: TButton;
    ConfigButton: TButton;
    Timer1: TTimer;
    StaticText1: TStaticText;
    EditInterval: TEdit;
    BindingsList1: TBindingsList;
    AutoRefreshCheckBox: TCheckBox;
    LinkControlToPropertyEnabled: TLinkControlToProperty;
    LinkControlToPropertyEnabled2: TLinkControlToProperty;
    DBGrid2: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure ConfigButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditIntervalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form3: TForm3;

implementation

{$R *.dfm}
uses DataModule,UnitDBConfig;
procedure TForm3.Button1Click(Sender: TObject);
begin
  if DataModule1.IBQuery1.Active then
  begin
  DataModule1.IBQuery1.Close;
  DataModule1.IBQuery1.Open;
  DataModule1.ClientDataSet1.EmptyDataSet;
while not DataModule1.IBQuery1.Eof do
try
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
 var CorrectCount := 0;
 var TotalCount := 0;
 while not DataModule1.IBQuery2.Eof do
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
 DataModule1.ClientDataSet1CorrectWar.Value := CorrectCount;
 if (TotalCount=CorrectCount) and (DataModule1.IBQuery1B.Value=1) then
                                 DataModule1.ClientDataSet1IsCorrect.Value := 1
 else DataModule1.ClientDataSet1IsCorrect.Value := 0;
 DataModule1.ClientDataSet1.Post;
finally
 DataModule1.IBQuery1.Next;
end;
  end;
end;


procedure TForm3.Button2Click(Sender: TObject);
begin
DataModule1.IBQuery1.Open;
end;

procedure TForm3.ConfigButtonClick(Sender: TObject);
begin
var configform : TDBFormConfig;
configform := TDBFormConfig.Create(DataModule1);
configform.ShowModal;
if configform.ModalResult=mrOK then
  begin
  end;
end;

procedure TForm3.EditIntervalChange(Sender: TObject);
begin
Timer1.Interval:=StrToInt(EditInterval.Text)*1000;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
try
Button1.Click;
Timer1.Enabled:= False;
finally
Timer1.Enabled:=True;
end;
end;

end.
