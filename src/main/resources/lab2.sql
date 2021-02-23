# postgresql
-- Lab2
-- 1
-- select "CustomerId", "FirstName", "LastName", "Country" from "Customer" where "Country"!='USA';

-- 2
-- select * from "Customer" where "Country"='Brazil';

-- 3
-- select "FirstName","LastName", "InvoiceId","InvoiceDate","Country" from "Customer", "Invoice" where "Country"='Brazil';

-- 4
-- select * from "Employee" where "Title" like '%Sales%';

-- 5~
-- select DISTINCT "BillingCountry" from "Invoice";
-- select distinct C."LastName", C."FirstName"
-- from "Employee"
--          join "Customer" C
--               on "Employee"."EmployeeId" = C."SupportRepId"
--          join "Invoice" I
--               on C."CustomerId" = I."CustomerId"
-- where "Title" like '%Sales%';
-- 6
-- select "Total",
--        C."FirstName",
--        C."LastName",
--        C."Country",
--        "Title",
--        E."FirstName",
--        E."LastName"
-- from "Invoice"
--          join "Customer" C
--               on "Invoice"."CustomerId" = C."CustomerId"
--          join "Employee" E
--              on C."SupportRepId" = E."EmployeeId"
-- where "Title"  ilike ('%sale%')


# Mysql
-- # 7
-- # select count(InvoiceDate) from invoice
--                                        # where date(InvoiceDate)>='2009/01/01' and date(InvoiceDate)<='2011/01/01';
--
-- # 8
-- # select count(InvoiceId) from invoiceline
--                                      # where InvoiceId=37;
--
-- # 9
-- # select count(InvoiceId) from invoiceline
--                                      # group by InvoiceId
--
--         # 10
-- # select invoiceline.*, Name from invoiceline join track t on t.TrackId = invoiceline.TrackId

