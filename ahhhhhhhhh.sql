#completed insertions - genre, manager, bookstore, author, book, book_author, book_genre, phonenumbers, best sellers
#incomplete insertions - sales

ALTER TABLE author MODIFY author_address VARCHAR(100);
ALTER TABLE book MODIFY book_spelling VARCHAR(10);
DROP TABLE book_has_author;
DROP TABLE book_has_genre;

INSERT INTO genre (genre_name) VALUES ('Young Adult'), ('Fantasy'), ('Comedy');
INSERT INTO genre (genre_name) VALUES ('Science Fiction'), ('Thriller'), ('Romance');

INSERT INTO manager (manager_FName,manager_LName) VALUES ('John', 'Brown'), ('Mark', 'Smith'), ('David', 'Davidson');

INSERT INTO bookstore (bookstore_name,bookstore_address,bookstore_email,bookstore_phone) VALUES ('WHSmith', '171 Some Road, Somewhere, UK, SW11 2UK', 'contactus@whsmith.com', '0800 124 419'),
('Waterstones', '5 Another Road, Everywhere, UK, EW1 5UK', 'contact@waterstones.co.uk', '0800 821 192');

INSERT INTO author (Manager_manager_id,author_FName,author_LName,author_DOB,author_Address,author_email) VALUES (1, 'Stephen', 'King', 1965-08-24, 'Undisclosed', 'king@stephenking.com'), 
(3, 'Jane', 'Doe', 1985-03-19, '25 Summer Street, Manchester, UK, M23 1RR', 'janedoe@live.co.uk'),
(2, 'Kate', 'Genova', 1994-11-15, '8 Hester Road, Portsmouth, UK, PO5 3LR', 'ekg@googlemail.com'),
(1, 'Jack', 'Breacher', 1990-01-01, '25 Accurate Road, Dover, UK, D12 3UP', 'jbreacher@hotmail.co.uk'),
(2, 'Holly', 'McCasker', 1979-05-05, 'Special apartment, Apartment road, London, SW24 1DP','hmccasker@googlemail.com');

INSERT INTO book (book_title,book_length,book_release,book_status,book_start,book_spelling,book_price) VALUES ('Funny Book', 240, '2008-10-15', 'published', '2007-10-29', 'checked', 6.99),
('Serious Book', 189, '2010-05-23', 'published', '2010-01-05', 'checked', 8.99),
('Another serious book', 210, '2015-04-20', 'published', '2014-08-24', 'checked', 10.99),
('Romantic book', 160, null, 'in progress', '2017-12-14', 'unchecked', null),
('Recent book', 114, '2018-05-06', 'published', '2016-04-10', 'checked', 10.99),
('Another recent book', 304, '2018-05-16', 'published', '2017-09-05', 'checked', 10.99),
('Another romantic book', 200, '2018-08-10', 'completed', '2018-02-04', 'unchecked', null),
('Best book ever', 173, '2006-10-10', 'published', '2004-12-27', 'checked', 6.99);

INSERT INTO book_has_author (Book_book_id,Author_author_id) VALUES (1,5), (2,1), (3,1), (4,5),(5,3),(6,2),(7,4),(8,4);

INSERT INTO book_has_genre (Book_book_id,Genre_genre_id) VALUES (1,3),(2,1),(2,2),(3,5),(4,6),(5,6),(6,4),(6,2),(7,4),(7,1),(8,6);

INSERT INTO phonenumbers (Author_author_id,phone_number) VALUES (1, '08148291914'),(1,'0512814992'),(2,'0780918913'),(3,'0989818182'),(4, '0773299199'), (5, '0131499150'), (6, '01821251251');

INSERT INTO best_sellers (Book_book_id,month,year) VALUES (2, 06, 2010), (8,11,2006), (3,05,2015);

INSERT INTO sales (Book_book_id,sales_quantity,BookStore_bookstore_id) VALUES (1, 1999, 1), (1, 2441,2), (1,500,1), (1,420, 2), (2, 2191, 1), (2,800,2),(3,300,2),(5,1500,1),(5,400,2),(6,999,2),(6,299,1),(8,1700,1),(8,1899,2),(8,459,1); 


Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
(`bpc`.`book_has_author`, CONSTRAINT `fk_Book_has_Author_Author1` FOREIGN KEY (`Author_author_id`) 
REFERENCES `author` (`author_id`) ON DELETE NO ACTION ON UPDATE NO ACTION)
