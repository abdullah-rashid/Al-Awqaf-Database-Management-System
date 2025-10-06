create database Al_Awqaf 
use Al_Awqaf
drop database Al_Awqaf



-- 1 Create Tables
-- 2 Insert Data into Tables
-- 3 Create Views
-- 4 procedures
-- 5 create users 
-- 6 backup 
-- 7 output validation 
   

----------------------------------------------------------------------------------------





-- Create Tables 


Create Table Mosque (
mosque_id    int  primary key ,
name     varchar(30)   not null ,
city     varchar(30)   not null ,
neighborhood    varchar(40)   not null ,
street     varchar(40)    not null , 
capacity     int , 
housing    varchar(10)  check (housing = 'have' or housing = 'do not have'),
);


Create Table Emam (
emam_SSN     int  primary key ,
Fname     varchar(20)  not null ,
Lname     varchar(20)  not null ,
BOD      date ,
salary   decimal (6,2) ,
marriage   varchar(20)   check(marriage = 'married' or marriage = 'not married') ,
mosque_id     int , 
);


alter table Emam add constraint Emam_fk foreign key (mosque_id) references Mosque 
on update cascade on delete set null 

Create Table Announcement (
Ann_id    int    primary key  ,
date    date  not null ,
description    varchar(200)  not null ,
type_id    int ,
);


Create Table Outside_Job (
job_id    int   primary key ,
date    date not null ,
place   varchar(200)   not null ,
paid	varchar(8)  check (paid = 'paid' or paid = 'not paid' ) ,
type_id    int ,
);

 

Create Table Emam_Phone (
emam_SSN    int ,
emam_phone    int  not null  unique ,
primary key (emam_SSN , emam_phone) ,
);

alter table Emam_Phone add constraint Emam_Phone_fk foreign key (emam_SSN) references Emam 
on update cascade on delete cascade



Create Table Emam_Major (
emam_SSN    int ,
major   varchar(30)  default('islamic law') ,
primary key (emam_SSN , major) ,
);

alter table Emam_Major add constraint Emam_Major_fk foreign key (emam_SSN) references Emam 
on update cascade on delete cascade


Create Table Emam_Job (
emam_SSN    int ,
job_id   int , 
primary key (emam_SSN , job_id) ,
);

alter table Emam_Job add constraint Emam_Job_fk foreign key (emam_SSN) references Emam 
on update cascade on delete cascade

alter table Emam_Job add constraint Emam_Job_fk2 foreign key (job_id) references Outside_Job 
on update cascade on delete cascade


Create Table Emam_Announcements (
emam_SSN  int ,
Ann_id    int ,
primary key (emam_SSN , Ann_id) ,
);

alter table Emam_Announcements add constraint Emam_Announcements_fk foreign key (emam_SSN) references Emam 
on update cascade on delete cascade

alter table Emam_Announcements add constraint Emam_Announcements_fk2 foreign key (Ann_id) references Announcement 
on update cascade on delete cascade






-------------------------------------------------------------------------------------------
--  Table Insertion 



-- Mosque Inserts
INSERT INTO Mosque (mosque_id, name, city, neighborhood, street, capacity, housing)
VALUES 
(1, 'Al-Falah Mosque', 'Amman', 'Al-zhoor', 'Al-Haj Hassan St', 500, 'have'),
(2, 'Al-Rahman Mosque', 'Amman', 'Khalda', 'Al-Bashiti St', 300, 'do not have'),
(3, 'Al-Nour Mosque', 'Irbid', 'Al-Tiba', 'Al-Malkawi St', 450, 'have'),
(4, 'Al-Azhar Mosque', 'Aqaba', 'Al-Disa', 'Al-Ghandoor St', 1000, 'have'),
(5, 'Al-Salam Mosque', 'Zarqaa', 'Al-Zahrawi', 'Al-Faris St', 350, 'do not have'),
(6, 'Al-Tawhid Mosque', 'Amman', 'dabouq', 'Al-Amal St', 600, 'have'),
(7, 'Al-Farouq Mosque', 'Irbid', 'Al-Hikmah', 'Al-Haj Ibrahim St', 200, 'do not have'),
(8, 'Al-Rahim Mosque', 'Jarash', 'Al-Nasim', 'Al-Haram St', 700, 'have'),
(9, 'Al-Huda Mosque', 'Ajloun', 'Halawah', 'Al-Athaar St', 250, 'do not have'),
(10, 'Al-Baraka Mosque', 'Aqaba', 'Wadi-Araba', 'Al-Hamaidah St', 400, 'have');



