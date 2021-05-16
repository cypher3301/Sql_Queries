-- -- lab 4
-- -- 1. Provide a query that shows the total sales per country. Which country’s customers spent the most?
select "BillingCountry", sum("Total")
from "Invoice"
group by "BillingCountry"
order by sum("Total") desc;
-- 92.9

select count(IT."Total"), "FirstName", "LastName", "Country"
from (select "Total", "CustomerId" from "Invoice") as IT
         inner join (select "CustomerId", "FirstName", "LastName", "Country"
         from "Customer") as CU
                    on IT."CustomerId" = CU."CustomerId"
group by "FirstName", "LastName", "Country";
-- 96.2

select "FirstName", "LastName", "Country", count("Total")
from "Customer"
         inner join "Invoice" I on "Customer"."CustomerId" = I."CustomerId"
group by "FirstName", "LastName", "Country";
-- 78,8


-- select "BillingCountry", sum("Total") from "Invoice"
-- where "Total" >= ALL (select "Total" from "Invoice");

-- select sum("Total"), "BillingCountry"
-- from "Invoice" i
-- where i."BillingCountry" = 'USA'
-- group by "BillingCountry";

select "FirstName", "LastName", "Country"
from "Customer"
where "CustomerId" in (select "CustomerId", "Total" from "Invoice");

--
-- -- 2. Provide a query that shows the most purchased track of 2013.
select "Name", sum(i."UnitPrice"), count("Name")
from "Invoice"
         inner join "InvoiceLine" i on "Invoice"."InvoiceId" = i."InvoiceId"
         inner join "Track" t on t."TrackId" = i."TrackId"
where date("InvoiceDate") between '2013-01-01' and '2014-01-01'
group by "Name"
order by count(i."TrackId") desc, sum(i."UnitPrice") desc;

select "Name", sum(i."UnitPrice"), count("Name")
from "Invoice"
         inner join "InvoiceLine" i on "Invoice"."InvoiceId" = i."InvoiceId"
         inner join "Track" t on t."TrackId" = i."TrackId"
where date("InvoiceDate") between '2013-01-01' and '2014-01-01'
group by "Name"
order by count(i."TrackId") desc, sum(i."UnitPrice") desc;

-- postgresql ^


-- select "Name", t."UnitPrice", t."TrackId"
-- from "Track" t
--          join "InvoiceLine" il on t."TrackId" = il."TrackId"
--          join "Invoice" i on il."InvoiceId" = i."InvoiceId"
-- where date("InvoiceDate") between '2013-01-01' and '2014-01-01'
--   and "Name" = 'Eruption'
--
-- -- 3. Provide a query that shows the top 5 most purchased tracks over all.
-- select Name, sum(i.UnitPrice), count(i.TrackId)
-- from invoice
--          inner join invoiceline i on invoice.InvoiceId = i.InvoiceId
--          inner join track t on t.TrackId = i.TrackId
-- group by Name
-- order by count(i.TrackId) desc , sum(i.UnitPrice)  desc
-- limit 5;
-- select "Name", t."UnitPrice", "InvoiceDate", "BillingCity", "CustomerId"
-- from "Track" t
--          join "InvoiceLine" il on t."TrackId" = il."TrackId"
--          join "Invoice" i on il."InvoiceId" = i."InvoiceId"
-- where "Name" = 'The Trooper';
-- -- 4. Provide a query that shows the top 3 best selling artists.
-- select a2.Name, count(i.TrackId)
-- from invoice
--          join invoiceline i on invoice.InvoiceId = i.InvoiceId
--          join track t on t.TrackId = i.TrackId
--          join album a on a.AlbumId = t.AlbumId
--          join artist a2 on a2.ArtistId = a.ArtistId
-- group by a2.Name
-- order by count(i.TrackId) desc
-- limit 3;
-- select *
-- from "Artist"
--          join "Album" A on "Artist"."ArtistId" = A."ArtistId"
--          join "Track" T on A."AlbumId" = T."AlbumId"
--          join "InvoiceLine" IL on T."TrackId" = IL."TrackId"
--          join "Invoice" I on I."InvoiceId" = IL."InvoiceId"
-- where "Artist"."Name" = 'Metallica';
-- -- 5. Provide a query that shows the most purchased Media Type.
-- select m.Name, count(t.MediaTypeId)
-- from invoice
--          join invoiceline i on invoice.InvoiceId = i.InvoiceId
--          join track t on t.TrackId = i.TrackId
--          join mediatype m on m.MediaTypeId = t.MediaTypeId
-- group by m.Name
-- order by count(t.MediaTypeId) desc;
-- select * from "MediaType"
-- join "Track" T on "MediaType"."MediaTypeId" = T."MediaTypeId"
-- join "InvoiceLine" IL on T."TrackId" = IL."TrackId"
-- join "Invoice" I on I."InvoiceId" = IL."InvoiceId"
-- where "MediaType"."Name"='Protected MPEG-4 video file';
-- -- 6. Provide a query that shows the number tracks purchased in all invoices that contain more than one genre.
-- select count(*)
-- from (
--          select count(*)
--          from invoice
--                   inner join invoiceline i on invoice.InvoiceId = i.InvoiceId
--                   inner join track t on i.TrackId = t.TrackId
--          group by Name
--          having count(GenreId) >= 2) as iitc;
