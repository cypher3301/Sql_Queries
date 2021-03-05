# # lab3
# # 1. Provide a query that includes the purchased track name AND artist name with each invoice line item.
# select t.Name, a2.Name, Total, i.*
# from invoice
#          join invoiceline i on invoice.InvoiceId = i.InvoiceId
#          join track t on i.TrackId = t.TrackId
#          join album a on t.AlbumId = a.AlbumId
#          join artist a2 on a.ArtistId = a2.ArtistId;
#
# # 2. Provide a query that shows the count of invoices per country. HINT: GROUP BY
# select BillingCountry, count(*) as 'number of invoice'
# from invoice
# group by BillingCountry;
#
# # 3. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.
# select p.PlaylistId, Name, count(*) as 'total number'
# from playlisttrack
#          join playlist p on p.PlaylistId = playlisttrack.PlaylistId
# group by PlaylistId;
#
# # 4 Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre
# select track.Name as '\Имя трека', Title as '\Название альбома', m.Name as 'Формат', g.Name as 'Жанр'
# from track
#          join genre g on g.GenreId = track.GenreId
#          join album a on a.AlbumId = track.AlbumId
#          join mediatype m on m.MediaTypeId = track.MediaTypeId;
#
# # 5 Provide a query that shows all Invoices but includes the count of invoice line items.
# select InvoiceId, count(InvoiceLineId)
# from invoiceline
# group by InvoiceId;
#
# # 6. Provide a query that shows total sales made by each sales agent.
# select EmployeeId, employee.LastName, employee.FirstName, Title, sum(Total)
# from employee
#          inner join customer c on employee.EmployeeId = c.SupportRepId
#          inner join invoice i on c.CustomerId = i.CustomerId
# where Title like '%Sale%'
# group by EmployeeId;
#
# # 7. Which sales agent made the most in sales in 2009?
# select EmployeeId, employee.LastName, employee.FirstName, Title, sum(Total)
# from employee
#          inner join customer c on employee.EmployeeId = c.SupportRepId
#          inner join invoice i on c.CustomerId = i.CustomerId
# where (date(InvoiceDate) between '2009/01/01' and '2010/01/01')
# group by EmployeeId
# order by sum(Total) desc
# LIMIT 1;
#
# # 8. Which sales agent made the most in sales in 2010?
# select EmployeeId, employee.LastName, employee.FirstName, Title, sum(Total)
# from employee
#          inner join customer c on employee.EmployeeId = c.SupportRepId
#          inner join invoice i on c.CustomerId = i.CustomerId
# where (date(InvoiceDate) between '2010/01/01' and '2011/01/01')
# group by EmployeeId
# order by sum(Total) desc
# LIMIT 1;
#
# # 9. Which sales agent made the most in sales over all?
# select EmployeeId, employee.LastName, employee.FirstName, Title, sum(Total)
# from employee
#          inner join customer c on employee.EmployeeId = c.SupportRepId
#          inner join invoice i on c.CustomerId = i.CustomerId
# group by EmployeeId
# order by sum(Total) desc
# LIMIT 1;
#
# # 10. Provide a query that shows the count of customers assigned to each sales agent.
# select EmployeeId, employee.LastName, employee.FirstName, Title, count(CustomerId)
# from employee
#          inner join customer c on employee.EmployeeId = c.SupportRepId
# where lower(Title) like '%sale%'
# group by EmployeeId;