-- Emam Inserts
INSERT INTO Emam (emam_SSN, Fname, Lname, BOD, salary, marriage, mosque_id)
VALUES 
(1001, 'Ahmed', 'Ali', '1978-05-20', 500.80, 'married', 1),
(1002, 'Mohamed', 'Omar', '1980-08-12', 450.75, 'not married', 2),
(1003, 'Ali', 'Khaled', '1975-03-15', 500.55, 'married', 3),
(1004, 'Yousef', 'Mahmoud', '1982-11-21', 470.20, 'married', 4),
(1005, 'Hassan', 'Ibrahim', '1970-02-27', 520.25, 'not married', 5),
(1006, 'Omar', 'Sami', '1990-07-03', 480.45, 'married', 6),
(1007, 'Khaled', 'Nabil', '1985-12-31', 460.90, 'not married', 7),
(1008, 'Sami', 'Ahmed', '1988-09-10', 510.60, 'married', 8),
(1009, 'Mahmoud', 'Yousef', '1992-04-19', 500.70, 'not married', 9),
(1010, 'Ibrahim', 'Ali', '1977-01-02', 530.20, 'married', 10);



-- Announcement Inserts
INSERT INTO Announcement (Ann_id, date, description, type_id)
VALUES 
(1, '2020-05-10', 'Al-sedek', 1),
(2, '2023-06-15', 'Please visit us to discuss the latest developments of the Qur’an Center and its contents', 2),
(3, '2024-07-20', 'Al-jehad', 1),
(4, '2022-08-05', 'Opening the mosque on curfew days', 3),
(5, '2017-09-10', 'zaqa', 1),
(6, '2016-10-25', 'Please visit us to discuss the latest warning that was taken', 2),
(7, '2024-11-30', 'Using the mosque for purposes outside its scope', 3),
(8, '2024-12-15', 'Departing from the text of the Jomaa pray topic', 3),
(9, '2022-01-10', 'Arqan Al-Islam', 1),
(10, '2021-02-05', 'The importance of Al-Salah', 1);



-- Outside_Job Inserts
INSERT INTO Outside_Job (job_id, date, place, paid, type_id)
VALUES 
(101, '2024-07-04', 'Giving a religious lecture entitled Honesty at Al-Hasad Al-Tarbawi School', 'paid', 1),
(102, '2024-09-09', 'Attending a conference helps integrate electronic development and how to introduce it into mosques', 'not paid', 3),
(103, '2024-08-25', 'Honoring students who have memorized the Qur’an at Al-Tawaboun Mosque', 'paid', 2),
(104, '2024-11-12', 'Traveling to Germany with the aim of arguing with religious leaders', 'not paid', 4),
(105, '2024-08-23', 'Traveling to Malaysia to receive the Imamate in a mosque for a month', 'paid', 4),
(106, '2024-10-13', 'Giving a lecture on youth awareness at Al-Hussein Technical University', 'not paid', 1),
(107, '2024-12-30', 'Attending a conference at Al Hussein Business park that  will provide advanced education on the rules of Tajweed', 'paid', 3),
(108, '2024-07-01', 'Honoring imams who have passed the test of assuming leadership in a mosque', 'not paid', 2),
(109, '2025-01-24', 'Giving a lecture entitled “Pillars of Faith” at Al Maaref School', 'paid', 1),
(110, '2025-02-28', 'Honoring the best Quran reader in the Jordanian Quran Reading Competition', 'not paid', 2);




-- Emam_Phone Inserts
INSERT INTO Emam_Phone (emam_SSN, emam_phone)
VALUES 
(1001, 0790683438),
(1002, 0799892050),
(1003, 0796865843),
(1004, 0790210547),
(1004, 0798745633),
(1005, 0797777788),
(1006, 0798888889),
(1007, 0792000100),
(1007, 0799876543),
(1008, 0796254877),
(1009, 0799999977),
(1010, 0796668888);


-- Emam_Major Inserts
INSERT INTO Emam_Major (emam_SSN, major)
VALUES 
(1001, DEFAULT),
(1002, 'Engineer'),
(1002, 'Sharia'),
(1003, 'Quranic Studies'),
(1004, 'Quranic Studies'),
(1005, 'Islamic Philosophy'),
(1005, 'computer science'),
(1006, 'Quranic Studies'),
(1007, DEFAULT),
(1008, 'Islamic Law'),
(1009, 'Islamic History'),
(1010, 'markiting'),
(1010, 'Islamic Studies');




