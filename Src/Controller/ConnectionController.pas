unit ConnectionController;

interface

uses System.SysUtils, ConnectionConfigDTO, ConnectionService;

type

  TConnectionController = class
  public
    function getConnectionConfiguration:TConnectionConfigDTO;
    procedure setConnectionConfiguration(AConnectionDTO:TConnectionConfigDTO);
    procedure InitDataBaseByConfiguration(AConnectionDTO:TConnectionConfigDTO);
  end;

implementation

{ TConnectionController }

function TConnectionController.getConnectionConfiguration: TConnectionConfigDTO;
var ConnService:TConnectionService;
begin
  ConnService:=TConnectionService.Create;
  try
    Result:=ConnService.GetConnectionConfiguration;
  finally
    ConnService.Free;
  end;
end;

procedure TConnectionController.InitDataBaseByConfiguration(AConnectionDTO:TConnectionConfigDTO);
var ConnService:TConnectionService;
begin
  ConnService:=TConnectionService.Create;
  try
    ConnService.InitDataBaseByConfiguration(AConnectionDTO);
  finally
    ConnService.Free;
  end;
end;

procedure TConnectionController.setConnectionConfiguration(AConnectionDTO: TConnectionConfigDTO);
var ConnService:TConnectionService;
begin
  ConnService:=TConnectionService.Create;
  try
    ConnService.SaveConnectionConfiguration(AConnectionDTO);
  finally
    ConnService.Free;
  end;
end;

end.
