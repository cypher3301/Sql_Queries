# # postgresql
# # Lab2
# # 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
# select "CustomerId", "FirstName", "LastName", "Country"
# from "Customer"
# where "Country" != 'USA';
#
# # 2. Provide a query only showing the Customers from Brazil.
# select *
# from "Customer"
# where "Country" = 'Brazil';
#
# # 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table
# # should show the customer’s full name, Invoice ID, Date of the invoice and billing country.
# select "FirstName", "LastName", "InvoiceId", "InvoiceDate", "Country"
# from "Customer",
#      "Invoice"
# where "Country" = 'Brazil';
#
# # 4. Provide a query showing only the Employees who are Sales Agents.
# select *
# from "Employee"
# where "Title" like '%Sales%';
#
# # 5. Provide a query showing a unique list of billing countries from the Invoice table. ️. Provide a
# # query that shows the invoices associated with each sales agent. The resultant table should
# # include the Sales Agent’s full name.
# select DISTINCT "BillingCountry"
# from "Invoice";
# select distinct C."LastName", C."FirstName"
# from "Employee"
#          join "Customer" C
#               on "Employee"."EmployeeId" = C."SupportRepId"
#          join "Invoice" I
#               on C."CustomerId" = I."CustomerId"
# where "Title" like '%Sales%';
#
# # 6. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
# select "Total",
#        C."FirstName",
#        C."LastName",
#        C."Country",
#        "Title",
#        E."FirstName",
#        E."LastName"
# from "Invoice"
#          join "Customer" C
#               on "Invoice"."CustomerId" = C."CustomerId"
#          join "Employee" E
#               on C."SupportRepId" = E."EmployeeId"
# where "Title" ilike ('%sale%');
# # ilike поиск без учёта регистра в postgresql
#
#
# # Mysql
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
# select count(InvoiceId)
# from invoiceline
# group by InvoiceId;
#
# # 10. Provide a query that includes the track name with each invoice line item.
# select invoiceline.*, Name
# from invoiceline
#          join track t on t.TrackId = invoiceline.TrackId;
#
