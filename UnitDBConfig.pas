unit UnitDBConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

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
DBFormConfig.ModalResult := mrOK;
end;

procedure TDBFormConfig.Button2Click(Sender: TObject);
begin
DBFormConfig.ModalResult := mrCancel;
end;

end.
