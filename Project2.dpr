program Project2;

uses
  Vcl.Forms,
  U1 in 'U1.pas' {Form3},
  UnitDBConfig in 'UnitDBConfig.pas' {DBFormConfig},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TDBFormConfig, DBFormConfig);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.





