unit LoginView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, LoginController, MessageHelper;

type
  TFLoginView = class(TForm)
    pnlLogo: TPanel;
    Image1: TImage;
    pnlUser: TPanel;
    imgClose: TImage;
    lbReturn: TLabel;
    pnlContentLogin: TPanel;
    lbLogin: TLabel;
    lbPassword: TLabel;
    lbForgetPass: TLabel;
    pnlLogin: TPanel;
    edLogin: TEdit;
    pnlSenha: TPanel;
    imgEyeSlash: TImage;
    imgEye: TImage;
    edtSenha: TEdit;
    BtnLogin: TBitBtn;
    BtnClear: TBitBtn;
    procedure imgCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edLoginExit(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgEyeClick(Sender: TObject);
    procedure imgEyeSlashClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
  private
    { Private declarations }
    FController:TLoginController;
    FConnected:Boolean;
    procedure ExecuteLogin;
  public
    { Public declarations }
  end;

var
  FLoginView: TFLoginView;

implementation

uses ConnectionView, EditHelper, LoginDTO, SessionDTO;

{$R *.dfm}

procedure TFLoginView.BtnLoginClick(Sender: TObject);
begin
  ExecuteLogin;
end;

procedure TFLoginView.edLoginExit(Sender: TObject);
begin
  TEditHelper.validateEmpty('Login', edLogin);
end;

procedure TFLoginView.edtSenhaExit(Sender: TObject);
begin
  TEditHelper.validateEmpty('Senha', edtSenha);
end;

procedure TFLoginView.ExecuteLogin;
var DTO:TLoginDTO;
    SessionDTO:TSessionDTO;
begin
  DTO.Login:=edLogin.Text;
  DTO.Senha:=edtSenha.Text;
  try
    SessionDTO:=Self.FController.ValidUser(DTO);
    if SessionDTO.Authenticated then begin
      TMessageHelper.OK('Usuário de código "'+SessionDTO.ID.ToString+'" autenticado com sucesso!');
    end;
  except
    on E:Exception do begin
      TMessageHelper.Error('Falha ao autenticar usuário. Motivo: '+e.Message);
    end;
  end;
end;

procedure TFLoginView.FormCreate(Sender: TObject);
begin
  Self.FController:=TLoginController.Create;
  FLoginView.Top:=5000;
  try
    FConnected:=Self.FController.Connected;
    if not FConnected then Self.FController.Connect;
    FConnected:=Self.FController.Connected;
    FLoginView.Top:=0;
  except
    on E:Exception do begin
      TMessageHelper.Error('Não foi possível conectar no banco de dados. Motivo:'+E.Message+'. Revise a configuração');
    end;
  end;
end;

procedure TFLoginView.FormDestroy(Sender: TObject);
begin
  Self.FController.Free;
end;

procedure TFLoginView.FormShow(Sender: TObject);
begin
  if not FConnected then FConnectionConfig.ShowModal;
  FConnected:=Self.FController.Connected;
  if not FConnected then Self.Close;
end;

procedure TFLoginView.imgCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFLoginView.imgEyeClick(Sender: TObject);
begin
  edtSenha.PasswordChar:=#0;
  imgEye.Visible:=False;
  imgEyeSlash.Visible:=True;
end;

procedure TFLoginView.imgEyeSlashClick(Sender: TObject);
begin
  edtSenha.PasswordChar:='*';
  imgEye.Visible:=True;
  imgEyeSlash.Visible:=False;
end;

end.
