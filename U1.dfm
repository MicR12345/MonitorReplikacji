object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 269
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 761
    Top = 8
    Width = 82
    Height = 25
    Caption = 'Refresh data'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ConfigButton: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Settings'
    TabOrder = 1
    OnClick = ConfigButtonClick
  end
  object StaticText1: TStaticText
    Left = 416
    Top = 8
    Width = 105
    Height = 17
    Caption = 'Czas odswierzania(s)'
    TabOrder = 2
  end
  object EditInterval: TEdit
    Left = 416
    Top = 23
    Width = 83
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Text = '30'
    OnChange = EditIntervalChange
  end
  object AutoRefreshCheckBox: TCheckBox
    Left = 288
    Top = 8
    Width = 105
    Height = 17
    Caption = 'Auto Odswierzanie'
    TabOrder = 4
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 108
    Width = 850
    Height = 161
    Align = alBottom
    DataSource = DataModule1.DataSource2
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Import_Quantity'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Order_Quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D0B1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D0B2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D1B1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D2B2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CorrectWar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IsCorrect'
        Visible = True
      end>
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 552
    Top = 8
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 100
    Top = 65525
    object LinkControlToPropertyEnabled: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = AutoRefreshCheckBox
      Track = True
      Component = Timer1
      ComponentProperty = 'Enabled'
    end
    object LinkControlToPropertyEnabled2: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = AutoRefreshCheckBox
      Track = True
      Component = EditInterval
      ComponentProperty = 'Enabled'
      InitializeControlValue = False
    end
  end
end
