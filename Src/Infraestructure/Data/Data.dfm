object Conn: TConn
  OnCreate = DataModuleCreate
  Height = 120
  Width = 183
  PixelsPerInch = 120
  object PgDriver: TFDPhysPgDriverLink
    DriverID = 'PG'
    Left = 28
    Top = 24
  end
  object Connection: TFDConnection
    Params.Strings = (
      'User_Name=localhost'
      'Database=clinica'
      'DriverID=PG'
      'Server=localhost'
      'CharacterSet=UTF8')
    Left = 104
    Top = 24
  end
end
