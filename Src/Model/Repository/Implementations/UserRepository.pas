unit UserRepository;

interface

uses CRUDRepository, LoginRepository, UserModel, System.Generics.Collections,
  FireDAC.Comp.Client, System.SysUtils;

type

  TUserRepository = class(TInterfacedObject, ICRUDRepository<TUserModel>, ILoginRepository<TUserModel>)
  private
    FConnection:TFDConnection;
    FQuery:TFDQuery;
  public
    function getById(aID:Integer):TUserModel;
    function getAll:TObjectList<TUserModel>;
    function Login(Login,Password:String):TUserModel;
    procedure Insert(Obj:TUserModel);
    procedure Update(Obj:TUserModel);
    procedure Delete(Obj:TUserModel);

    constructor Create(Connection:TFDConnection);
  end;

implementation

{ TUserRepository }

constructor TUserRepository.Create(Connection: TFDConnection);
begin
  Self.FConnection:=Connection;
  Self.FQuery:=TFDQuery.Create(Connection);
  Self.FQuery.Connection:=Connection;
end;

procedure TUserRepository.Delete(Obj: TUserModel);
var SQL:String;
begin
  SQL:='UPDATE Usuarios SET active = false WHERE codigo='+Obj.Codigo.ToString;
  Self.FQuery.SQL.Text:=SQL;
  try
    Self.FQuery.ExecSQL;
  finally
    Self.FQuery.Close;
  end;
end;

function TUserRepository.getAll: TObjectList<TUserModel>;
var SQL:String;
    UserModel:TUserModel;
begin
  SQL:='SELECT * FROM usuarios';
  Self.FQuery.SQL.Text:=SQL;
  try
    Self.FQuery.Open;
    Result:=TObjectList<TUserModel>.Create;
    while not Self.FQuery.Eof do begin
      UserModel:=TUserModel.Create;
      UserModel.Codigo:=Self.FQuery.FieldByName('codigo').AsInteger;
      UserModel.Name:=Self.FQuery.FieldByName('name').AsString;
      UserModel.Login:=Self.FQuery.FieldByName('login').AsString;
      UserModel.Password:=Self.FQuery.FieldByName('password').AsString;
      UserModel.Active:=Self.FQuery.FieldByName('active').AsBoolean;
      Result.Add(UserModel);
    end;
  finally
    Self.FQuery.Close;
  end;
end;

function TUserRepository.getById(aID: Integer): TUserModel;
var SQL:String;
    UserModel:TUserModel;
begin
  SQL:='SELECT * FROM usuarios WHERE codigo = '+aID.ToString;
  Self.FQuery.SQL.Text:=SQL;
  try
    Self.FQuery.Open;
    if Self.FQuery.IsEmpty then begin
      raise Exception.Create('Não encontrado usuário de código: '+aID.ToString);
    end;
    Result:=TUserModel.Create;
    UserModel:=TUserModel.Create;
    UserModel.Codigo:=Self.FQuery.FieldByName('codigo').AsInteger;
    UserModel.Name:=Self.FQuery.FieldByName('name').AsString;
    UserModel.Login:=Self.FQuery.FieldByName('login').AsString;
    UserModel.Password:=Self.FQuery.FieldByName('password').AsString;
    UserModel.Active:=Self.FQuery.FieldByName('active').AsBoolean;
  finally
    Self.FQuery.Close;
  end;
end;

function TUserRepository.Login(Login, Password: String): TUserModel;
var SQL:String;
    UserModel:TUserModel;
begin
  SQL:='SELECT * FROM usuarios WHERE login = '+Login.QuotedString+' AND senha = '+Password.QuotedString;
  Self.FQuery.SQL.Text:=SQL;
  try
    Self.FQuery.Open;
    if Self.FQuery.IsEmpty then begin
      raise Exception.Create('Não encontrado usuário com essas credenciais.');
    end;
    Result:=TUserModel.Create;
    Result.Codigo:=Self.FQuery.FieldByName('codigo').AsInteger;
    Result.Name:=Self.FQuery.FieldByName('nome').AsString;
    Result.Login:=Self.FQuery.FieldByName('login').AsString;
    Result.Password:=Self.FQuery.FieldByName('senha').AsString;
    Result.Active:=Self.FQuery.FieldByName('active').AsBoolean;
  finally
    Self.FQuery.Close;
  end;
end;

procedure TUserRepository.Insert(Obj: TUserModel);
var SQL:String;
begin
  SQL:='INSERT INTO Usuarios (nome, login, senha) VALUES ';
  SQL:=SQL+'('+Obj.Name+','+Obj.Login+','+Obj.Password+')';
  Self.FQuery.SQL.Text:=SQL;
  try
    Self.FQuery.ExecSQL;
  finally
    Self.FQuery.Close;
  end;
end;

procedure TUserRepository.Update(Obj: TUserModel);
var SQL:String;
begin
  SQL:='UPDATE Usuarios SET';
  SQL:=SQL+' nome = '+Obj.Name+',';
  SQL:=SQL+' login = '+Obj.Login+',';
  SQL:=SQL+' senha = '+Obj.Password+',';
  SQL:=SQL+' active = '+Obj.Active.ToString(True);
  SQL:=SQL+' WHERE codigo='+Obj.Codigo.ToString;
  Self.FQuery.SQL.Text:=SQL;
  try
    Self.FQuery.ExecSQL;
  finally
    Self.FQuery.Close;
  end;
end;

end.
