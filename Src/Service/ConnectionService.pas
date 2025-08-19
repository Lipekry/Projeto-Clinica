unit ConnectionService;

interface

uses Data, ConnectionConfigurationRepository, ConnectionConfigurationRepositoryIni, FireDAC.Comp.Client,
     ConnectionModel, System.SysUtils, ConnectionConfigDTO, System.NetEncoding, ConnectionConfigurationRepositoryJSON;

  type TConnectionService = class
  private
    function DTOtoModel(aConnectionDTO: TConnectionConfigDTO):TConnectionModel;
  public
    function GetConnectionConfiguration:TConnectionConfigDTO;
    procedure SaveConnectionConfiguration(aConnectionDTO: TConnectionConfigDTO);
    procedure InitDataBaseByConfiguration(aConnectionDTO: TConnectionConfigDTO);
  end;

implementation

{ TConexaoService }

function TConnectionService.GetConnectionConfiguration: TConnectionConfigDTO;
var ConnectionModel:TConnectionModel;
    ConnectionConfigRepo:IConnectionConfigurationRepository;
begin
  ConnectionConfigRepo:=TConnectionRepositoryIni.Create;
  ConnectionModel:=ConnectionConfigRepo.Get;
  try
    ConnectionModel.Validate;
    Result.DriverName:=ConnectionModel.DriverName;
    Result.Server:=ConnectionModel.Server;
    Result.Port:=ConnectionModel.Port;
    Result.Database:=ConnectionModel.Database;
    Result.UserName:=ConnectionModel.UserName;
    try
      Result.Password:=TNetEncoding.Base64.Decode(ConnectionModel.Password);
    except on E:Exception do
      Result.Password:=ConnectionModel.Password;
    end;
    Result.CharacterSet:=ConnectionModel.CharacterSet;
  finally
    ConnectionModel.Free;
  end;
end;

procedure TConnectionService.InitDataBaseByConfiguration(aConnectionDTO: TConnectionConfigDTO);
var ConnectionModel:TConnectionModel;
begin
  ConnectionModel:=DTOtoModel(aConnectionDTO);
  try
    Data.Conn.Init(ConnectionModel);
  finally
    ConnectionModel.Free;
  end;
end;

function TConnectionService.DTOtoModel(aConnectionDTO: TConnectionConfigDTO): TConnectionModel;
begin
  Result:=TConnectionModel.Create;
  Result.DriverName:=aConnectionDTO.DriverName;
  Result.Server:=aConnectionDTO.Server;
  Result.Port:=aConnectionDTO.Port;
  Result.Database:=aConnectionDTO.Database;
  Result.UserName:=aConnectionDTO.UserName;
  Result.Password:=aConnectionDTO.Password;
  Result.CharacterSet:=aConnectionDTO.CharacterSet;
end;

procedure TConnectionService.SaveConnectionConfiguration(aConnectionDTO: TConnectionConfigDTO);
var ConnectionModel:TConnectionModel;
    ConnectionConfigRepo:IConnectionConfigurationRepository;
begin
  ConnectionConfigRepo:=TConnectionRepositoryINI.Create;
  ConnectionModel:=Self.DTOtoModel(aConnectionDTO);
  try
    ConnectionModel.Validate;
    ConnectionModel.Password:=TNetEncoding.Base64.Encode(ConnectionModel.Password);
    ConnectionConfigRepo.Save(ConnectionModel);
  finally
    ConnectionModel.Free;
  end;
end;

end.
