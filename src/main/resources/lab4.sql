# # lab 4
# # 1. Provide a query that shows the total sales per country. Which country’s customers spent the most?
# select BillingCountry, sum(Total)
# from invoice
# group by BillingCountry
# order by sum(Total) desc;
#
# # 2. Provide a query that shows the most purchased track of 2013.
# select Name, sum(i.UnitPrice), count(i.TrackId)
# from invoice
#          inner join invoiceline i on invoice.InvoiceId = i.InvoiceId
#          inner join track t on t.TrackId = i.TrackId
# where date(InvoiceDate) between '2013-01-01' and '2014-01-01'
# group by Name
# order by count(i.TrackId) desc , sum(i.UnitPrice)  desc;
#
# # 3. Provide a query that shows the top 5 most purchased tracks over all.
# select Name, sum(i.UnitPrice), count(i.TrackId)
# from invoice
#          inner join invoiceline i on invoice.InvoiceId = i.InvoiceId
#          inner join track t on t.TrackId = i.TrackId
# group by Name
# order by count(i.TrackId) desc , sum(i.UnitPrice)  desc
# limit 5;
#
# # 4. Provide a query that shows the top 3 best selling artists.
# select a2.Name, count(i.TrackId)
# from invoice
#          join invoiceline i on invoice.InvoiceId = i.InvoiceId
#          join track t on t.TrackId = i.TrackId
#          join album a on a.AlbumId = t.AlbumId
#          join artist a2 on a2.ArtistId = a.ArtistId
# group by a2.Name
# order by count(i.TrackId) desc
# limit 3;
#
# # 5. Provide a query that shows the most purchased Media Type.
# select m.Name, count(t.MediaTypeId)
# from invoice
#          join invoiceline i on invoice.InvoiceId = i.InvoiceId
#          join track t on t.TrackId = i.TrackId
#          join mediatype m on m.MediaTypeId = t.MediaTypeId
# group by m.Name
# order by count(t.MediaTypeId) desc;
#
# # 6. Provide a query that shows the number tracks purchased in all invoices that contain more than one genre.
# select count(*)
# from (
#          select count(*)
#          from invoice
#                   inner join invoiceline i on invoice.InvoiceId = i.InvoiceId
#                   inner join track t on i.TrackId = t.TrackId
#          group by Name
#          having count(GenreId) >= 2) as iitc;
