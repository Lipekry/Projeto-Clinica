unit EditHelper;

interface

uses Vcl.StdCtrls;

type

  TEditHelper = class
  public
    class procedure validateEmpty(EditName:String; Edit: TEdit);
  end;

implementation

uses Vcl.Dialogs, MessageHelper;

{ TEditHelper }

class procedure TEditHelper.validateEmpty(EditName:String; Edit: TEdit);
begin
  if Edit.Text='' then begin
    TMessageHelper.Error('O campo "'+EditName+'" não pode ser vazio');
    Edit.SetFocus;
  end;
end;

end.
