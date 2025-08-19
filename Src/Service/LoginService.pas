unit LoginService;

interface

uses SessionDTO, LoginDTO, UserModel, UserRepository, Data, System.NetEncoding, System.SysUtils;

type

  TLoginService = class
    function DataBaseConnected:Boolean;
    procedure ConnectToDataBase;
    function ValidUser(aLoginDTO:TLoginDTO):TSessionDTO;
  end;

implementation

uses DatabaseHealthChecker;

{ TLoginService }

procedure TLoginService.ConnectToDataBase;
begin
  TDatabaseHealthChecker.Connect;
end;

function TLoginService.DataBaseConnected: Boolean;
begin
  Result:=TDatabaseHealthChecker.Connected;
end;

function TLoginService.ValidUser(aLoginDTO:TLoginDTO): TSessionDTO;
var UserRepository:TUserRepository;
    UserModel:TUserModel;
begin
  UserRepository:=TUserRepository.Create(Conn.getConnection);
  try
    aLoginDTO.Senha:=TNetEncoding.Base64.Encode(aLoginDTO.Senha);
    aLoginDTO.Login:=aLoginDTO.Login.ToUpper;
    UserModel:=UserRepository.Login(aLoginDTO.Login, aLoginDTO.Senha);
    try
      Result.Authenticated:=UserModel<>nil;
      if UserModel<>nil then begin
        Result.ID:=UserModel.Codigo;
      end;
    finally
      UserModel.Free;
    end;
  finally
    UserRepository.Free;
  end;
end;

end.
