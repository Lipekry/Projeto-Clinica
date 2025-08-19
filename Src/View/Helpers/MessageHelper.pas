unit MessageHelper;

interface

type

 TMessageHelper = class
 public
   class procedure Error(aMessage:String);
   class procedure Warning(aMessage:String);
   class function Confirm(aMessage:String):Boolean;
   class procedure OK(aMessage:String);
 end;

implementation

uses Vcl.Dialogs, System.UITypes;

{ TMessageHelper }

class function TMessageHelper.Confirm(aMessage: String): Boolean;
begin
  Result:=MessageDlg(aMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

class procedure TMessageHelper.Error(aMessage: String);
begin
  MessageDlg(aMessage, mtError, [mbOK], 0);
end;

class procedure TMessageHelper.OK(aMessage: String);
begin
   MessageDlg(aMessage, TMsgDlgType.mtConfirmation, [mbOK], 0);
end;

class procedure TMessageHelper.Warning(aMessage: String);
begin
  MessageDlg(aMessage, mtWarning, [mbOK], 0);
end;

end.
