object DBFormConfig: TDBFormConfig
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'DBForm'
  ClientHeight = 359
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 322
    Width = 441
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      441
      37)
    object Button1: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Save'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 356
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DB0Group: TGroupBox
    Left = 8
    Top = 8
    Width = 433
    Height = 89
    Caption = 'Database 0'
    TabOrder = 1
    object DB0UserEdit: TEdit
      Left = 0
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'SYSDBA'
    end
    object StaticText1: TStaticText
      Left = 3
      Top = 16
      Width = 26
      Height = 17
      Caption = 'User'
      TabOrder = 1
    end
    object DB0PasswordEdit: TMaskEdit
      Left = 136
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'masterkey'
    end
    object StaticText2: TStaticText
      Left = 136
      Top = 16
      Width = 50
      Height = 17
      Caption = 'Password'
      TabOrder = 3
    end
    object DB0ConnectionEdit: TEdit
      Left = 272
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'localhost:N:\R45.fdb'
    end
    object StaticText5: TStaticText
      Left = 272
      Top = 16
      Width = 58
      Height = 17
      Caption = 'Connection'
      TabOrder = 5
    end
  end
  object DB1Group: TGroupBox
    Left = 8
    Top = 112
    Width = 433
    Height = 89
    Caption = 'Database 1'
    TabOrder = 2
    object DB1UserEdit: TEdit
      Left = 0
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'SYSDBA'
    end
    object StaticText3: TStaticText
      Left = 3
      Top = 16
      Width = 26
      Height = 17
      Caption = 'User'
      TabOrder = 1
    end
    object DB1PasswordEdit: TMaskEdit
      Left = 136
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'masterkey'
    end
    object StaticText4: TStaticText
      Left = 136
      Top = 16
      Width = 50
      Height = 17
      Caption = 'Password'
      TabOrder = 3
    end
    object DB1ConnectionEdit: TEdit
      Left = 272
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'localhost:N:\R45 - Copy.fdb'
    end
    object StaticText6: TStaticText
      Left = 272
      Top = 16
      Width = 58
      Height = 17
      Caption = 'Connection'
      TabOrder = 5
    end
  end
  object DB2Group: TGroupBox
    Left = 8
    Top = 215
    Width = 433
    Height = 89
    Caption = 'Database 2'
    TabOrder = 3
    object DB2UserEdit: TEdit
      Left = 0
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'SYSDBA'
    end
    object StaticText7: TStaticText
      Left = 3
      Top = 16
      Width = 26
      Height = 17
      Caption = 'User'
      TabOrder = 1
    end
    object DB2PasswordEdit: TMaskEdit
      Left = 136
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'masterkey'
    end
    object StaticText8: TStaticText
      Left = 136
      Top = 16
      Width = 50
      Height = 17
      Caption = 'Password'
      TabOrder = 3
    end
    object DB2ConnectionEdit: TEdit
      Left = 272
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'localhost:N:\R45 - Copy - Copy.fdb'
    end
    object StaticText9: TStaticText
      Left = 272
      Top = 16
      Width = 58
      Height = 17
      Caption = 'Connection'
      TabOrder = 5
    end
  end
end
