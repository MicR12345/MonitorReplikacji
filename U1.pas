unit U1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, IBX.IBQuery,
  IBX.IBCustomDataSet, IBX.IBDatabase, Vcl.StdCtrls, IBX.IBUpdateSQL,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImage,
  cxImageComboBox, System.ImageList, Vcl.ImgList, cxImageList, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TForm3 = class(TForm)
    Button1: TButton;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxImageList1: TcxImageList;
    ConfigButton: TButton;
    cxGrid2DBTableView1SID: TcxGridDBColumn;
    cxGrid2DBTableView1SDATE: TcxGridDBColumn;
    cxGrid2DBTableView1IPQ: TcxGridDBColumn;
    cxGrid2DBTableView1OPQ: TcxGridDBColumn;
    cxGrid2DBTableView1D0B1: TcxGridDBColumn;
    cxGrid2DBTableView1D0B2: TcxGridDBColumn;
    cxGrid2DBTableView1D1B1: TcxGridDBColumn;
    cxGrid2DBTableView1D2B2: TcxGridDBColumn;
    cxGrid2DBTableView1B: TcxGridDBColumn;
    procedure Button1Click(Sender: TObject);
    procedure ConfigButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  cxGrid2DBTableView1.DataController.DataSet.Refresh;
  cxGrid2DBTableView1.DataController.RefreshExternalData;
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

end.
