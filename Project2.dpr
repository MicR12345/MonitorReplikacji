program Project2;
uses
  Vcl.Forms,
  U1 in 'U1.pas' {Form3},
  UnitDBConfig in 'UnitDBConfig.pas' {DBFormConfig},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('ChangedWindows');
  Application.Title := 'Importy';
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDBFormConfig, DBFormConfig);
  Application.Run;
end.







