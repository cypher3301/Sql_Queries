# lab3
# 1
# select t.Name, a2.Name, Total, i.*
    # from invoice
               #     join invoiceline i on invoice.InvoiceId = i.InvoiceId
        #     join track t on i.TrackId = t.TrackId
        #     join album a on t.AlbumId = a.AlbumId
        #     join artist a2 on a.ArtistId = a2.ArtistId;

# 2
# select BillingCountry, count(*) as 'number of invoice'  from invoice
                                                                     # group by BillingCountry;

# 3
# select p.PlaylistId, Name, count(*) as 'total number'
# from playlisttrack join playlist p on p.PlaylistId = playlisttrack.PlaylistId
    # group by PlaylistId;

# 4
# select track.Name as '\Имя трека', Title as '\Название альбома', m.Name as 'Формат', g.Name as 'Жанр'
# from track
                                                                                                           #     join genre g on g.GenreId = track.GenreId
    #     join album a on a.AlbumId = track.AlbumId
        #     join mediatype m on m.MediaTypeId = track.MediaTypeId;

# 5~
# select i.InvoiceId,BillingCountry, Total, InvoiceLineId, TrackId, count(i.InvoiceId)
    # from invoice join invoiceline i on invoice.InvoiceId = i.InvoiceId
        # group by i.InvoiceId;


# 6
# select EmployeeId, employee.LastName, employee.FirstName, Title, sum(Total)
    # from employee
               #     inner join customer c on employee.EmployeeId = c.SupportRepId
        #     inner join invoice i on c.CustomerId = i.CustomerId
        # where Title like '%Sale%'
        # group by EmployeeId;

# 7
# select EmployeeId, employee.LastName, employee.FirstName, Title, sum(Total)
    # from employee
               #     inner join customer c on employee.EmployeeId = c.SupportRepId
        #     inner join invoice i on c.CustomerId = i.CustomerId
        # where (date(InvoiceDate) between '2009/01/01' and '2010/01/01')
        # group by EmployeeId
        # order by sum(Total) desc
        # LIMIT 1;

# 8
# select EmployeeId, employee.LastName, employee.FirstName, Title, sum(Total)
    # from employee
               #     inner join customer c on employee.EmployeeId = c.SupportRepId
        #     inner join invoice i on c.CustomerId = i.CustomerId
        # where (date(InvoiceDate) between '2010/01/01' and '2011/01/01')
        # group by EmployeeId
        # order by sum(Total) desc
        # LIMIT 1;

# 9
# select EmployeeId, employee.LastName, employee.FirstName, Title, sum(Total)
    # from employee
               #          inner join customer c on employee.EmployeeId = c.SupportRepId
        #          inner join invoice i on c.CustomerId = i.CustomerId
        # group by EmployeeId
        # order by sum(Total) desc
        # LIMIT 1;

#10
# select EmployeeId, employee.LastName, employee.FirstName, Title, count(CustomerId)
    # from employee inner join customer c on employee.EmployeeId = c.SupportRepId
      # where lower(Title) like '%sale%'
      # group by EmployeeId;