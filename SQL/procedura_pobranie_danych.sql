SET TERM ^ ;
CREATE OR ALTER PROCEDURE NVC_IMPORTY (
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
    D2B2 integer )

AS
declare variable nullvariable integer;
begin
for select IMPORT_ORDER.SESSION as sesion_id,
       cast((extract(year from IMPORT_ORDER.INS_DATE) || '-' || extract(month from IMPORT_ORDER.INS_DATE) || '-' || extract(day from IMPORT_ORDER.INS_DATE)) as date) as session_date,
       count(1) as import_positions_quantity, count(ZAMOWIENIA_SPEC.ZAMOWIENIA_SPEC_ID) AS order_positions_quantity,
       sum(case MANDANT.MANDANT_ID when 1 then 1  else 0 end) as B1,sum(case MANDANT.MANDANT_ID when 2 then 1 else 0 end) AS B2
from IMPORT_ORDER INNER JOIN ZAMOWIENIA_SPEC ON ZAMOWIENIA_SPEC.ZAMOWIENIA_SPEC_ID = IMPORT_ORDER.REF_NS inner join MANDANT ON MANDANT.MANDANT_ID = ZAMOWIENIA_SPEC.MDP
where IMPORT_ORDER.INS_DATE >= 'today' - 31 and
      IMPORT_ORDER.RODZAJ_OPERACJI = 100 and
      IMPORT_ORDER.IMPORTED = 1 and
      IMPORT_ORDER.REF_NS > 0
group by 1, 2
order by 2 desc
rows 10
into SID,SDATE,IPQ,OPQ,D0B1,D0B2 do
begin
execute statement 'select IMPORT_ORDER.SESSION,ZAMOWIENIA_SPEC.MDP,count(ZAMOWIENIA_SPEC.ZAMOWIENIA_SPEC_ID) from IMPORT_ORDER INNER JOIN ZAMOWIENIA_SPEC ON ZAMOWIENIA_SPEC.ZAMOWIENIA_SPEC_ID = IMPORT_ORDER.REF_NS 
inner join MANDANT ON MANDANT.MANDANT_ID = ZAMOWIENIA_SPEC.MDP where ZAMOWIENIA_SPEC.MDP = 1 and IMPORT_ORDER.SESSION='|| :SID ||' group by IMPORT_ORDER.SESSION,ZAMOWIENIA_SPEC.MDP' 
on external DATA SOURCE RTRIM2K(:DB1Connection) 
as user :DB1USER password :DB1Password
into nullvariable,nullvariable,D1B1;
execute statement 'select IMPORT_ORDER.SESSION,ZAMOWIENIA_SPEC.MDP,count(ZAMOWIENIA_SPEC.ZAMOWIENIA_SPEC_ID) from IMPORT_ORDER INNER JOIN ZAMOWIENIA_SPEC ON ZAMOWIENIA_SPEC.ZAMOWIENIA_SPEC_ID = IMPORT_ORDER.REF_NS 
inner join MANDANT ON MANDANT.MANDANT_ID = ZAMOWIENIA_SPEC.MDP where ZAMOWIENIA_SPEC.MDP = 2 and IMPORT_ORDER.SESSION='|| :SID ||' group by IMPORT_ORDER.SESSION,ZAMOWIENIA_SPEC.MDP' 
on external DATA SOURCE RTRIM2K(:DB2Connection) 
as user :DB2USER password :DB2Password
into nullvariable,nullvariable,D2B2;
suspend;
end
end
^
SET TERM ; ^