-- Emam_Job Inserts
INSERT INTO Emam_Job (emam_SSN, job_id)
VALUES 
(1001, 101),
(1001, 103),
(1003, 104),
(1004, 102),
(1005, 102),
(1006, 105),
(1007, 106),
(1008, 107),
(1009, 108),
(1009, 109),
(1009, 110),
(1010, 110);

select * from Emam_Job
DELETE FROM Emam_Job;


-- Emam_Announcements Inserts
INSERT INTO Emam_Announcements (emam_SSN, Ann_id)
VALUES 
(1001, 1),
(1002, 2),
(1002, 4),
(1003, 3),
(1004, 4),
(1005, 5),
(1006, 6),
(1007, 7),
(1007, 1),
(1008, 8),
(1009, 9),
(1010, 4),
(1010, 10);


-----------------------------------------------------------------------------------------


--view tables 



create view Announcement_type_View as
select 
    Ann_id,
    date,
    description,
    case 
        when type_id = 1 then 'Jomaa pray sermon'
        when type_id = 2 then 'Calling'
        when type_id = 3 then 'Warning'
        else 'Unknown'
    end as type_description
from Announcement;

SELECT * FROM [Announcement_type_View];
select * from Announcement





create view Outside_Job_View as
select 
    job_id,
    date,
    place,
    paid,
    case 
        when type_id = 1 then 'Lecture'
        when type_id = 2 then 'Honoring'
        when type_id = 3 then 'Attend a conference'
        when type_id = 4 then 'Travel'
        else 'Unknown'
    end as job_type
from Outside_Job;


SELECT * FROM Outside_Job_View;
select * from Outside_Job






create view Emam_Announcement  as
select E.emam_SSN, E.Fname +' ' +E.Lname as emam_full_name, A.type_id as type_id, atv.type_description as type , A.description as description, A.date
from Emam as E
join Emam_Announcements as EA on E.emam_SSN = EA.emam_SSN
join Announcement as A on EA.Ann_id = A.Ann_id
join Announcement_type_View as atv on atv.Ann_id=A.Ann_id





select * from Emam_Announcement 
select * from Emam_Announcement where emam_SSN = 1001
select * from Emam_Announcement where emam_SSN = 1005
select * from Emam_Announcement where emam_SSN = 1009






create view Emam_outside_job as
select E.emam_SSN, E.Fname +' ' +E.Lname as emam_full_name, O.type_id as type_id, jtv.job_type as type , O.place as description, O.date, O.paid
from Emam as E
join Emam_Job as EJ on E.emam_SSN = EJ.emam_SSN
join Outside_Job as O on EJ.job_id = O.job_id
join Outside_Job_View as jtv on jtv.job_id=O.job_id;


select * from Emam_outside_job 
select * from Emam_outside_job where emam_SSN = 1009
select * from Emam_outside_job where emam_SSN = 1004
select * from Emam_outside_job where emam_SSN = 1006












--------------------------------------------------------------------------------------------------

--procedures




create procedure Insert_Mosque_With_Imam (
@mosque_id int,
@mosque_name varchar(30),
@city varchar(30),
@neighborhood varchar(40),
@street varchar(40),
@capacity int,
@housing varchar(10),
@imam_SSN int,
@imam_Fname varchar(20),
@imam_Lname varchar(20),
@imam_BOD date,
@imam_salary decimal(6,2),
@imam_marriage varchar(20)
)
as
begin

    insert into Mosque (mosque_id, name, city, neighborhood, street, capacity, housing)
    values (@mosque_id, @mosque_name, @city, @neighborhood, @street, @capacity, @housing);
    

    insert into Emam (emam_SSN, Fname, Lname, BOD, salary, marriage, mosque_id)
    values (@imam_SSN, @imam_Fname, @imam_Lname, @imam_BOD, @imam_salary, @imam_marriage, @mosque_id);
end;



