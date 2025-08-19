unit CRUDRepository;

interface

uses System.Generics.Collections;

type

  ICRUDRepository<ClassType: class> = interface
    function getById(aID:Integer):ClassType;
    function getAll:TObjectList<ClassType>;
    procedure Insert(Obj:ClassType);
    procedure Update(Obj:ClassType);
    procedure Delete(Obj:ClassType);
  end;

implementation

end.
