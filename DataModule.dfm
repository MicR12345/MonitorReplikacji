object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 414
  Width = 608
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'N:\R45.fdb'
    Params.Strings = (
      'sql_dialect=1'
      'user_name=SYSDBA'
      'password=masterkey')
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
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'DESCSID'
        Fields = 
          'SID;Data;Import_Quantity;Order_Quantity;D0B1;D0B2;D1B1;D2B2;Corr' +
          'ectWar;IsCorrect'
        Options = [ixDescending]
      end
      item
        Name = 'ASCSID'
        Fields = 
          'SID;Data;Import_Quantity;Order_Quantity;D0B1;D0B2;D1B1;D2B2;Corr' +
          'ectWar;IsCorrect'
      end>
    IndexName = 'ASCSID'
    Params = <>
    StoreDefs = True
    Left = 440
    Top = 120
    object ClientDataSet1SID: TIntegerField
      FieldName = 'SID'
    end
    object ClientDataSet1Data: TDateTimeField
      FieldName = 'Data'
    end
    object ClientDataSet1Import_Quantity: TIntegerField
      FieldName = 'Import_Quantity'
    end
    object ClientDataSet1Order_Quantity: TIntegerField
      FieldName = 'Order_Quantity'
    end
    object ClientDataSet1D0B1: TIntegerField
      FieldName = 'D0B1'
    end
    object ClientDataSet1D0B2: TIntegerField
      FieldName = 'D0B2'
    end
    object ClientDataSet1D1B1: TIntegerField
      FieldName = 'D1B1'
    end
    object ClientDataSet1D2B2: TIntegerField
      FieldName = 'D2B2'
    end
    object ClientDataSet1CorrectWar: TIntegerField
      FieldName = 'CorrectWar'
    end
    object ClientDataSet1IsCorrect: TIntegerField
      FieldName = 'IsCorrect'
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet1
    Left = 368
    Top = 120
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT p.ID, p.OP,p.REF, p.WAR_IN_DB FROM NVC_WARIANTY (:SID) p;')
    Left = 440
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SID'
        ParamType = ptInput
      end>
    object IBQuery2ID: TIntegerField
      FieldName = 'ID'
      Origin = 'NVC_WARIANTY.ID'
    end
    object IBQuery2OP: TIBStringField
      FieldName = 'OP'
      Origin = 'NVC_WARIANTY.OP'
      Size = 3000
    end
    object IBQuery2REF: TIntegerField
      FieldName = 'REF'
      Origin = 'NVC_WARIANTY.REF'
    end
    object IBQuery2WAR_IN_DB: TIntegerField
      FieldName = 'WAR_IN_DB'
      Origin = 'NVC_WARIANTY.WAR_IN_DB'
    end
  end
  object DetailDataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'ID_ASC'
        Fields = 'SID;IMPORT_ORDER_ID;REF_NS'
      end
      item
        Name = 'ID_DESC'
        Fields = 'SID;IMPORT_ORDER_ID;REF_NS'
        Options = [ixDescending]
      end
      item
        Name = 'REFNS_ASC'
        Fields = 'SID;REF_NS;IMPORT_ORDER_ID'
      end
      item
        Name = 'REFNS_DESC'
        Fields = 'SID;REF_NS;IMPORT_ORDER_ID'
        Options = [ixDescending]
      end
      item
        Name = 'DetailDataSetIndex5'
      end>
    IndexName = 'ID_ASC'
    Params = <>
    StoreDefs = True
    Left = 440
    Top = 224
    object DetailDataSetSID: TIntegerField
      FieldName = 'SID'
    end
    object DetailDataSetIMPORT_ORDER_ID: TIntegerField
      FieldName = 'IMPORT_ORDER_ID'
    end
    object DetailDataSetREF_NS: TIntegerField
      FieldName = 'REF_NS'
    end
  end
  object DetailSource: TDataSource
    DataSet = DetailDataSet
    Left = 368
    Top = 224
  end
end
