unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, IBX.IBQuery;

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
    IBQuery1D1B2: TIntegerField;
    IBQuery1D2B1: TIntegerField;
    IBQuery1D2B2: TIntegerField;
    IBQuery1B: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
