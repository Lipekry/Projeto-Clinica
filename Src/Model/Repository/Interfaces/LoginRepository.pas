unit LoginRepository;

interface

type

  ILoginRepository<ClassType:class> = interface
    function Login(Login,Password:String):ClassType;
  end;

implementation

end.
