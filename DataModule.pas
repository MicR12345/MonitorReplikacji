unit DataModule;
interface
uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, IBX.IBQuery, Datasnap.DBClient;
type
  TDataModule1 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBTransaction1: TIBTransaction;
    IBUpdateSQL1: TIBUpdateSQL;
    IBQuery1SID: TIntegerField;
    IBQuery1SDATE: TDateTimeField;
    IBQuery1IPQ: TIntegerField;
    IBQuery1OPQ: TIntegerField;
    IBQuery1D0B1: TIntegerField;
    IBQuery1D0B2: TIntegerField;
    IBQuery1D1B1: TIntegerField;
    IBQuery1D2B2: TIntegerField;
    IBQuery1B: TIntegerField;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1CorrectWar: TIntegerField;
    DataSource2: TDataSource;
    IBQuery2: TIBQuery;
    ClientDataSet1SID: TIntegerField;
    ClientDataSet1Data: TDateTimeField;
    ClientDataSet1Import_Quantity: TIntegerField;
    ClientDataSet1Order_Quantity: TIntegerField;
    ClientDataSet1D0B1: TIntegerField;
    ClientDataSet1D0B2: TIntegerField;
    ClientDataSet1D1B1: TIntegerField;
    ClientDataSet1D2B2: TIntegerField;
    ClientDataSet1IsCorrect: TIntegerField;
    DetailDataSet: TClientDataSet;
    DetailDataSetSID: TIntegerField;
    DetailDataSetIMPORT_ORDER_ID: TIntegerField;
    DetailDataSetREF_NS: TIntegerField;
    IBQuery2ID: TIntegerField;
    IBQuery2OP: TIBStringField;
    IBQuery2WAR_IN_DB: TIntegerField;
    IBQuery2REF: TIntegerField;
    DetailSource: TDataSource;
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
  DataModule1: TDataModule1;
implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

end.
