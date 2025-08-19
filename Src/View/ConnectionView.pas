unit ConnectionView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, ConnectionController, ConnectionConfigDTO,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFConnectionConfig = class(TForm)
    pnlUser: TPanel;
    lbReturn: TLabel;
    pnlContentLogin: TPanel;
    lbServidor: TLabel;
    lbPorta: TLabel;
    pnlLogin: TPanel;
    edServidor: TEdit;
    pnlSenha: TPanel;
    BtnSave: TBitBtn;
    lbBase: TLabel;
    lbUsuario: TLabel;
    Panel1: TPanel;
    edBase: TEdit;
    Panel2: TPanel;
    lbCharset: TLabel;
    lbSenha: TLabel;
    lbDriver: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    edSenha: TEdit;
    cbDriver: TComboBox;
    cbCharset: TComboBox;
    edPorta: TEdit;
    edUsuario: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edServidorExit(Sender: TObject);
    procedure edPortaExit(Sender: TObject);
    procedure edBaseExit(Sender: TObject);
    procedure edUsuarioExit(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
    FController:TConnectionController;
    procedure PreencheEdits(DTO:TConnectionConfigDTO);
    procedure Save;
  public
    { Public declarations }
  end;

var
  FConnectionConfig: TFConnectionConfig;

implementation

uses Vcl.Dialogs, EditHelper, MessageHelper;

{$R *.dfm}

procedure TFConnectionConfig.BtnSaveClick(Sender: TObject);
begin
  Self.Save;
end;

procedure TFConnectionConfig.Save;
var DTO:TConnectionConfigDTO;
begin
  DTO.Server:=edServidor.Text;
  DTO.Database:=edBase.Text;
  DTO.Password:=edSenha.Text;
  DTO.Port:=edPorta.Text;
  DTO.UserName:=edUsuario.Text;
  DTO.CharacterSet:=cbCharset.Text;
  DTO.DriverName:=cbDriver.Text;
  try
    FController.setConnectionConfiguration(DTO);
    FController.InitDataBaseByConfiguration(DTO);
    TMessageHelper.OK('Configuração salva com sucesso. Banco conectado!');
    Self.Close;
  except on E:Exception do
    TMessageHelper.Error('Falha ao conectar no banco de dados. Motivo: '+E.Message);
  end;
end;

procedure TFConnectionConfig.edBaseExit(Sender: TObject);
begin
  TEditHelper.validateEmpty('Servidor', edServidor);
end;

procedure TFConnectionConfig.edPortaExit(Sender: TObject);
begin
  TEditHelper.validateEmpty('Porta', edPorta);
end;

procedure TFConnectionConfig.edSenhaExit(Sender: TObject);
begin
  TEditHelper.validateEmpty('Senha', edSenha);
end;

procedure TFConnectionConfig.edServidorExit(Sender: TObject);
begin
  TEditHelper.validateEmpty('Servidor', edServidor);
end;

procedure TFConnectionConfig.edUsuarioExit(Sender: TObject);
begin
  TEditHelper.validateEmpty('Usuário', edUsuario);
end;

procedure TFConnectionConfig.FormCreate(Sender: TObject);
var ConfigDTO:TConnectionConfigDTO;
begin
  Self.FController:=TConnectionController.Create;
  ConfigDTO:=Self.FController.getConnectionConfiguration;
  PreencheEdits(ConfigDTO);
end;

procedure TFConnectionConfig.FormDestroy(Sender: TObject);
begin
  Self.FController.Destroy;
end;

procedure TFConnectionConfig.PreencheEdits(DTO: TConnectionConfigDTO);
begin
  edServidor.Text:=DTO.Server;
  edBase.Text:=DTO.Database;
  edSenha.Text:=DTO.Password;
  edPorta.Text:=DTO.Port;
  edUsuario.Text:=DTO.UserName;
  cbDriver.Text:=DTO.DriverName;
  cbCharset.Text:=DTO.CharacterSet;
end;

end.
