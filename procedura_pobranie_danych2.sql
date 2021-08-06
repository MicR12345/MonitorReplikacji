SET TERM ^ ;
CREATE OR ALTER PROCEDURE NVC_IMPORTY_I_CHECK (
    DB1CONNECTION varchar(512),
    DB1USER varchar(255),
    DB1PASSWORD varchar(255),
    DB2CONNECTION varchar(512),
    DB2USER varchar(255),
    DB2PASSWORD varchar(255) )
RETURNS (
    SID integer,
    SDATE timestamp,
    IPQ integer,
    OPQ integer,
    D0B1 integer,
    D0B2 integer,
    D1B1 integer,
    D2B2 integer,
    B integer )

AS
declare variable nullvariable integer;
begin
for select NVC_IMPORTY.SID,NVC_IMPORTY.SDATE,NVC_IMPORTY.IPQ,NVC_IMPORTY.OPQ,NVC_IMPORTY.D0B1,NVC_IMPORTY.D0B2,NVC_IMPORTY.D1B1,NVC_IMPORTY.D2B2,(case 
when NVC_IMPORTY.OPQ<NVC_IMPORTY.IPQ then 0 
when NVC_IMPORTY.D1B1<NVC_IMPORTY.D0B1 then 0 
when NVC_IMPORTY.D2B2<NVC_IMPORTY.D0B2 then 0
else 1 end)
 from NVC_IMPORTY(:DB1Connection,:DB1User,:DB1Password,:DB2Connection,:DB2User,:DB2Password)
into SID,SDATE,IPQ,OPQ,D0B1,D0B2,D1B1,D2B2,B do
begin
suspend;
end
end
^
SET TERM ; ^