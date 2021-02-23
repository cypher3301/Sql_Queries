# lab 4
# 1
# select BillingCountry, sum(Total) from invoice
# group by BillingCountry
# order by sum(Total) desc;

# 2
# select Name, sum(Total)
# from invoice
#          join invoiceline i on invoice.InvoiceId = i.InvoiceId
#          join track t on t.TrackId = i.TrackId
# where date(InvoiceDate) between '2013-01-01' and '2014-01-01'
# group by Name
# order by sum(Total) desc;

# 3
# select Name, sum(Total)
# from invoice
#          join invoiceline i on invoice.InvoiceId = i.InvoiceId
#          join track t on t.TrackId = i.TrackId
# group by Name
# order by sum(Total) desc
# limit 5;

# # 4
# select a2.Name, sum(Total) from invoice
# join invoiceline i on invoice.InvoiceId = i.InvoiceId
# join track t on t.TrackId = i.TrackId
# join album a on a.AlbumId = t.AlbumId
# join artist a2 on a2.ArtistId = a.ArtistId
# group by a2.Name
# order by sum(total) desc
# limit 3;

# 5
# select m.Name, sum(Total)
# from invoice
#          join invoiceline i on invoice.InvoiceId = i.InvoiceId
#          join track t on t.TrackId = i.TrackId
#          join mediatype m on m.MediaTypeId = t.MediaTypeId
# group by m.Name
# order by sum(total) desc;

# 6
# select Name, count(GenreId) from invoice
# join invoiceline i on invoice.InvoiceId = i.InvoiceId
# join track t on t.TrackId = i.TrackId
# group by Name
# having count(GenreId)>=2;