unit DatabaseHealthChecker;

interface

uses Data, FireDAC.Comp.Client;

type

  TDatabaseHealthChecker = class
  public
    class function Connected:Boolean;
    class procedure Connect;
  end;

implementation

uses ConnectionService;

{ TDatabaseHealthChecker }

class procedure TDatabaseHealthChecker.Connect;
var ConnectionService:TConnectionService;
begin
  ConnectionService:=TConnectionService.Create;
  try
    ConnectionService.InitDataBaseByConfiguration(ConnectionService.GetConnectionConfiguration);
  finally
    ConnectionService.Free;
  end;
end;

class function TDatabaseHealthChecker.Connected: Boolean;
var Connection:TFDConnection;
begin
  Connection:=Conn.getConnection;
  Result:=Connection.Connected;
end;

end.