exec Insert_Mosque_With_Imam 
    @mosque_id = 11,
    @mosque_name = 'Al-Muhajir Mosque',
    @city = 'Amman',
    @neighborhood = 'Al-Madina Al-Monawwara',
    @street = 'Al-Saraya St',
    @capacity = 400,
    @housing = 'have',
    @imam_SSN = 1011,
    @imam_Fname = 'Abdullah',
    @imam_Lname = 'Ahmad',
    @imam_BOD = '1983-06-10',
    @imam_salary = 480.90,
    @imam_marriage = 'married';


	select * from Emam







create procedure New_Announcement_To_Emam (

@Ann_id int ,
@emam_SSN int ,
@date date ,
@description varchar(200),
@type_id int 
)

as 
begin 

insert into Announcement (Ann_id,date,description,type_id)
values (@Ann_id,@date,@description,@type_id)


insert into Emam_Announcements (emam_SSN, Ann_id)
    values (@emam_SSN, @Ann_id)
end;




exec New_Announcement_To_Emam
    @Ann_id=11,
    @type_id = 1,
    @date = '2024-05-12', 
    @description = 'fastting', 
    @emam_SSN = 1001;


	select * from Emam_Announcements
	select * from Announcement






create procedure New_Job_To_Emam (
@job_id int ,
@emam_SSN int ,
@date date ,
@place varchar(200),
@paid   varchar(8),
@type_id int 
)
as 
begin 
insert into Outside_Job (job_id, date, place, paid, type_id)
values (@job_id, @date, @place, @paid, @type_id)

insert into Emam_Job (emam_SSN, job_id)
values  (@emam_SSN, @job_id)
end;


EXEC New_Job_To_Emam
    @job_id = 111, 
    @emam_SSN = 1005,
    @date = '2024-05-12', 
    @place = 'Giving a lecture on Islamic ethics', 
    @paid = 'paid', 
    @type_id = 1; 



	select * from Emam_Job
	select * from Outside_Job






create procedure Update_Emam_Salary (
    @emam_SSN int,
    @salary decimal(6,2)
)
as
begin
    update Emam
    set salary = @salary
    where emam_SSN = @emam_SSN;
end;


exec Update_Emam_Salary
    @emam_SSN = 1001,
    @salary = 550.00;


	select * from Emam













--------------------------------------------------------------------------------------------------


--create users 



create login Minister with password ='minister123';
create user Mohammad
for login Minister



create login Employee with password ='employee123';
create user Abdullah
for login Employee




create login Emam with password ='emam123';
create user Omar
for login Emam







--privileges 

grant select, insert, update, delete on Mosque to Mohammad
grant select, insert, update, delete on Emam to Mohammad
grant select, insert, update, delete on Announcement to Mohammad
grant select, insert, update, delete on Outside_Job to Mohammad
grant select, insert, update, delete on Emam_Announcements to Mohammad
grant select, insert, update, delete on Emam_Job to Mohammad




grant select, insert on Mosque to Abdullah
grant select, insert, delete on Emam to Abdullah
grant select, insert, update on Announcement to Abdullah
grant select, insert, update on Outside_Job to Abdullah
grant select, insert, update on Emam_Announcements to Abdullah
grant select, insert, update on Emam_Job to Abdullah




grant select on Mosque to Omar
grant select on Emam to Omar
grant select on Announcement to Omar
grant select on Outside_Job to Omar
grant select on Emam_Announcements to Omar
grant select on Emam_Job to Omar



revoke select on Mosque from  Omar;
revoke select on Emam from Omar;
revoke select on Announcement from Omar;
revoke select on Outside_Job from Omar;


grant select on Emam_Announcement to Omar
grant select on Emam_outside_job to Omar







---------------------------------------------------------------------------------------------------

--backup


backup database Al_Awqaf 
to disk ='C:\backups\Al_Awqaf_full.backup';



backup database Al_Awqaf 
to disk ='C:\backups\Al_Awqaf_diff.backup'
with differential;




backup log Al_Awqaf 
to disk ='C:\backups\Al_Awqaf_log.backup';




-----------------------------------------------------------------------------------------------------------------
--output validation 
select emam_SSN, Fname, salary from Emam order by salary desc;
select * from Mosque 
delete from mosque where mosque_id = 3; 
select emam_SSN , Fname , salary from Emam 
update Emam set salary = 450 where emam_SSN  = 1002
select * from Mosque 
INSERT INTO Mosque (mosque_id, name, city, neighborhood, street, capacity, housing)
VALUES 
(3, 'Al-Nour Mosque', 'Irbid', 'Al-Tiba', 'Al-Malkawi St', 450, 'have');












