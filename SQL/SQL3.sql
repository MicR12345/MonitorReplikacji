SET TERM ^ ;
CREATE OR ALTER PROCEDURE NVC_WARIANTY (
    SID integer )
RETURNS (
    ID integer,
    OP varchar(3000),
    REF integer,
    WAR_IN_DB integer )

AS
begin
FOR select IMPORT_ORDER.IMPORT_ORDER_ID,
IMPORT_ORDER.DLUGI_OPIS,IMPORT_ORDER.REF_NS
from IMPORT_ORDER
where IMPORT_ORDER.SESSION = :SID into ID,OP,REF do 
begin
select count(0)
from IMPORT_ORDER_SPEC
where IMPORT_ORDER_SPEC.IMPORT_ORDER_ID = :ID
into WAR_IN_DB; 
suspend;
end
end
^
SET TERM ; ^