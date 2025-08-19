object FConnectionConfig: TFConnectionConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es de conex'#227'o com o banco de dados'
  ClientHeight = 647
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnlUser: TPanel
    Left = -16
    Top = 0
    Width = 750
    Height = 647
    Align = alRight
    Anchors = [akRight]
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = clWhite
    ParentBiDiMode = False
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -18
    ExplicitHeight = 639
    object lbReturn: TLabel
      Left = 0
      Top = 614
      Width = 750
      Height = 33
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 88
      ExplicitTop = 601
      ExplicitWidth = 489
    end
    object pnlContentLogin: TPanel
      Left = 85
      Top = 0
      Width = 585
      Height = 811
      BevelOuter = bvNone
      TabOrder = 0
      object lbServidor: TLabel
        Left = 48
        Top = 40
        Width = 73
        Height = 24
        Caption = 'Servidor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbPorta: TLabel
        Left = 48
        Top = 110
        Width = 47
        Height = 24
        Caption = 'Porta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbBase: TLabel
        Left = 48
        Top = 188
        Width = 43
        Height = 24
        Caption = 'Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbUsuario: TLabel
        Left = 48
        Top = 266
        Width = 67
        Height = 24
        Caption = 'Usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbCharset: TLabel
        Left = 48
        Top = 500
        Width = 68
        Height = 24
        Caption = 'Charset'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbSenha: TLabel
        Left = 48
        Top = 344
        Width = 55
        Height = 24
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbDriver: TLabel
        Left = 48
        Top = 422
        Width = 54
        Height = 24
        Caption = 'Driver'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pnlLogin: TPanel
        Left = 48
        Top = 67
        Width = 489
        Height = 40
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object edServidor: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 0
          Width = 481
          Height = 36
          ParentCustomHint = False
          Align = alBottom
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          OEMConvert = True
          ParentBiDiMode = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TextHint = 'Digite o endere'#231'o do servidor'
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          OnExit = edServidorExit
        end
      end
      object pnlSenha: TPanel
        Left = 48
        Top = 143
        Width = 489
        Height = 45
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object edPorta: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 5
          Width = 481
          Height = 36
          Align = alBottom
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          OEMConvert = True
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          TextHint = 'Digite o n'#250'mero da porta'
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          OnExit = edPortaExit
        end
      end
      object BtnSave: TBitBtn
        Left = 188
        Top = 587
        Width = 200
        Height = 41
        Cursor = crHandPoint
        Caption = 'Salvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = bkYes
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 7
        OnClick = BtnSaveClick
      end
      object Panel1: TPanel
        Left = 48
        Top = 219
        Width = 489
        Height = 45
        Color = clSilver
        ParentBackground = False
        TabOrder = 2
        object edBase: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 5
          Width = 481
          Height = 36
          Align = alBottom
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          OEMConvert = True
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          TextHint = 'Digite o nome da sua base de dados'
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          OnExit = edBaseExit
        end
      end
      object Panel2: TPanel
        Left = 48
        Top = 295
        Width = 489
        Height = 45
        Color = clSilver
        ParentBackground = False
        TabOrder = 3
        object edUsuario: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 5
          Width = 481
          Height = 36
          Align = alBottom
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          OEMConvert = True
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          TextHint = 'Digite o usuario da sua base de dados'
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          OnExit = edUsuarioExit
        end
      end
      object Panel3: TPanel
        Left = 48
        Top = 523
        Width = 489
        Height = 45
        Color = clSilver
        ParentBackground = False
        TabOrder = 6
        object cbCharset: TComboBox
          Left = 8
          Top = 6
          Width = 473
          Height = 33
          Style = csDropDownList
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'UTF8'
          Items.Strings = (
            'UTF8')
        end
      end
      object Panel4: TPanel
        Left = 48
        Top = 371
        Width = 489
        Height = 45
        Color = clSilver
        ParentBackground = False
        TabOrder = 4
        object edSenha: TEdit
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 485
          Height = 37
          Align = alLeft
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          OEMConvert = True
          ParentBiDiMode = False
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 0
          TextHint = 'Digite a senha da sua base de dados'
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          OnExit = edSenhaExit
        end
      end
      object Panel5: TPanel
        Left = 48
        Top = 447
        Width = 489
        Height = 45
        Color = clSilver
        ParentBackground = False
        TabOrder = 5
        object cbDriver: TComboBox
          Left = 8
          Top = 8
          Width = 473
          Height = 33
          Style = csDropDownList
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'PG'
          Items.Strings = (
            'PG')
        end
      end
    end
  end
end
