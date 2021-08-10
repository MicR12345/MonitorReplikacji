unit UnitDBConfig;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, System.StrUtils,
  Vcl.ComCtrls,System.IniFiles;
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
    procedure FormCreate(Sender: TObject);
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
Form3.Connection1 := DB0ConnectionEdit.Text;
Form3.Connection2 := DB1ConnectionEdit.Text;
Form3.Connection3 := DB2ConnectionEdit.Text;
Form3.User1 := DB0UserEdit.Text;
Form3.User2 := DB1UserEdit.Text;
Form3.User3 := DB2UserEdit.Text;
Form3.Password1 := DB0PasswordEdit.Text;
Form3.Password2 := DB1PasswordEdit.Text;
Form3.Password3 := DB2PasswordEdit.Text;
var Ini: TIniFile;
 begin
   Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
   try
   //TODO
   Ini.WriteString('Connection','ConnectionDB0',Form3.Connection1);
   Ini.WriteString('Connection','ConnectionDB1',Form3.Connection2);
   Ini.WriteString('Connection','ConnectionDB2',Form3.Connection3);
   Ini.WriteString('Connection','UserDB0',Form3.User1);
   Ini.WriteString('Connection','UserDB1',Form3.User2);
   Ini.WriteString('Connection','UserDB2',Form3.User3);
   Ini.WriteString('Connection','PasswordDB0',Form3.Password1);
   Ini.WriteString('Connection','PasswordDB1',Form3.Password2);
   Ini.WriteString('Connection','PasswordDB2',Form3.Password3);
   finally
     Ini.Free;
   end;
 end;
DBFormConfig.ModalResult := mrOK;
end;
procedure TDBFormConfig.Button2Click(Sender: TObject);
begin
DBFormConfig.ModalResult := mrCancel;
end;
procedure TDBFormConfig.FormCreate(Sender: TObject);
begin
DB0ConnectionEdit.Text := Form3.Connection1;
DB1ConnectionEdit.Text := Form3.Connection2;
DB2ConnectionEdit.Text := Form3.Connection3;
DB0UserEdit.Text := Form3.User1;
DB1UserEdit.Text := Form3.User2;
DB2UserEdit.Text := Form3.User3;
DB0PasswordEdit.Text := Form3.Password1;
DB1PasswordEdit.Text := Form3.Password2;
DB2PasswordEdit.Text := Form3.Password3;
end;

end.
