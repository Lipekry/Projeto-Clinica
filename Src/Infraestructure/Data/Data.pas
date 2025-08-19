unit Data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PGDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  ConnectionModel;

type
  TConn = class(TDataModule)
    PgDriver: TFDPhysPgDriverLink;
    Connection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure SetConfiguration(aConexaoModel:TConnectionModel);
  public
    { Public declarations }
    function getConnection:TFDConnection;
    procedure Init(aConexaoModel:TConnectionModel);
  end;

var
  Conn: TConn;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TConn.DataModuleCreate(Sender: TObject);
var VendorLibPath:String;
begin
  inherited;
  Connection.Connected:=False;
  VendorLibPath:=IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)) + '..\..');
  VendorLibPath:=ExpandFileName(VendorLibPath);
  PGDriver.VendorHome:=VendorLibPath;
end;

function TConn.getConnection: TFDConnection;
begin
  if Conn.Connection=nil then begin
    Conn.Connection:=TFDConnection.Create(Conn);
  end;
  Result:=Conn.Connection;
end;

procedure TConn.Init(aConexaoModel: TConnectionModel);
begin
  Self.Connection:=Self.getConnection;
  Self.SetConfiguration(aConexaoModel);
  Self.Connection.Connected:=True;
end;

procedure TConn.SetConfiguration(aConexaoModel: TConnectionModel);
begin
  Self.Connection.DriverName:=aConexaoModel.DriverName;
  Self.Connection.Params.Values['Server']:=aConexaoModel.Server;
  Self.Connection.Params.Values['Port']:=aConexaoModel.Port;
  Self.Connection.Params.Database:=aConexaoModel.Database;
  Self.Connection.Params.UserName:=aConexaoModel.UserName;
  Self.Connection.Params.Password:=aConexaoModel.Password;
  Self.Connection.Params.Values['CharacterSet']:=aConexaoModel.CharacterSet;
  Self.Connection.LoginPrompt:=False;
end;

end.
