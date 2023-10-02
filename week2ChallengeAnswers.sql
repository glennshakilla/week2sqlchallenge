CREATE DATABASE stud_db;



CREATE TABLE personal_details (
national_ID Int , 
stud_ID VARCHAR(15),
stud_name VARCHAR(100),
phone_number VARCHAR(15),
age INTEGER, gender VARCHAR(10),
PRIMARY KEY(national_ID) );

INSERT INTO personal_details (national_ID,stud_ID,stud_name,phone_number,age,gender)
VALUES('344534','stud101','Hermione Granger' ,'0712345678','20','Male'),
('379683','stud102','Draco Malfo' ,'0723456781','21','Female'),
('347403','stud103','Jayden Wamashati' ,'0734567812','22','Male'),
('377302','stud104','Ron Weasley' ,'0745678123','19','Female'),
('336741','stud105','Dolores Umbridge' ,'0756781234','21','Male'),
('307243','stud106','Hedwig Tonks' ,'0767812345','21','Female'),
('310932','stud107','Chao Chang' ,'0778123456','22','Male'),
('343920','stud108','Curfew Yaeitpm' ,'0781234567','20','Female'),
('345261','stud109','Chaptr Mukenya' ,'0722345678','20','Male'),
('339152','stud110','Natalie Mpema' ,'0733456781','21','Female'),
('339746','stud111','Crew Nundi' ,'0744567812','20','Male'),
('336373','stud112','Bandi Kagunda' ,'0755678123','22','Female'),
('325252','stud113','Testimony Omolo' ,'0766456781' ,'21','Male'),
('321746','stud114','Career Mpya' ,'0741367812','20','Male'),
('390234','stud115','Deamon Anduro','0744421123','22','Female');

 ------------------------------------------------------------------------------------------

CREATE TABLE school_details(stud_ID VARCHAR(15), current_home_county VARCHAR(20), 
secondary_school_county VARCHAR(20), residence VARCHAR(15), stud_email VARCHAR(50),
PRIMARY KEY (stud_ID)  );

INSERT INTO school_details(stud_ID)
SELECT stud_ID
FROM personal_details;

