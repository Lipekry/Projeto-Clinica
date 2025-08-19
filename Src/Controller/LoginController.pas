unit LoginController;

interface

uses LoginDTO, SessionDTO;

type

  TLoginController = class
  public
    function Connected:Boolean;
    procedure Connect;
    function ValidUser(aLogin:TLoginDTO):TSessionDTO;
  end;

implementation

uses LoginService;

{ TLoginController }

procedure TLoginController.Connect;
var LoginService:TLoginService;
begin
  LoginService:=TLoginService.Create;
  try
    LoginService.ConnectToDataBase;
  finally
    LoginService.Free;
  end;
end;

function TLoginController.Connected: Boolean;
var LoginService:TLoginService;
begin
  LoginService:=TLoginService.Create;
  try
    Result:=LoginService.DataBaseConnected;
  finally
    LoginService.Free;
  end;
end;

function TLoginController.ValidUser(aLogin: TLoginDTO): TSessionDTO;
var LoginService:TLoginService;
begin
  LoginService:=TLoginService.Create;
  try
    Result:=LoginService.ValidUser(aLogin);
  finally
    LoginService.Free;
  end;
end;

end.
