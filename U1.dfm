object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 271
  ClientWidth = 892
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
    Left = 577
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
    Left = 288
    Top = 31
    Width = 105
    Height = 17
    Caption = 'Czas odswierzania(s)'
    TabOrder = 2
  end
  object EditInterval: TEdit
    Left = 296
    Top = 47
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
    Width = 705
    Height = 160
    Align = alCustom
    DataSource = DataModule1.DataSource2
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
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
        Width = 65
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
        Width = 56
        Visible = True
      end>
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 85
    Width = 113
    Height = 17
    Caption = 'Poka'#380' tylko b'#322#281'dne'
    TabOrder = 6
    OnClick = CheckBox1Click
  end
  object DBGrid1: TDBGrid
    Left = 697
    Top = 0
    Width = 288
    Height = 268
    DataSource = DataModule1.DetailSource
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IMPORT_ORDER_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_NS'
        Visible = True
      end>
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 400
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 100
    Top = 65533
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