UPDATE school_details 
SET stud_email = (SELECT CONCAT(REPLACE (stud_name,' ','') ,'@zinduaschool.ac')
					FROM personal_details
					WHERE school_details.stud_ID = personal_details.stud_ID
insert into school_details ( current_home_county, 
secondary_school_county, residence,stud_ID )
values('Nakuru', 'Nairobi', 'In school', 'stud101' ),
('Nairobi', 'Nakuru','In school','stud102'),
('Samburu', 'Nairobi', 'Out of school','stud103'),
('Kericho','Nairobi','In school' ,'stud104'),
('Nyamira','Nakuru','In school','stud105'),
('Kisumu','Nairobi','Out of school','stud106'),
('Nakuru', 'Nairobi', 'Out of school','stud107'),
('Kisumu', 'Mombasa','Out of school','stud108'),
('Kericho','Mombasa', 'In school' ,'stud10'),
('Nakuru', 'Mombasa', 'In school' ,'stud110'),
('Kiambu','Turkana', 'In school' ,'stud111'),
('Nairobi', 'Nakuru', 'In school','stud112'),
('Samburu', 'Taita Taveta','In school','stud113'),
('Kericho', 'Nairobi','Out of school' ,'stud114'),
('Kiambu', 'Mombasa', 'In school' ,'stud115');
select*from school_details
 ------------------------------------------------------------------------------------------
 drop table contact_details
CREATE TABLE contact_details (stud_id varchar(15),stud_email VARCHAR(50) , phone_number VARCHAR(15), next_of_kin_name VARCHAR(50),next_of_kin_relation VARCHAR(10), next_of_kin_contacts VARCHAR(13) );
INSERT INTO contact_details(stud_id ,phone_number, next_of_kin_name,next_of_kin_relation,next_of_kin_contacts)
VALUES('stud101','0712345678','Darius Young','Father','0782382383'),
('stud102','0723456781','Lucy Nderitu','Mother','0723238983'),
('stud103','0734567812','Jerotich Koech','Mother','0779343126'),
('stud104','0745678123','Mwaura Mwangi','Father','0798246347'),
('stud105','0745678123','Mwaura Mwangi','Father','0798246347'),
('stud106','0756781234','Ian Patrick','Father','0711234453'),
('stud107','0767812345','Lebron James','Father','0765439233'),
('stud108','0778123456','Magna Carter','Father','0702526243'),
('stud109','0781234567','Cindy Wayne','Mother','0747282839'),
('stud110','0722345678','Farah Maalim','Mother','0753927482'),
('stud111','073345678','Faiba Mbugua','Father','0713245748'),
('stud112','0744567812','John Doe','Father','0725737383'),
('stud113','0755678123','Klaus Michealson','Father','0789346276'),
('stud114','0766456781','Suluhu Amdany','Mother','0785739259'),
('stud115','0741367812','Daisy Auma','Mother','0791344537'),
('stud116','0755421123','Getrude Karen','Mother','0765748244');
select *from contact_details


UPDATE contact_details
SET stud_email = (SELECT school_details.stud_email
FROM school_details, personal_details
WHERE school_details.stud_ID = personal_details.stud_ID 
AND personal_details.phone_number = contact_details.phone_number);

ALTER TABLE contact_details
add stud_email VARCHAR(50) PRIMARY KEY ;

# ------------------------------------------------------------------------------------------

CREATE TABLE financial_details (stud_ID VARCHAR(15) ,stud_name VARCHAR(30) ,
sem_fee INT , fee_paid INT)

INSERT INTO financial_details(stud_ID,stud_name)
SELECT personal_details.stud_ID, personal_details.stud_name
FROM personal_details;
insert into financial_details (sem_fee,fee_paid,stud_ID)
values( 25000, 25000 , 'stud101'),
( 25000, 19000 , 'stud102'),
( 21900, 20000 ,'stud103'),
( 22000, 22000 , 'stud104'),
( 25000, 23400 , 'stud105'),
( 25000,27000, 'stud106'),
( 24230, 21200 , 'stud107'),
( 25000, 23500 , 'stud108'),
(25000, 24500 , 'stud109')
insert into financial_details ( sem_fee, stud_ID)
values( 25000, 'stud110'),
( 26000,'stud111'),
( 25000,  'stud112'),
( 25000,  'stud113'),
( 19000,'stud114'),
( 20800, 'stud115')
 
 select*from financial_details



--WEEK2 CHALLENGE QUESTIONS QUERIES
select*from contact_details
select*from personal_details order by stud_ID


select P.stud_name,P.stud_id,C.stud_email,C.phone_number into new_stud_details 
from personal_details as P
inner join contact_details as C
on P.stud_ID=C.stud_id

select*from new_stud_details --new table

select * from personal_details
select * from school_details
select *from contact_details
select*from financial_details

select F.stud_name,F.sem_fee,F.fee_paid,C.stud_id,C.stud_email,
phone_number,next_of_kin_name,next_of_kin_contacts,next_of_kin_relation,
S.current_home_county,S.secondary_school_county,S.residence into full_stud_details from 
( financial_details F join contact_details C on F.stud_ID =C.stud_id)
join school_details S on F.stud_ID=S.stud_ID --putting all detail from contacts,school and finance in one table

select * from full_stud_details


select*from financial_details----student name column is empty
select* from personal_details

insert into financial_details (stud_name) --inserting names into financial details table
select stud_name from personal_details 
where stud_ID =101

alter table financial_details
add fee_cleared varchar(20)


select*from financial_details order by sem_fee --thus
UPDATE financial_details SET fee_cleared = 'true' WHERE fee_paid > 26000
UPDATE financial_details SET fee_cleared = 'false' WHERE fee_paid <26000

SELECT COUNT(ProductID)
FROM Products
WHERE Price > 20;

select*from personal_details
select*from school_details
 --Count of male and female on different columns

SELECT secondary_school_county ,(
        Select COUNT(Gender)      --to have different columns i have to select the cont gender as two different columns
        from personal_details
        where gender = 'Male' ) as 'Total Male',
		(Select COUNT(Gender)
        from personal_details
        where gender = 'Female') as 'Total Female'
FROM school_details
GROUP by secondary_school_county


--finding kin percentage
select*from contact_details

select 
case when next_of_kin_name ='Mother'
then 'Mother' else 'Falther'
end as Next_Of_Kin_name,
count(*) As TheTotal,
ROUND(count(next_of_kin_name)/(select count(next_of_kin_name) from contact_details)*100,2) as Total_Percentage

from contact_details group by next_of_kin_name


SELECT next_of_kin_relation ,(
        Select COUNT(next_of_kin_relation)      
        from contact_details
        where next_of_kin_relation = 'Father' ) as 'Father',
		(Select COUNT(next_of_kin_relation)
        from contact_details
        where next_of_kin_relation = 'Mother') as 'Mother',
	(SUM(next_of_kin_relation) - SUM('father'))/SUM(next_of_kin_relation)*100 As ThePercentageMother
FROM contact_details
GROUP by next_of_kin_relation ----Not able to solve