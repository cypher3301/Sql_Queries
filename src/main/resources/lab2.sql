# # Lab2
# # 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
# select CustomerId, FirstName, LastName, Country
# from customer
# where Country != 'USA';
#
# # 2. Provide a query only showing the Customers from Brazil.
# select *
# from customer
# where Country = 'Brazil';
#
# # 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table
# # should show the customer’s full name, Invoice ID, Date of the invoice and billing country.
# select FirstName, LastName, InvoiceId, InvoiceDate, Country
# from Customer inner join invoice i on customer.CustomerId = i.CustomerId
# where Country = 'Brazil';
#
# # 4. Provide a query showing only the Employees who are Sales Agents.
# select *
# from Employee
# where lower(Title) like '%sales%';
#
# # 5. Provide a query showing a unique list of billing countries from the Invoice table. ️. Provide a
# # query that shows the invoices associated with each sales agent. The resultant table should
# # include the Sales Agent’s full name.
# select DISTINCT BillingCountry
# from Invoice;
# select employee.FirstName, employee.LastName, Title, i.*
# from employee
#          join customer c on employee.EmployeeId = c.SupportRepId
#          join invoice i on c.CustomerId = i.CustomerId;
#
# # 6. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
# select Total,
#        C.FirstName,
#        C.LastName,
#        C.Country,
#        Title,
#        E.FirstName,
#        E.LastName
# from Invoice
#          join Customer C
#               on Invoice.CustomerId = C.CustomerId
#          join Employee E
#               on C.SupportRepId = E.EmployeeId
# where lower(Title) like lower('%sale%');
# # ilike поиск без учёта регистра в postgresql
#
#
# # 7. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
# select count(InvoiceDate)
# from invoice
# where date(InvoiceDate) >= '2009/01/01'
#   and date(InvoiceDate) <= '2011/01/01';
#
# # 8. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
# select count(InvoiceId)
# from invoiceline
# where InvoiceId = 37;
#
# # 9. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
# select invoice.InvoiceId, count(InvoiceLineId)
# from invoice
#          join invoiceline i on invoice.InvoiceId = i.InvoiceId
# group by invoice.InvoiceId;
# select InvoiceId, count(InvoiceId)
# from invoiceline
# group by InvoiceId;
#
# # 10. Provide a query that includes the track name with each invoice line item.
# select invoiceline.*, Name
# from invoiceline
#          join track t on t.TrackId = invoiceline.TrackId;
#
