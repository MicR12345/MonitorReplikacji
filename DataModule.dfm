object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 414
  Width = 608
  object IBDatabase1: TIBDatabase
    LoginPrompt = False
    ServerType = 'IBServer'
    SQLDialect = 1
    Left = 127
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select * FROM NVC_IMPORTY_I_CHECK  (:DB1CONNECTION,:DB1USER,:DB1' +
        'PASSWORD,:DB2CONNECTION,'
      '   :DB2USER, :DB2PASSWORD)')
    UpdateObject = IBUpdateSQL1
    Left = 544
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DB1CONNECTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DB1USER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DB1PASSWORD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DB2CONNECTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DB2USER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DB2PASSWORD'
        ParamType = ptUnknown
      end>
    object IBQuery1SID: TIntegerField
      FieldName = 'SID'
      Origin = 'NVC_IMPORTY_I_CHECK.SID'
    end
    object IBQuery1SDATE: TDateTimeField
      FieldName = 'SDATE'
      Origin = 'NVC_IMPORTY_I_CHECK.SDATE'
    end
    object IBQuery1IPQ: TIntegerField
      FieldName = 'IPQ'
      Origin = 'NVC_IMPORTY_I_CHECK.IPQ'
    end
    object IBQuery1OPQ: TIntegerField
      FieldName = 'OPQ'
      Origin = 'NVC_IMPORTY_I_CHECK.OPQ'
    end
    object IBQuery1D0B1: TIntegerField
      FieldName = 'D0B1'
      Origin = 'NVC_IMPORTY_I_CHECK.D0B1'
    end
    object IBQuery1D0B2: TIntegerField
      FieldName = 'D0B2'
      Origin = 'NVC_IMPORTY_I_CHECK.D0B2'
    end
    object IBQuery1D1B1: TIntegerField
      FieldName = 'D1B1'
      Origin = 'NVC_IMPORTY_I_CHECK.D1B1'
    end
    object IBQuery1D1B2: TIntegerField
      FieldName = 'D1B2'
      Origin = 'NVC_IMPORTY_I_CHECK.D1B2'
    end
    object IBQuery1D2B1: TIntegerField
      FieldName = 'D2B1'
      Origin = 'NVC_IMPORTY_I_CHECK.D2B1'
    end
    object IBQuery1D2B2: TIntegerField
      FieldName = 'D2B2'
      Origin = 'NVC_IMPORTY_I_CHECK.D2B2'
    end
    object IBQuery1B: TIntegerField
      FieldName = 'B'
      Origin = 'NVC_IMPORTY_I_CHECK.B'
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 544
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 504
    Top = 8
  end
  object IBUpdateSQL1: TIBUpdateSQL
    RefreshSQL.Strings = (
      
        'select * FROM NVC_IMPORTY_I_CHECK  (:DB1CONNECTION,:DB1USER,:DB1' +
        'PASSWORD,:DB2CONNECTION,'
      '   :DB2USER, :DB2PASSWORD)'
      'where'
      '  SID = :SID and'
      '  SDATE = :SDATE and'
      '  IPQ = :IPQ and'
      '  OPQ = :OPQ and'
      '  D0B1 = :D0B1 and'
      '  D0B2 = :D0B2 and'
      '  D1B1 = :D1B1 and'
      '  D1B2 = :D1B2 and'
      '  D2B1 = :D2B1 and'
      '  D2B2 = :D2B2 and'
      '  B = :B')
    InsertSQL.Strings = (
      '')
    Left = 464
    Top = 8
  end
end
