unit U1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, IBX.IBQuery,
  IBX.IBCustomDataSet, IBX.IBDatabase, Vcl.StdCtrls, IBX.IBUpdateSQL,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.Grids, Vcl.DBGrids,System.IniFiles;
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
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure ConfigButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditIntervalChange(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    Connection1: string;
    Connection2: string;
    Connection3: string;
    User1: string;
    User2: string;
    User3: string;
    Password1: string;
    Password2: string;
    Password3: string;
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
  DataModule1.DetailDataSet.EmptyDataSet;
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
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
DataModule1.IBQuery1.Open;
end;
procedure TForm3.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
  begin
    DBGrid2.DataSource.DataSet.Filter := 'IsCorrect = 0';
    DBGrid2.DataSource.DataSet.Filtered:= True;
  end
else
  begin
    DBGrid2.DataSource.DataSet.Filter := '';
    DBGrid2.DataSource.DataSet.Filtered:= False;
  end;
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

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
begin
if Column.FieldName = 'IMPORT_ORDER_ID' then
  begin
    if DataModule1.DetailDataSet.IndexName='ID_ASC' then
    begin
      DataModule1.DetailDataSet.IndexName:='ID_DESC';
    end
    else
    begin
      DataModule1.DetailDataSet.IndexName:='ID_ASC';
    end;
  end
  else if Column.FieldName = 'REF_NS' then
  begin
    if DataModule1.DetailDataSet.IndexName='REFNS_ASC' then
    begin
      DataModule1.DetailDataSet.IndexName:='REFNS_DESC';
    end
    else
    begin
      DataModule1.DetailDataSet.IndexName:='REFNS_ASC';
    end;
  end;
end;

procedure TForm3.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (Sender as TDBGrid).DataSource.DataSet.FieldByName('IsCorrect').Value=0 then
(Sender as TDBGrid).Canvas.Brush.Color:=clRed;
(Sender as TDBGrid).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;
procedure TForm3.DBGrid2TitleClick(Column: TColumn);
begin
if Column.FieldName = 'SID' then
  begin
    if DataModule1.ClientDataSet1.IndexName='ASCSID' then
    begin
      DataModule1.ClientDataSet1.IndexName:='DESCSID';
    end
    else
    begin
      DataModule1.ClientDataSet1.IndexName:='ASCSID';
    end;
  end;
DataModule1.ClientDataSet1.First;
end;

procedure TForm3.EditIntervalChange(Sender: TObject);
begin
Timer1.Interval:=StrToInt(EditInterval.Text)*1000;
end;
procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 var
   Ini: TIniFile;
 begin
   Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
   try
   //TODO
   Ini.WriteString('Connection','ConnectionDB0',Connection1);
   Ini.WriteString('Connection','ConnectionDB1',Connection2);
   Ini.WriteString('Connection','ConnectionDB2',Connection3);
   Ini.WriteString('User','UserDB0',User1);
   Ini.WriteString('User','UserDB1',User2);
   Ini.WriteString('User','UserDB2',User3);
   finally
     Ini.Free;
   end;
 end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
var
   Ini: TIniFile;
 begin
   Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
   try
   //TODO
   Ini.ReadString('Connection','ConnectionDB0',Connection1);
   Ini.ReadString('Connection','ConnectionDB1',Connection2);
   Ini.ReadString('Connection','ConnectionDB2',Connection3);
   Ini.ReadString('User','UserDB0',User1);
   Ini.ReadString('User','UserDB1',User2);
   Ini.ReadString('User','UserDB2',User3);
   finally
     Ini.Free;
   end;
end;
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
