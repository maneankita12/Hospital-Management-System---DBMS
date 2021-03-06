drop table jobtype cascade constraints;
drop table staff cascade constraints;
drop table patient cascade constraints;
drop table Room cascade constraints;
drop table prescription cascade constraints;
drop table test cascade constraints;
drop table insurance cascade constraints;
drop table patient_record cascade constraints;


create table jobtype
(
J_id varchar2(20) primary key not null,
J_name varchar(25) not null,
Qualification varchar2(40)
);


create table staff
(
S_id varchar2(20) primary key,
S_Fname varchar2(20),
S_Mname varchar2(20),
S_Lname varchar2(20),
S_PH_NO varchar2(20),
S_DOJ date,
S_YOE int,
S_Adrress varchar2(60),
S_Salary varchar2(10),
SHIFT varchar2(10),
J_id varchar2(20),
foreign key (j_id) references jobtype(j_id)
);

create table insurance
(
i_id number primary key,
i_name varchar2(120),
i_ph_no varchar2(120),
c_address varchar2(140),
i_amount int
);


CREATE TABLE Patient(
   P_ID int primary key,
   P_Fname varchar2(255),
   P_Mname varchar2(255),
   P_Lname varchar2(255),
   P_Type varchar2(255),
   P_PH_NO varchar2(100),
   P_EMAIL_ID varchar2(255),
   P_AGE varchar2(50),
   P_Address  varchar2(255),
   P_Gender varchar2(255),
   i_id number,
   foreign key (i_id) references insurance(i_id)
);

CREATE TABLE prescription(
  PR_ID number primary key,
  Med_name varchar2(255) default NULL,
  PR_DOSE varchar2(50) default NULL,
  PR_DATE varchar2(255),
  PR_QUANTITY varchar2(50) default NULL,
  Diagnosis varchar2(255) default NULL,
  S_id varchar2(20),
  P_ID int,
  foreign key (S_id) references staff(S_id),
  foreign key (P_ID) references patient(P_ID)
);


create table test(
T_id int,
T_name varchar(120),
T_date date,
TR_date date,
T_amt int,
primary key(T_id),
S_id varchar2(20),
foreign key (S_id) references staff(S_id),
PR_ID number,
foreign key (PR_ID) references prescription(PR_ID)
);


CREATE TABLE Room (
  R_NO number PRIMARY KEY,
  R_PH_NO varchar2(100),
  R_TYPE varchar2(255) ,
  R_FloorNO varchar2(50) ,
  No_Of_Beds varchar2(50) ,
  S_id varchar2(20),
  foreign key (S_id) references staff(S_id)
);



create table patient_record
(
rec_id varchar2(20) primary key,
admit_date date,
discharge_date date,
in_status varchar2(20),
amount int,
bed_no int,
R_NO number,
foreign key (R_NO) references Room(R_NO),
P_ID int,
foreign key (P_ID) references Patient(P_ID)
);

select * from patient_record;
commit;

insert into jobtype values('jb01','Physician','M.B.B.S');
insert into jobtype values('jb02','Nurse','BSc Nursing');
insert into jobtype values('jb03','Pediatrician','M.D/D.O');
insert into jobtype values('jb04','Ophthalmologist','PG in opthalmology');
insert into jobtype values('jb05','Surgeon','MS-general surgery');
insert into jobtype values('jb06','Anthropologist','BS in anthropology');
insert into jobtype values('jb07','Lab technician','BMLT');
insert into jobtype values('jb08','Radiologist','M.B.B.S');
insert into jobtype values('jb09','Ward boy','12th pass');
insert into jobtype values('jb10','Gynaecologist','MS in gynaecology and obstetrics');
insert into jobtype values('jb11','Receptionist','12th pass');


INSERT INTO staff VALUES ('S01','Malcolm','Josiah','Schultz','+91 3949196266','11/Feb/2021',9,'P.O. Box 825, 7242 Gravida St.','6000','Day','jb02');
INSERT INTO stafF VALUES ('S02','Jaquelyn','Sylvester','Atkinson','+91 0711128283','06/Aug/2019',3,'7928 Risus, Avenue','5597','Day','jb02');
INSERT INTO staff VALUES ('S03','Molly','Marvin','Deleon','+91 8713918072','11/May/2018',4,'P.O. Box 503, 8958 Purus. Av.','7288','Day','jb02');
INSERT INTO staff VALUES ('S04','Rebekah','Clarke','Cole','+91 6376752116','04/Mar/2014',1,'4842 Donec Rd.','9410','Day','jb02');
INSERT INTO stafF VALUES ('S05','Deacon','Raphael','Ray','+91 3060550543','29/Jun/2019',3,'4929 Duis Avenue','6423','Day','jb09');
INSERT INTO staff VALUES ('S06','Abigail','Herman','Decker','+91 7185153432','24/May/2020',1,'Ap #284-4216 Pede, Ave','4984','Day','jb09');
INSERT INTO staff VALUES ('S07','Jerome','Ray','Cole','+91 8448924570','10/Sep/2012',3,'Ap #730-4725 Aliquam Rd.','5904','Day','jb09');
INSERT INTO staff VALUES ('S08','Sara','Tad','Lindsey','+91 2752303200','01/May/2022',10,'Ap #277-9935 Velit. Rd.','9024','Day','jb09');
INSERT INTO staff VALUES ('S09','Xanthus','Cadman','Hester','+91 5505092993','17/Oct/2020',8,'P.O. Box 441, 9283 Pellentesque Ave','6968','Night','jb02');
INSERT INTO staff VALUES ('S10','Sybil','Ferdinand','Bishop','+91 1897852426','01/May/2021',6,'Ap #370-6242 Phasellus Rd.','6740','Night','jb02');
INSERT INTO staff VALUES ('S11','Noble','Logan','Conrad','+91 1186452666','30/Mar/2011',4,'5579 In Rd.','5814','Night','jb02');
INSERT INTO staff VALUES ('S12','Vielka','Peter','Love','+91 2822103322','22/Apr/2016',5,'4291 Dictum St.','9189','Night','jb02');
INSERT INTO staff VALUES ('S13','Wesley','Cullen','Ballard','+91 9223629314','26/Nov/2018',4,'Ap #129-8422 Dis Avenue','5617','Night','jb09');
INSERT INTO staff VALUES ('S14','Ruth','Nissim','Bird','+91 1644906004','06/Feb/2021',6,'9785 Mauris. Road','7648','Night','jb09');
INSERT INTO staff VALUES ('S15','Warren','Ethan','Hammond','+91 0582039835','21/Jul/2021',9,'Ap #267-5590 Id Road','4795','Night','jb09');
INSERT INTO staff VALUES ('S16','Laura','Philip','Hood','+91 0232108566','03/Feb/2013',5,'5722 Proin Road','9144','Night','jb09');
INSERT INTO staff VALUES ('S17','Margaret','Igor','Knox','+91 4019880928','12/Dec/2010',3,'Ap #998-161 Dui Street','6110','Day','jb07');
INSERT INTO staff VALUES ('S18','Tanisha','Tobias','Rosales','+91 4955265769','30/Mar/2014',9,'Ap #616-8872 Adipiscing St.','30851','Day','jb07');
INSERT INTO staff VALUES ('S19','Micah','Salvador','Hoffman','+91 4261147012','11/Sep/2019',5,'4808 Dolor, St.','40005','Day','jb07');
INSERT INTO staff VALUES ('S20','Noble','Hayden','Sullivan','+91 6175449455','28/Sep/2020',10,'837-4606 Eu, Avenue','45503','Day','jb07');
INSERT INTO staff VALUES ('S21','Kelsie','Martin','Crawford','+91 0027143740','23/Nov/2019',5,'P.O. Box 655, 8915 Ligula Av.','36287','Day','jb07');
INSERT INTO staff VALUES ('S22','Urielle','Kennedy','Wilkinson','+91 3453265652','31/May/2013',4,'Ap #614-4503 Aliquam St.','42253','Day','jb08');
INSERT INTO staff VALUES ('S23','Ursula','Reece','Morales','+91 7977053124','05/Jan/2020',4,'P.O. Box 385, 5168 Neque Ave','39285','Day','jb08');
INSERT INTO staff VALUES ('S24','Scott','Kenneth','Albert','+91 9747983468','10/Sep/2011',2,'P.O. Box 115, 7974 Elit. Rd.','32916','Day','jb08');
INSERT INTO staff VALUES ('S25','Shaeleigh','Jacob','Taylor','+91 0067024946','24/Jul/2017',9,'6088 Suspendisse Street','33641','Day','jb08');
INSERT INTO staff VALUES ('S26','Rebekah','Raja','Kirk','+91 9876882416','11/Nov/2010',5,'Ap #953-4460 Orci. St.','30531','Day','jb08');
INSERT INTO staff VALUES ('S27','Cleo','Caesar','Hines','+91 7549345428','30/Jun/2011',4,'P.O. Box 799, 4407 Elit, St.','66036','Day','jb01');
INSERT INTO staff VALUES ('S28','Dustin','Patrick','Rodriquez','+91 2793443129','14/Oct/2016',5,'897 Sagittis Road','75387','Day','jb01');
INSERT INTO staff VALUES ('S29','Cadman','Micah','Hess','+91 8748794384','17/Mar/2016',3,'7053 Nisi St.','71152','Day','jb01');
INSERT INTO staff VALUES ('S30','Chaim','Cairo','Kelley','+91 3692345962','10/Nov/2018',3,'142-8626 Malesuada Avenue','65524','Night','jb01');
INSERT INTO staff VALUES ('S31','Emerald','Rajah','Perry','+91 8834283913','15/Aug/2014',6,'8669 Nunc Street','75338','Night','jb01');
INSERT INTO staff VALUES ('S32','Oscar','Christian','Rojas','+91 0102124632','26/Jul/2021',7,'Ap #907-6050 Dignissim Rd.','125000','Day','jb10');
INSERT INTO staff VALUES ('S33','Palmer','Hammett','Stephenson','+91 3244546136','22/Aug/2016',3,'P.O. Box 804, 5197 Sociosqu Ave','140500','Day','jb10');
INSERT INTO staff VALUES ('S34','Basil','Barclay','Huber','+91 6508179851','24/Sep/2020',7,'P.O. Box 737, 6132 At, St.','112500','Night','jb10');
INSERT INTO staff VALUES ('S35','Zeph','Ivan','Molina','+91 9857201104','04/Jan/2016',8,'Ap #324-1867 Massa. Avenue','150806','Day','jb03');
INSERT INTO staff VALUES ('S36','Nola','Hu','Todd','+91 0067576875','29/May/2019',2,'Ap #403-9240 Aliquet Ave','126708','Day','jb04');
INSERT INTO staff VALUES ('S37','Hayden','Jesse','Fulton','+91 6390590663','14/Jun/2016',10,'P.O. Box 467, 9281 Tellus. St.','250903','Day','jb05');
INSERT INTO staff VALUES ('S38','MacKenzie','Vernon','Savage','+91 1629511002','09/May/2011',6,'Ap #931-1975 Cras Rd.','120289','Day','jb06');
INSERT INTO staff VALUES ('S39','Forrest','Thane','Mayer','+91 2233505323','04/Oct/2015',5,'P.O. Box 270, 7244 Rhoncus. St.','125358','Day','jb03');
INSERT INTO staff VALUES ('S40','Kylan','Francis','Payne','+91 5384674856','02/Jul/2020',6,'Ap #444-7086 Mollis. Avenue','250800','Day','jb05');
INSERT INTO staff VALUES ('S41','Nora','H','Kane','+91 0257576875','17/Aug/2019',2,'Ap #403-9240 Aliquet Ave','22708','Day','jb11');
INSERT INTO staff VALUES ('S42','Harry','Jerry','Flee','+91 8579590663','14/July/2016',10,'P.O. Box 467, 9281 Tellus. St.','20903','Day','jb11');
INSERT INTO staff VALUES ('S43','Marry','Vernon','Salva','+91 1458511002','09/Dec/2011',6,'Ap #931-1975 Cras Rd.','22289','Day','jb11');
INSERT INTO staff VALUES ('S44','Martha','Tori','Vega','+91 2237789323','09/Oct/2015',5,'P.O. Box 270, 7244 Rhoncus. St.','18358','Day','jb11');
INSERT INTO staff VALUES ('S45','Sam','Sun','Ki','+91 5388526856','02/Sep/2020',6,'Ap #444-7086 Mollis. Avenue','20800','Day','jb11');




INSERT INTO Room VALUES (1,'+91 5606908903','Waiting room',1,null,null);
INSERT INTO Room VALUES (2,'+91 1891299590','Waiting room',2,null,null);
INSERT INTO Room VALUES (3,'+91 8586796491','StoreRoom',3,null,null);
INSERT INTO Room VALUES (4,'+91 1835313224','Office',1,null,'S41');
INSERT INTO Room VALUES (5,'+91 3320815184','Office',1,null,'S42');
INSERT INTO Room VALUES (6,'+91 8279740858','dispensary',1,null,null);
INSERT INTO Room VALUES (7,'+91 1311253377','Office',2,null,'S43');
INSERT INTO Room VALUES (8,'+91 1940785190','Office',2,null,'S44');
INSERT INTO Room VALUES (9,'+91 7458486469','StoreRoom',3,null,null);
INSERT INTO Room VALUES (10,'+91 6989243180','Rest room',2,5,'S05');
INSERT INTO Room VALUES (11,'+91 9794650595','ICU',7,1,'S01');
INSERT INTO Room VALUES (12,'+91 4904048711','ICU',10,4,'S02');
INSERT INTO Room VALUES (13,'+91 6038528443','Rest Room',1,10,'S06');
INSERT INTO Room VALUES (14,'+91 6325697829','Rest Room',3,3,'S07');
INSERT INTO Room VALUES (15,'+91 2694140958','LAB1',1,null,'S17');
INSERT INTO Room VALUES (16,'+91 3596463826','LAB2',2,null,'S18');
INSERT INTO Room VALUES (17,'+91 8894162328','General ward',1,10,'S13');
INSERT INTO Room VALUES (18,'+91 5527171015','General ward',2,20,'S14');
INSERT INTO Room VALUES (19,'+91 3091386838','General ward',3,15,'S15');
INSERT INTO Room VALUES (20,'+91 7324243222','General ward',1,10,'S16');
INSERT INTO Room VALUES (21,'+91 3980074119','General ward',2,20,'S05');
INSERT INTO Room VALUES (22,'+91 9196136125','General ward',3,15,'S06');
INSERT INTO Room VALUES (23,'+91 6260115148','Private room',1,1,'S01');
INSERT INTO Room VALUES (24,'+91 9684448119','Private room',1,1,'S02');
INSERT INTO Room VALUES (25,'+91 7091872595','Private room',1,1,'S03');
INSERT INTO Room VALUES (26,'+91 2455843306','Private room',1,1,'S04');
INSERT INTO Room VALUES (27,'+91 8138736249','Private room',1,1,'S09');
INSERT INTO Room VALUES (28,'+91 0381634516','Private room',2,1,'S10');
INSERT INTO Room VALUES (29,'+91 2490311223','Private room',2,1,'S11');
INSERT INTO Room VALUES (30,'+91 6220985076','Private room',2,1,'S12');
INSERT INTO Room VALUES (31,'+91 6253511101','Private room',2,1,'S01');
INSERT INTO Room VALUES (32,'+91 6962252581','Private room',2,1,'S02');
INSERT INTO Room VALUES (33,'+91 0511305185','Private room',3,1,'S03');
INSERT INTO Room VALUES (34,'+91 8627860932','Private room',3,1,'S04');
INSERT INTO Room VALUES (35,'+91 9790864261','Private room',3,1,'S09');
INSERT INTO Room VALUES (36,'+91 9834034836','Private room',3,1,'S10');
INSERT INTO Room VALUES (37,'+91 1692494895','Private room',3,1,'S11');
INSERT INTO Room VALUES (38,'+91 0293697346','Private room',1,1,'S12');
INSERT INTO Room VALUES (39,'+91 6898723175','Private room',2,1,'S01');
INSERT INTO Room VALUES (40,'+91 0155674853','Private room',3,1,'S02');
INSERT INTO Room VALUES (41,'+91 0870731248','Private room',1,1,'S03');
INSERT INTO Room VALUES (42,'+91 793258187','Private room',2,1,'S04');
INSERT INTO Room VALUES (43,'+91 7887993629','Operation theater',1,2,'S09');
INSERT INTO Room VALUES (44,'+91 0397461634','Operation theater',2,2,'S10');
INSERT INTO Room VALUES (45,'+91 0481277648','Operation theater',3,2,'S11');
INSERT INTO Room VALUES (46,'+91 0772950873','Delivery room',1,2,'S06');
INSERT INTO Room VALUES (47,'+91 7823244433','Delivery room',1,1,'S07');
INSERT INTO Room VALUES (48,'+91 8936984078','Delivery room',2,1,'S08');
INSERT INTO Room VALUES (49,'+91 5630504483','Housekeeping',1,null,null);
INSERT INTO Room VALUES (50,'+91 1322726660','Maternity ward',1,3,'S01');
INSERT INTO Room VALUES (51,'+91 6549753916','Maternity ward',2,2,'S02');
INSERT INTO Room VALUES (52,'+91 9994852837','Maternity ward',3,2,'S09');
INSERT INTO Room VALUES (53,'+91 2206864528','Maternity ward',3,3,'S10');
INSERT INTO Room VALUES (54,'+91 3380270547','Maternity ward',1,2,'S11');
INSERT INTO Room VALUES (55,'+91 4216930917','LAB3',3,null,'S19');



INSERT INTO INSURANCE VALUES (101,'LIC','+91 6795904106','P.O. Box 750, 9295 Non, Rd.',100000);
INSERT INTO INSURANCE VALUES (102,'HDFC','+91 2801940635','346-9071 Dictum. St.',237600);
INSERT INTO INSURANCE VALUES (103,'LIC','+91 3184586187','Ap #954-4111 Semper, Road',200000);
INSERT INTO INSURANCE VALUES (104,'LIC','+91 2178118965','Ap #950-8202 Nam Rd.',14000);
INSERT INTO INSURANCE VALUES (105,'LIC','+91 1408685809','700-4900 Sem St.',300000);
INSERT INTO INSURANCE VALUES (106,'LIC','+91 5334554000','694-4941 Id, Street',4000000);
INSERT INTO INSURANCE VALUES (107,'LIC','+91 0878114035','3992 Ut Ave',4000000);
INSERT INTO INSURANCE VALUES (108,'LIC','+91 5574969703','639-7051 A Rd.',5000000);
INSERT INTO INSURANCE VALUES (109,'LIC','+91 6358811228','Ap #630-8377 Orci. Avenue',600000);
INSERT INTO INSURANCE VALUES (110,'LIC','+91 6106594899','Ap #299-3347 Ultricies St.',100000);
INSERT INTO INSURANCE VALUES (111,'LIC','+91 5266337299','5870 Non, Avenue',600000);
INSERT INTO INSURANCE VALUES (112,'RELIANCE','+91 0617356005','4269 Leo. Rd.',780000);
INSERT INTO INSURANCE VALUES (113,'KOTAK','+91 2376700565','8831 Cursus Road',680000);
INSERT INTO INSURANCE VALUES (114,'EXIDE LIFE','+91 6277921417','4116 Ac Street',376786);
INSERT INTO INSURANCE VALUES (115,'PNB MET LIFE','+91 0217105789','474-8687 Arcu. Rd.',790000);
INSERT INTO INSURANCE VALUES (116,'PNB MET LIFE','+91 9633237371','5669 Duis Road',45000);
INSERT INTO INSURANCE VALUES (117,'EXIDE LIFE','+91 0049599528','P.O. Box 560, 9909 Aliquam Avenue',678000);
INSERT INTO INSURANCE VALUES (118,'HDFC','+91 7910087204','7147 Lectus Rd.',56000);
INSERT INTO INSURANCE VALUES (119,'HDFC','+91 4020319075','P.O. Box 571, 3818 Aliquam Ave',89000);
INSERT INTO INSURANCE VALUES (120,'EXIDE LIFE','+91 2347306375','Ap #726-7115 Lectus. Street',785000);
INSERT INTO INSURANCE VALUES (121,'KOTAK','+91 5878686430','5755 Nibh Rd.',560000);
INSERT INTO INSURANCE VALUES (122,'KOTAK','+91 0170960217','668-5254 Mi Rd.',45600);
INSERT INTO INSURANCE VALUES (123,'EXIDE LIFE','+91 5644626985','P.O. Box 911, 2540 Vehicula. Ave',761276);
INSERT INTO INSURANCE VALUES (124,'LIC','+91 6070375088','Ap #126-594 Lobortis Rd.',732786);
INSERT INTO INSURANCE VALUES (125,'RELIANCE','+91 8863491448','6746 At St.',2300);
INSERT INTO INSURANCE VALUES (126,'EXIDE LIFE','+91 5763371357','P.O. Box 272, 5274 Ligula Ave',1266712);
INSERT INTO INSURANCE VALUES (127,'RELIANCE','+91 8270580141','252-2699 Sodales Ave',3276121);
INSERT INTO INSURANCE VALUES (128,'LIC','+91 2282568289','720-4467 Mi Avenue',5600);
INSERT INTO INSURANCE VALUES (129,'PNB METLIFE','+91 9307521155','9415 Pellentesque St.',78000);
INSERT INTO INSURANCE VALUES (130,'KOTAK','+91 6400497845','P.O. Box 949, 9583 Est, Rd.',54000);


INSERT INTO Patient  VALUES (1,'Latifah','Abraham','Rowe','outpatient','+91 9495071435','enim.diam.vel@tellusimperdietnon.com',63,'P.O. Box 867, 8045 Orci St.','male',101);
INSERT INTO Patient  VALUES (2,'Norman','Zeph','Nieves','outpatient','+91 6795904106','vitae@libero.com',27,'P.O. Box 750, 9295 Non, Rd.','male',102);
INSERT INTO Patient  VALUES (3,'Marah','Blake','Allen','inpatient','+91 3184586187','odio.vel.est@Vestibulumanteipsum.co.uk',7,'Ap #954-4111 Semper, Road','female',103);
INSERT INTO Patient  VALUES (4,'Nola','Tiger','Bell','outpatient','+91 2178118965','ipsum.non@intempus.ca',23,'Ap #950-8202 Nam Rd.','male',104);
INSERT INTO Patient  VALUES (5,'Serena','Zachary','Crawford','outpatient','+91 1408685809','et.pede@nislQuisque.com',50,'700-4900 Sem St.','female',105);
INSERT INTO Patient  VALUES (6,'Hedy','Cadman','Hartman','outpatient','+91 5334554000','orci@Aliquam.ca',24,'694-4941 Id, Street',' female',106);
INSERT INTO Patient  VALUES (7,'Price','Anthony','Oneal','inPatient','+91 0878114035','aliquam.iaculis@Aliquam.co.uk',1,'3992 Ut Ave','male',107);
INSERT INTO Patient  VALUES (8,'Wendy','Orlando','Hernandez','inPatient','+91 5574969703','et.netus.et@id.edu',37,'639-7051 A Rd.',' female',108);
INSERT INTO Patient  VALUES (9,'Marvin','Clinton','Koch','inPatient','+91 6358811228','nec.orci@consectetueradipiscing.ca',38,'Ap #630-8377 Orci. Avenue','male',109);
INSERT INTO Patient  VALUES (10,'Iola','Stewart','Powell','inPatient','+91 6106594899','natoque.penatibus.et@feugiatnecdiam.ca',30,'Ap #299-3347 Ultricies St.',' female',110);
INSERT INTO Patient  VALUES (11,'Brynn','Lamar','Mann','outPatient','+91 5266337297','Ut.sagittis.lobortis@auctornon.org',69,'5870 Non, Avenue','male',111);
INSERT INTO Patient  VALUES (12,'Colby','Cruz','Roman','outPatient','+91 0617356005','lacus.Etiam.bibendum@Suspendisse.ca',21,'4269 Leo. Rd.','male',112);
INSERT INTO Patient  VALUES (13,'Hashim','Ulysses','Salazar','inpatient','+91 2376700565','at.arcu.Vestibulum@nasceturridiculus.org',58,'8831 Cursus Road','male',113);
INSERT INTO Patient  VALUES (14,'Yael','Raphael','Potter','inPatient','+91 6277921417','tristique@Vivamusnonlorem.edu',19,'4116 Ac Street',' female',111);
INSERT INTO Patient  VALUES (15,'Ingrid','Hiram','Lowery','outPatient','+91 0217105789','amet.consectetuer@enimdiamvel.com',52,'474-8687 Arcu. Rd.','male',104);
INSERT INTO Patient  VALUES (16,'Justina','Carson','Mercado','outPatient','+91 9633237371','dolor.Fusce.feugiat@Curabitur.net',56,'5669 Duis Road',' female',115);
INSERT INTO Patient  VALUES (17,'Valentine','Barrett','Branch','outpatient','+91 0049599528','et.ultrices.posuere@loremvehiculaet.com',8,'P.O. Box 560, 9909 Aliquam Avenue','female',null);
INSERT INTO Patient  VALUES (18,'Bryar','Anthony','Sweet','inPatient','+91 7910087204','et@ridiculus.com',13,'7147 Lectus Rd.','male',null);
INSERT INTO Patient  VALUES (19,'Timon','Basil','Munoz','inPatient','+91 4020319075','elementum@pede.ca',6,'P.O. Box 571, 3818 Aliquam Ave',' female',null);
INSERT INTO Patient  VALUES (20,'Lael','Brian','Burns','inPatient','+91 2347306375','lorem.ut@mi.edu',55,'Ap #726-7115 Lectus. Street','male',null);
INSERT INTO Patient  VALUES (21,'Kylie','Ignatius','Mcfadden','inPatient','+91 5878686430','orci.Donec.nibh@Pellentesque.edu',59,'5755 Nibh Rd.','female',null);
INSERT INTO Patient  VALUES (22,'Herrod','Joel','Riggs','inpatient','+91 0170960217','Aenean@laoreet.ca',2,'668-5254 Mi Rd.','male',null);
INSERT INTO Patient  VALUES (23,'Tyrone','Coby','Conner','inPatient','+91 5644626985','ultrices.mauris@at.edu',23,'P.O. Box 911, 2540 Vehicula. Ave','male',null);
INSERT INTO Patient  VALUES (24,'Orson','Walker','Brock','inPatient','+91 6070375088','convallis@euismodacfermentum.net',7,'Ap #126-594 Lobortis Rd.','male',116);
INSERT INTO Patient  VALUES (25,'Velma','Jonah','Hampton','outPatient','+91 8863491448','lacinia@actellusSuspendisse.net',34,'6746 At St.','male',117);
INSERT INTO Patient  VALUES (26,'Montana','Donovan','Barrera','inPatient','+91 5763371357','ipsum.non.arcu@Integervitae.net',20,'P.O. Box 272, 5274 Ligula Ave',' female',118);
INSERT INTO Patient  VALUES (27,'Kalia','Oren','Mcgee','inPatient','+91 8270580141','metus.facilisis@enim.co.uk',57,'252-2699 Sodales Ave',' female',119);
INSERT INTO Patient  VALUES (28,'Oleg','Tanek','Beach','inPatient','+91 2282568289','quis@lacus.ca',57,'720-4467 Mi Avenue','male',null);
INSERT INTO Patient  VALUES (29,'Craig','Cameron','Bernard','outpatient','+91 9307521155','Phasellus.ornare.Fusce@orcilobortis.edu',70,'9415 Pellentesque St.','male',null);
INSERT INTO Patient  VALUES (30,'Gage','Richard','Pacheco','inPatient','+91 6400497845','magna.tellus.faucibus@vitaedolor.com',66,'P.O. Box 949, 9583 Est, Rd.','male',null);
INSERT INTO Patient  VALUES (31,'Aidan','Jamal','Cannon','outPatient','+91 2801940635','Aenean.euismod.mauris@Cras.ca',20,'346-9071 Dictum. St.','male',null);
INSERT INTO Patient  VALUES (32,'Demetria','Preston','Chavez','outpatient','+91 0122726778','Quisque.varius.Nam@nec.net',21,'P.O. Box 502, 4556 Urna. Road',' female',null);
INSERT INTO Patient  VALUES (33,'Nissim','Brian','Reed','inPatient','+91 5346237938','eget.mollis.lectus@acarcu.co.uk',61,'Ap #620-924 Volutpat Av.','male',null);
INSERT INTO Patient  VALUES (34,'Kasimir','Travis','Conway','outPatient','+91 1505343094','tincidunt@pedenonummyut.edu',32,'Ap #674-6388 Diam. Av.',' female',null);
INSERT INTO Patient  VALUES (35,'Fleur','Prescott','Mayer','inpatient','+91 7581672434','vulputate@dui.co.uk',22,'Ap #904-179 Sit Road','female',null);
INSERT INTO Patient  VALUES (36,'Macon','Colton','Serrano','outpatient','+91 7275317555','non@aliquetnecimperdiet.org',12,'Ap #294-4696 Ac Rd.','male',null);
INSERT INTO Patient  VALUES (37,'Mufutau','Jasper','Cruz','outPatient','+91 2583785533','Aliquam.erat.volutpat@primis.ca',52,'P.O. Box 476, 8392 Nulla St.',' female',120);
INSERT INTO Patient  VALUES (38,'Harriet','Arsenio','Henson','outpatient','+91 7267592226','congue@Donecsollicitudinadipiscing.co.uk',59,'5804 Pede. Av.',' female',121);
INSERT INTO Patient  VALUES (39,'Nicole','Allen','Miranda','inpatient','+91 8634714664','in@aenimSuspendisse.net',34,'P.O. Box 895, 4139 Fusce St.',' female',null);
INSERT INTO Patient  VALUES (40,'Leah','Maxwell','Mclaughlin','outPatient','+91 2079688247','vitae.erat@penatibusetmagnis.ca',34,'918-6407 Vitae St.','male',123);
INSERT INTO Patient  VALUES (41,'Kibo','Colby','Kent','inPatient','+91 7571848528','pellentesque.Sed.dictum@semperNam.ca',25,'4105 Aliquam Av.','male',null);
INSERT INTO Patient  VALUES (42,'Mariam','Ashton','Mccormick','outpatient','+91 2228043165','facilisis.magna@risusvarius.org',70,'Ap #816-9678 Et Rd.',' female',124);
INSERT INTO Patient  VALUES (43,'Yuri','Griffith','Nixon','outPatient','+91 3486174830','vitae.erat@Morbi.net',34,'Ap #335-2650 Ridiculus Street',' female',null);
INSERT INTO Patient  VALUES (44,'Idola','Abbot','Johnston','outpatient','+91 1576276577','quam@dictumPhasellus.edu',21,'442-9606 Fringilla Road','female',125);
INSERT INTO Patient  VALUES (45,'Hannah','Yoshio','Koch','inPatient','+91 1790280295','pede@ipsumSuspendisse.com',46,'Ap #187-9437 Maecenas Road','female',125);
INSERT INTO Patient  VALUES (46,'Elvis','Eaton','Tate','outpatient','+91 4538944562','ipsum.porta@eratneque.co.uk',46,'229-6390 Pellentesque St.','male',126);
INSERT INTO Patient  VALUES (47,'Chaim','Henry','Richmond','inpatient','+91 3256205764','cursus@ipsumdolorsit.net',25,'371-9808 Tellus St.','male',null);
INSERT INTO Patient  VALUES (48,'Charlotte','Thane','Mills','outpatient','+91 6628455520','porttitor@sed.edu',15,'P.O. Box 240, 1136 Rutrum St.','female',null);
INSERT INTO Patient  VALUES (49,'Marcia','Oleg','Pruitt','inPatient','+91 9613627174','Aliquam.nisl.Nulla@euultrices.ca',62,'Ap #380-3771 Nonummy St.','female',null);
INSERT INTO Patient  VALUES (50,'Xanthus','Ulric','Herman','outpatient','+91 6742850516','blandit.Nam.nulla@fermentummetusAenean.net',7,'Ap #415-1192 Sem St.','male',null);
INSERT INTO Patient  VALUES (51,'Branden','Alvin','Dillard','outpatient','+91 7107961009','sodales@sitametornare.net',32,'Ap #985-4001 Vel, Road',' female',null);
INSERT INTO Patient  VALUES (52,'Maggy','Jared','Robles','outpatient','+91 1428447062','ipsum.non@quis.edu',47,'Ap #971-116 Convallis Av.','female',127);
INSERT INTO Patient  VALUES (53,'Paki','Ira','Hooper','outpatient','+91 6199568631','venenatis.a@Maurisnondui.net',17,'4443 Ipsum Road',' female',128);
INSERT INTO Patient  VALUES (54,'Kirby','Aladdin','Brown','inPatient','+91 9394970402','non.leo@diamDuis.net',64,'325-4536 Aliquet Road',' female',129);
INSERT INTO Patient  VALUES (55,'Eric','Jamal','Garza','inpatient','+91 0360855693','erat.neque@Crassedleo.org',66,'Ap #165-6316 Lobortis St.','male',130);
INSERT INTO Patient  VALUES (56,'Forrest','Talon','Wells','outpatient','+91 7282477364','varius@mollis.net',33,'Ap #976-4827 Faucibus St.','male',null);
INSERT INTO Patient  VALUES (57,'Arden','Mufutau','Franco','outpatient','+91 2867480823','Vivamus.rhoncus.Donec@quam.co.uk',15,'3328 Ac, Rd.','male',null);
INSERT INTO Patient  VALUES (58,'Scarlett','Dylan','Beard','outpatient','+91 2963942362','adipiscing.lobortis.risus@tellus.co.uk',7,'1874 Purus. Road',' female',null);
INSERT INTO Patient  VALUES (59,'Haley','Uriah','Price','inPatient','+91 0273745544','in@Nullaaliquet.com',25,'P.O. Box 580, 2344 Commodo Street',' female',null);
INSERT INTO Patient  VALUES (60,'Chaney','Wallace','Shepard','outpatient','+91 6122808944','ultrices@Donecest.co.uk',8,'822-4780 Sem, Street','male',null);
INSERT INTO Patient  VALUES (61,'Ian','Matthew','Welch','inPatient','+91 7497195739','sapien@elit.co.uk',47,'P.O. Box 836, 7990 Purus Street',' female',null);
INSERT INTO Patient  VALUES (62,'Tara','Joseph','Pitts','outpatient','+91 3953945755','justo@pretiumaliquet.ca',47,'6690 Donec Rd.','male',null);
INSERT INTO Patient  VALUES (63,'Ciaran','Herman','Aguirre','outpatient','+91 3779357790','ac@loremsitamet.ca',18,'447-2963 Integer Av.','male',null);
INSERT INTO Patient  VALUES (64,'Malachi','Alfonso','Alexander','inPatient','+91 7111445920','eget@nonsapien.net',9,'P.O. Box 232, 2769 Aliquet Ave',' female',null);
INSERT INTO Patient  VALUES (65,'Jaquelyn','Hoyt','Rojas','inPatient','+91 7099783076','dolor.egestas@ProinvelitSed.ca',34,'Ap #881-2015 Enim. Av.',' female',null);
INSERT INTO Patient  VALUES (66,'Denton','Xander','Riley','outpatient','+91 4873144517','ornare.facilisis@Integersem.com',34,'Ap #163-6144 Eget, Rd.','male',null);
INSERT INTO Patient  VALUES (67,'Kuame','Luke','Chang','outpatient','+91 1271055062','Etiam.ligula.tortor@enimEtiam.ca',47,'3376 Interdum St.','male',null);
INSERT INTO Patient  VALUES (68,'Dominic','Stuart','Salas','outpatient','+91 9403228250','lacinia.vitae@etipsumcursus.com',31,'P.O. Box 529, 9285 Hendrerit Road','male',null);
INSERT INTO Patient  VALUES (69,'Ramona','Thomas','Fernandez','inPatient','+91 6638380262','vehicula@lectus.edu',23,'P.O. Box 969, 1396 Eget, Av.','female',null);
INSERT INTO Patient  VALUES (70,'Kirby','Tyler','Webb','inPatient','+91 0078106708','a@feugiat.co.uk',15,'Ap #507-2704 Mollis Avenue','male',null);

INSERT INTO prescription VALUES (1,'Cephalexin',133,'01/Jul/2020',2,' Acute maxillary sinusitis ','S45','1');
INSERT INTO prescription VALUES (2,'Amoxicillin',457,'05/Aug/2021',1,' General medical exam ','S44','2');
INSERT INTO prescription VALUES (3,'Levothyroxine Sodium',248,'14/May/2022',3,' Visual refractive errors','S44','3');
INSERT INTO prescription VALUES (4,'Metformin HCl',89,'16/Jan/2022',3,'Pain in joint','S33','5');
INSERT INTO prescription VALUES (5,'Carvedilol',394,'13/Jul/2021',1,' General medical exam ','S21','7');
INSERT INTO prescription VALUES (6,'Niaspan',137,'02/Jan/2021',2,' Acute maxillary sinusitis ','S31','9');
INSERT INTO prescription VALUES (7,'Metoprolol Tartrate ',94,'07/Sep/2020',2,'Pain in joint','S18','10');
INSERT INTO prescription VALUES (8,'Clonazepam',284,'25/Jul/2020',2,'Urinary tract infection','S17','49');
INSERT INTO prescription VALUES (9,'Alprazolam',230,'23/Apr/2021',2,' General medical exam ','S27','1');
INSERT INTO prescription VALUES (10,'Diovan HCT',314,'22/Mar/2021',1,'Pain in joint','S19','2');
INSERT INTO prescription VALUES (11,'Potassium Chloride',271,'30/Feb/2021',3,' Acute maxillary sinusitis ','S17','3');
INSERT INTO prescription VALUES (12,'Lorazepam',276,'16/Jul/2020',1,'Osteoarthritis','S19','9');
INSERT INTO prescription VALUES (13,'Azithromycin',438,'31/May/2022',2,' General medical exam ','S12','9');
INSERT INTO prescription VALUES (14,'Sertraline HCl',169,'24/May/2022',2,'Coronary atherosclerosis ','S17','9');
INSERT INTO prescription VALUES (15,'Lovastatin',273,'29/Jan/2022',1,' Asthma','S19','49');
INSERT INTO prescription VALUES (16,'Metformin HCl',223,'17/May/2021',3,'Nail fungus ','S21','22');
INSERT INTO prescription VALUES (17,'Pantoprazole Sodium',427,'11/May/2021',3,' Malaise and fatigue ','S22','23');
INSERT INTO prescription VALUES (18,'Tamsulosin HCl',376,'13/Dec/2020',1,'Nail fungus ','S23','24');
INSERT INTO prescription VALUES (19,'Warfarin Sodium',383,'08/Jul/2021',1,' Fibromyalgia / myositis','S24','24');
INSERT INTO prescription VALUES (20,'Tamsulosin HCl',334,'15/Feb/2021',3,' Acute laryngopharyngitis','S25','29');
INSERT INTO prescription VALUES (21,'APAP/Codeine',142,'19/Jun/2022',2,' Malaise and fatigue ','S27','39');
INSERT INTO prescription VALUES (22,'Crestor',201,'14/May/2021',3,'Hypothyroidism','S37','7');
INSERT INTO prescription VALUES (23,'Carvedilol',459,'27/Dec/2021',2,' Depressive disorder ','S27','35');
INSERT INTO prescription VALUES (24,'Oxycodone HCl',346,'12/Jan/2022',3,'Nail fungus ','S45','67');
INSERT INTO prescription VALUES (25,'Advair Diskus',377,'15/Oct/2020',1,'Hypothyroidism','S17','19');
INSERT INTO prescription VALUES (26,'Lantus',278,'24/Sep/2021',2,' Asthma','S34','45');
INSERT INTO prescription VALUES (27,'Amphetamine Salts',169,'05/Oct/2020',3,' Depressive disorder ','S17','9');
INSERT INTO prescription VALUES (28,'Furosemide',260,'03/Jul/2020',2,'Coronary atherosclerosis ','S17','9');
INSERT INTO prescription VALUES (29,'Doxycycline Hyclate',216,'06/Jul/2020',3,' Asthma','S18','59');
INSERT INTO prescription VALUES (30,'Pantoprazole Sodium',242,'09/Jul/2021',1,'Pain in joint','S20','44');
INSERT INTO prescription VALUES (31,'Celebrex',342,'16/Dec/2021',3,' General medical exam ','S21','69');
INSERT INTO prescription VALUES (32,'Vyvanse',431,'26/Apr/2021',2,'Pain in joint','S07','9');
INSERT INTO prescription VALUES (33,'Amlodipine Besylate',152,'20/May/2021',2,'Major depressive disorder ','S26','46');
INSERT INTO prescription VALUES (34,'LevothyroxineSodium',492,'12/Sep/2021',1,'Coronary atherosclerosis ','S38','70');
INSERT INTO prescription VALUES (35,'Prednisone',244,'04/Sep/2021',2,'Osteoarthritis','S18','32');
INSERT INTO prescription VALUES (36,'Seroquel',392,'03/Nov/2020',3,' Acute maxillary sinusitis ','S19','43');
INSERT INTO prescription VALUES (37,'Zolpidem Tartrate',237,'09/Sep/2021',3,' Depressive disorder ','S27','56');
INSERT INTO prescription VALUES (38,'Ibuprofen (Rx)',120,'12/Nov/2021',2,'Coronary atherosclerosis ','S32','67');
INSERT INTO prescription VALUES (39,'Hydrocodone/APAP',462,'29/Jul/2021',2,'Hypothyroidism','S29','65');
INSERT INTO prescription VALUES (40,'Carvedilol',303,'30/Apr/2021',1,'Urinary tract infection','S37','21');
INSERT INTO prescription VALUES (41,'Lisinopril',298,'31/Jan/2022',1,'Pain in joint','S23','20');
INSERT INTO prescription VALUES (42,'Azithromycin',213,'28/Aug/2020',2,'Urinary tract infection','S43','54');
INSERT INTO prescription VALUES (43,'Lovastatin',142,'17/Dec/2020',2,'Pain in joint','S41','51');
INSERT INTO prescription VALUES (44,'Prednisone',238,'09/Oct/2021',1,' General medical exam ','S25','9');
INSERT INTO prescription VALUES (45,'Viagra',265,'24/Jan/2021',2,' Acute laryngopharyngitis','S17','31');
INSERT INTO prescription VALUES (46,'Plavix',306,'16/Feb/2022',2,' Depressive disorder ','S26','33');
INSERT INTO prescription VALUES (47,'Amoxicillin Trihydrate/Potassium Clavulanate',105,'16/Feb/2022',2,'Hypothyroidism','S28','35');
INSERT INTO prescription VALUES (48,'Alprazolam',470,'03/May/2021',1,'Nail fungus ','S42','37');
INSERT INTO prescription VALUES (49,'Ibuprofen (Rx)',204,'23/Nov/2020',3,' Acute maxillary sinusitis ','S40','49');
INSERT INTO prescription VALUES (50,'Hydrochlorothiazide',283,'14/Mar/2022',2,' Visual refractive errors','S39','59');
INSERT INTO prescription VALUES (51,'Tri-Sprintec',474,'01/Jul/2020',1,'Hypothyroidism','S38','8');
INSERT INTO prescription VALUES (52,'Doxycycline Hyclate',498,'06/Sep/2020',1,' Asthma','S37','2');
INSERT INTO prescription VALUES (53,'Atenolol',370,'08/Aug/2021',3,' Acute laryngopharyngitis','S36','3');
INSERT INTO prescription VALUES (54,'Singulair',153,'14/Jan/2022',3,' Acute maxillary sinusitis ','S23','6');
INSERT INTO prescription VALUES (55,'Gianvi',448,'29/May/2021',3,' Acute maxillary sinusitis ','S24','29');
INSERT INTO prescription VALUES (56,'Lexapro',485,'21/Dec/2021',3,'Major depressive disorder ','S34','33');
INSERT INTO prescription VALUES (57,'Furosemide',130,'23/May/2022',1,'Major depressive disorder ','S17','4');
INSERT INTO prescription VALUES (58,'Carvedilol',84,'25/Jun/2021',2,' Visual refractive errors','S26','5');
INSERT INTO prescription VALUES (59,'Lisinopril',311,'08/Mar/2021',1,' Visual refractive errors','S35','19');
INSERT INTO prescription VALUES (60,'Levoxyl',219,'04/Jan/2022',1,' Acute maxillary sinusitis','S14','10');

insert into test values(1,'CT SCAN','01-01-2020','04-01-2020',500,'S17',2);
insert into test values(2,'FULL BODY CHECK UP','04-01-2020','07-01-2020',1200,'S17',2);
insert into test values(3,'comprehensive eye exam','10-01-2020','14-01-2020',800,'S17',2);
insert into test values(4,'X-ray','12-01-2020','16-01-2020',400,'S17',2);
insert into test values(5,'FULL BODY CHECK UP','21-02-2020','25-02-2020',1200,'S18',1);
insert into test values(6,'CT SCAN','03-02-2020','07-02-2020',500,'S19',8);
insert into test values(7,'X-ray','13-02-2020','13-02-2020',400,'S18',5);
insert into test values(8,'urinalysis','16-02-2020','19-02-2020',900,'S20',7);
insert into test values(9,'FULL BODY CHECK UP','22-02-2020','25-02-2020',1200,'S21',39);
insert into test values(10,'X-ray','07-03-2020','10-03-2020',400,'S21',60);
insert into test values(11,'CT SCAN','10-03-2020','12-03-2020',500,'S17',22);
insert into test values(12,'Joint aspiration','16-03-2020','19-03-2020',1100,'S19',6);
insert into test values(13,'FULL BODY CHECK UP','23-03-2020','25-01-2020',1200,'S18',7);
insert into test values(14,'angiogram','26-03-2020','29-03-2020',1500,'S18',8);
insert into test values(15,'spirometry','01-04-2020','13-04-2020',1800,'S17',42);
insert into test values(16,'Fungal culture','15-04-2020','18-04-2020',700,'S17',52);
insert into test values(17,' Complete Metabolic Panel','20-04-2020','23-04-2020',2000,'S20',23);
insert into test values(18,'Fungal culture','25-04-2020','29-04-2020',700,'S20',26);
insert into test values(19,'Muscle and skin biopsy','26-04-2020','28-04-2020',2100,'S21',43);
insert into test values(20,'rapid antigen detection test','03-05-2020','06-05-2020',2300,'S20',48);
insert into test values(21,' Complete Metabolic Panel','11-05-2020','13-05-2020',2000,'S19',47);
insert into test values(22,'TSH Test','16-05-2020','19-05-2020',2900,'S19',47);
insert into test values(23,'GP examination','20-05-2020','20-05-2020',3000,'S18',55);
insert into test values(24,'Fungal culture','22-05-2020','24-05-2020',700,'S19',56);
insert into test values(25,'TSH Test','04-06-2020','07-06-2020',2900,'S18',59);
insert into test values(26,'spirometry','06-06-2020','09-06-2020',1800,'S17',9);
insert into test values(27,'GP examination','17-06-2020','20-06-2020',3000,'S20',29);
insert into test values(28,'angiogram','26-06-2020','26-06-2020',1500,'S17',39);
insert into test values(29,'spirometry','27-06-2020','29-06-2020',1800,'S18',49);
insert into test values(30,'X-ray','02-07-2020','05-07-2020',400,'S19',41);
insert into test values(31,'FULL BODY CHECK UP','06-07-2020','09-07-2020',1200,'S19',34);
insert into test values(32,'X-ray','10-07-2020','11-07-2020',400,'S20',33);
insert into test values(33,'GP examination','19-07-2020','22-07-2020',3000,'S19',33);
insert into test values(34,'angiogram','24-07-2020','27-07-2020',1500,'S18',33);
insert into test values(35,'Joint aspiration','01-08-2020','03-08-2020',1100,'S21',11);
insert into test values(36,'CT SCAN','05-08-2020','07-08-2020',500,'S21',11);
insert into test values(37,'GP examination','12-08-2020','14-08-2020',3000,'S20',22);
insert into test values(38,'angiogram','26-08-2020','28-08-2020',1500,'S20',44);
insert into test values(39,'TSH Test','04-09-2020','04-09-2020',2900,'S20',46);
insert into test values(40,'urinalysis','12-09-2020','14-09-2020',900,'S18',56);
insert into test values(41,'X-ray','15-09-2020','17-09-2020',400,'S18',36);
insert into test values(42,'urinalysis','18-09-2020','21-09-2020',800,'S19',26);
insert into test values(43,'X-ray','23-09-2020','27-09-2020',400,'S19',14);
insert into test values(44,'FULL BODY CHECK','07-10-2020','09-10-2020',1200,'S17',58);
insert into test values(45,'rapid antigen detection test','08-10-2020','11-10-2020',2500,'S19',52);
insert into test values(46,'GP examination','15-10-2020','18-10-2020',3000,'S18',54);
insert into test values(47,'TSH Test','19-10-2020','22-10-2020',2900,'S18',25);
insert into test values(48,'Fungal culture','23-10-2020','25-10-2020',700,'S17',60);
insert into test values(49,'CT SCAN','28-10-2020','30-10-2020',500,'S21',58);
insert into test values(50,'comprehensive eye exam','04-11-2020','06-11-2020',800,'S20',16);


insert into patient_record values('101','01-02-2020','02-03-2020','yes','1200','111',17,3);
insert into patient_record values('102','03-01-2020','13-01-2020','yes','2200','112',18,7);
insert into patient_record values('103','01-04-2020','03-04-2020','yes','1200','113',19,8);
insert into patient_record values('104','11-02-2020','12-03-2020','yes','1200','114',19,9);
insert into patient_record values('105','10-03-2020','18-03-2020','no','2200','121',23,10);
insert into patient_record values('106','01-04-2020','03-05-2020','yes','1200','122',24,13);
insert into patient_record values('107','01-02-2020','02-03-2020','yes','1200','123',17,14);
insert into patient_record values('108','01-03-2020','03-04-2020','no','2200','124',26,18);
insert into patient_record values('109','01-04-2020','03-05-2020','yes','1200','113',33,19);
insert into patient_record values('110','01-02-2020','02-03-2020','yes','1200','114',42,20);
insert into patient_record values('111','01-03-2020','03-04-2020','no','2200','121',40,22);
insert into patient_record values('112','01-04-2020','03-05-2020','yes','1200','122',20,21);
insert into patient_record values('113','01-02-2020','02-03-2020','no','1200','211',22,23);
insert into patient_record values('114','01-03-2020','03-04-2020','yes','2200','212',22,24);
insert into patient_record values('115','01-04-2020','03-05-2020','yes','1200','213',19,26);
insert into patient_record values('116','01-02-2020','02-03-2020','yes','1200','214',31,28);
insert into patient_record values('117','01-03-2020','03-04-2020','no','2200','121',32,27);
insert into patient_record values('118','01-04-2020','03-05-2020','yes','1200','122',36,30);
insert into patient_record values('119','01-02-2020','02-03-2020','no','1200','311',37,33);
insert into patient_record values('120','01-03-2020','03-04-2020','yes','2200','312',38,35);
insert into patient_record values('121','01-04-2020','03-05-2020','yes','1200','313',39,39);
insert into patient_record values('122','01-02-2020','02-03-2020','yes','1200','314',19,41);
insert into patient_record values('123','01-03-2020','03-04-2020','no','2200','121',41,45);
insert into patient_record values('124','01-04-2020','03-05-2020','yes','1200','122',42,47);
insert into patient_record values('125','01-02-2020','02-03-2020','yes','1200','111',19,54);
insert into patient_record values('126','01-03-2020','03-04-2020','yes','2200','112',17,61);
insert into patient_record values('127','01-04-2020','03-05-2020','yes','1200','113',18,64);
insert into patient_record values('128','01-02-2020','02-03-2020','yes','1200','114',19,65);
insert into patient_record values('129','01-03-2020','03-04-2020','no','2200','121',20,69);
insert into patient_record values('130','01-04-2020','03-05-2020','yes','1200','122',21,70);


Select * from jobtype;
Select * from staff;
Select * from prescription;
Select * from test;
Select * from patient;
Select * from room;
Select * from insurance;
Select * from patient_record;



--SUB-QUERIES

--1]display the patients who have the same age as 'Lael'.
select * from patient p1
where exists ( select * from patient p2
where p2.p_Fname='Lael' and p2.P_AGE=p1.P_AGE);


--2]display details of patient who have same gender as patient with patient id 2.
select * from patient p1
where exists ( select * from patient p2
where p2.P_ID='2' and  p1.P_GENDER=p2.P_GENDER );


--3]display the 3rd lowest salary of the staff.
SELECT S_Salary FROM staff a1 WHERE 3-1= (SELECT COUNT(DISTINCT S_Salary) FROM staff a2 WHERE a2.S_Salary > a1.S_Salary);

--4] Find the patient who paid highest when admitted
SELECT * FROM patient_record pr
WHERE pr.amount>=ALL(SELECT patient_record.amount FROM patient_record);

--5] Find the patient who paid least when admitted
SELECT * FROM patient_record pr
WHERE pr.amount<=ALL(SELECT patient_record.amount FROM patient_record);

--6] Display the test details which is the costliest
SELECT * FROM test t
WHERE t.t_amt>=ALL(SELECT test.t_amt FROM test);

--7] Display the test details which is the cheapiest
SELECT * FROM test t
WHERE t.t_amt<=ALL(SELECT test.t_amt FROM test);

--8]Display presciption id and med name priscribed to the patient with id 37
select pr_id, med_name
from prescription
where p_id IN (select p_id from patient where p_id = 37)
order by (pr_id);


--9] display med name , patient id and dose prescribed when dose>470
select med_name, p_id,pr_dose
from prescription
where p_id IN (select p_id from patient where pr_dose>470)
order by (pr_id);

--10]Display the patient id and first name if thier insurance amount is greater than 50000
select p_id, p_fname
from patient
where i_id IN (select i_id from insurance where i_amount < 50000)
order by (p_id);


--11]Display patient id and name admitted in general ward room number 19
select p_id,p_fname
from patient
where p_id IN (select p_id from patient_record
					where r_no=19);                  
                  
-- 12]Display patient id and name who where tested by staff member having id S21
select p_id,p_fname
from patient
where p_id IN (
select p_id from prescription
					where pr_id IN 
                           (select pr_id from test
                                where s_id='S21'));
                            
                            
--13]Display staff is and name who joined since 2019
select s_id,s_fname
from staff
where s_doj>'01-jan-2019';        

--14)Retrieve name of lab technician who diagnosed 'Nola Bell"
SELECT s_fname, s_lname 
FROM staff s, jobtype jd 
WHERE s.j_id=jd.j_id and jd.j_name = 'Lab technician' and s_id IN (SELECT s_id 
FROM patient p, prescription pp 
WHERE p.p_id = pp.p_id and p_fname= 'Nola' and p_lname= 'Bell');

--15)Retrieve patient's name who have been insured by LIC health insurance cover
SELECT p.p_fname, p.p_lname
from patient p
where p.i_id IN (select i.i_id
from insurance i 
where i.i_name='LIC');

--16)Find the patient id and name and insurance type of the patient with the highest insurance amount.


 select p.p_id,p.p_fname, i1.i_name, i1.i_amount 
 from insurance i1 ,patient p
 where i1.i_id=p.i_id and NOT EXISTS(select * from insurance i2

where i2.i_amount > i1.i_amount);



--17] display the amount charged by staff  named Noble to the patient 

SELECT amount
FROM patient_record pa,room r
WHERE pa.R_NO=r.R_NO
and r.s_id in(select r.s_id
from staff s, Room r
where r.s_id=s.s_id AND s.S_Fname like '%Noble%');

--18) display staff name who prescibes the medicine 'Carvedilol'

select s.s_fname
from staff s 
where s.s_id IN (select p.s_id
from prescription p
where p.med_name='Carvedilol');

--19)display the shift of the staff who treats patients of age 20

Select SHIFT 
from staff s , prescription pr
where s.s_id=pr.s_id
and pr.P_ID in(select pr.P_ID
from prescription pr, patient p
where pr.P_ID=p.P_ID and p.P_AGE=20);


--20)display patient name who has been prescibed the medicine 'Diovan HCT'
select p1.p_fname
from patient p1
where p1.p_id IN (select p.p_id
from prescription p
where p.med_name='Diovan HCT');

--21)display the insurance id of the patient who is treated by a staff with more than 4 years of experience

Select i_id 
from patient p , prescription pr
where p.P_ID=pr.P_ID
and pr.P_ID in(select pr.P_ID
from staff s
where pr.s_id=s.s_id and s.S_YOE<3);

--22)display staff name who handles room number 11
select s.s_fname
from staff s
where s.s_id in(select r.s_id
from room r
where r.r_no=11);

--23)display the insurance id of the patient who is treated by the staff whose last name is Huber

Select i_id 
from patient p , prescription pr
where p.P_ID=pr.P_ID
and pr.P_ID in(select pr.P_ID
from prescription pr, staff s
where pr.s_id=s.s_id and s.S_Lname like '%Huber%');

--24)display the test name given by the staff who has qualification in BMLT

select t.t_name
from test t, staff s
where s.s_id =t.s_id and s.j_id IN(select j.j_id
from jobtype j
where j.qualification LIKE '%BMLT%');

--25)display the years of experince and name of staff who charges amount 2200

select S_Fname,S_YOE
from staff s,room r
where s.s_id=r.s_id
and r.R_NO in(select r.R_NO
from room r, patient_record pa
where r.R_NO=pa.R_NO and pa.amount= 2200);

--26)display the jobtype name  of the staff who is assigned to room number 26

select J_name
from jobtype j, staff s
where s.j_id=j.j_id
and s.s_id in(select s.s_id
from room r, staff s
where r.s_id=s.s_id and r.R_NO=26);

--27)display bed number and room number of the patients treated by 'Malcolm'

select pr.bed_no, pr.r_no
from patient_record pr
where pr.r_no IN (select r1.r_no
from room r1, staff s
where s.s_id=r1.s_id and s.s_fname= 'Malcolm');

--28)display the job type of the staff who had treated 'Price Oneal'

select j.j_name
from jobtype j, staff s
where s.j_id=j.j_id and s.s_id in(select pr.s_id
from prescription pr
where pr.p_id IN(select p.p_id
from patient p
where p.p_fname='Price' and p.p_lname='Oneal'));

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--VIEWS

--1] retrive the name and id of insurance

CREATE VIEW INSURANCE1_VIEW AS
SELECT i_id, i_name
FROM  insurance;
select * from INSURANCE1_VIEW ;

--2] display the room numbers to which staff Molly is appointed

CREATE  VIEW medTest5 as
SELECT R_NO
FROM  room r, staff s
WHERE r.s_id=s.s_id and s.S_Fname like '%Molly%';
select * from medTest5 ;

--3] staff who will prescribe Lovastatin

CREATE  VIEW  DoctorPrescription1 as
SELECT S_Fname,S_Lname
FROM staff s, test t 
WHERE s.s_id = t.s_id
and t.PR_ID in(select t.PR_ID
from test t, prescription pr
where t.PR_ID=pr.PR_ID AND pr.Med_name like '%Cephalexin%');
select * from DoctorPrescription1;


--4] patient who will be treated by MacKenzie

CREATE  VIEW  DoctorPatient as
SELECT P_Fname,P_Lname
FROM patient p,  prescription pr 
WHERE p.P_ID=pr.P_ID
and pr.s_id in(select pr.s_id
from staff s, prescription pr
where pr.s_id=s.s_id AND s.S_Fname like '%MacKenzie%');
select * from DoctorPatient ;

--5] staff who has salary greater than 50000

CREATE  VIEW staffSal1 as
SELECT s_id,S_Fname,S_Lname
FROM staff s 
WHERE s.S_Salary > 50000;
select * from staffSal1 ;

--6] display the patient record id to whom nurse mallcom was allocated

CREATE  VIEW  PatientNurse as
SELECT rec_id
FROM patient_record pa, Room r
WHERE pa.R_NO=r.R_NO
and r.s_id in(select r.s_id
from staff s, Room r
where r.s_id=s.s_id AND s.S_Fname like '%Malcolm%');
select * from PatientNurse ;


--7] retrive all the names of staff who are Radiologist

CREATE  VIEW JOBTS as
SELECT s_id,S_Fname,S_Lname
FROM staff s , jobtype j
WHERE s.J_id= j.J_id and j.J_name like '%Radiologist%';
select * from JOBTS ;

--8] display the patients first name and last name who have taken Lic insurance

CREATE  VIEW patientINS as
SELECT P_Fname,P_Lname
FROM  insurance i, patient p 
WHERE i.i_id=p.i_id and i.i_name like '%LIC%';
select * from patientINS ;

--9] display the tests conducted by staff of name Micah

CREATE  VIEW staffTest1 as
SELECT T_name
FROM  test t, staff s 
WHERE t.s_id=s.s_id and s.S_Fname like '%Micah%';
select * from staffTest1 ;

--10] display the tests after which Amlodipine Besylate medicine needs to be taken

CREATE  VIEW medTest2 as
SELECT T_name
FROM  test t, prescription pr
WHERE t.PR_ID=pr.PR_ID and pr.Med_name like '%Amlodipine Besylate%';
select * from medTest2 ;


--------------------------------------------------------------------------------------------------------------------------------------------------------
--MULTIPLE JOINS

--1.Retrieve staff details of the nurse/ward boy assigned to the room
SELECT *
FROM staff 
NATURAL JOIN room;

--2. Display the jobtype of all the staff members
SELECT jobtype.j_id,jobtype.j_name, staff.s_id
FROM jobtype
INNER JOIN staff ON jobtype.j_id=staff.j_id;

--3. Display patient name who has been prescribed the prescription.
SELECT patient.p_fname, prescription.pr_id
FROM patient
LEFT JOIN prescription ON patient.p_id = prescription.p_id
ORDER BY patient.p_fname;

--4.Retrieve staff id and staff name assigned to the rooms.
SELECT room.r_no, staff.s_id, staff.s_fname
FROM room
RIGHT JOIN staff ON room.s_id=staff.s_id
ORDER BY room.s_id;

--5. Retrieve the test name prescribed to the patients
SELECT test.t_name, prescription.pr_id
FROM test
INNER JOIN prescription ON test.pr_id = prescription.pr_id
ORDER BY test.t_name;

--6.Retrieve patient names of each prescription id.
SELECT patient.p_fname, prescription.pr_id
FROM patient
FULL OUTER JOIN prescription ON patient.p_id=prescription.p_id
ORDER BY patient.p_fname;

--7.Display all the test name , test date and their respective prescription date
SELECT test.t_name, test.t_date,prescription.pr_date
FROM test
FULL JOIN prescription
ON test.pr_id=prescription.pr_id;

--8.Display the staff id who prescribed the test
SELECT test.t_name, prescription.s_id
FROM test
INNER JOIN prescription ON test.pr_id = prescription.pr_id
ORDER BY test.t_name;

--9.Display the record id ,bed number and floor number whose room number is 2
SELECT rec_id,bed_no,r_no,r_floorno
FROM patient_record
NATURAL JOIN room
WHERE r_floorno=2;


--10.Retrieve the insurance company name of the patients
SELECT insurance.i_name, patient.p_id
FROM insurance
INNER JOIN patient ON insurance.i_id = patient.i_id
ORDER BY insurance.i_name;

------------------------------------------------------------------------------------------------------------------------------------

--Different Clauses & Functions

--1] Display the average salary of all doctors
select AVG(s.S_Salary) avg_salary,j.J_id
from staff s, jobtype j
where j.J_id=s.J_id and (j.J_name<>'Nurse') and (j.J_name<>'Ward boy') and (j.J_name<>'Lab technician') and (j.J_name<>'Radiologist') and (j.J_name<>'Receptionist') 
GROUP BY j.J_id;


--2] Display the average salary of all staff members
select AVG(s.S_Salary) avg_salary,jb.J_id
from staff s, jobtype jb
where jb.J_id=s.J_id 
GROUP BY jb.J_id;

--3] Display total number of tests each patient was prescribed
select p.P_ID, COUNT(t.T_id)
from Patient p, prescription pr, test t
where pr.P_ID = p.P_ID and pr.PR_ID=t.PR_ID
GROUP BY p.P_ID;

--4] Display number of staff members working for day shift based on their job type 
select COUNT(s.S_id),s.J_id
from jobtype j, staff s
where s.J_id=j.J_id and s.SHIFT='Day'
GROUP BY s.J_id;

--5] Display for each doctor total number of patients consulted and total insurance amt paid by those patients
select s.S_id , COUNT(pr.P_id) , SUM(i.i_amount)
from insurance i, patient p, prescription pr, staff s
where pr.p_id=p.P_id and pr.S_id=s.S_id
GROUP BY s.S_id
ORDER BY s.S_id;


--6] Display the doctors names who have prescribed the patients more than 2 tests
select s.s_fname , COUNT(t.t_id)
from staff s,test t, prescription pr
where s.s_id=pr.s_id and pr.p_id=t.pr_id
GROUP BY s.s_fname
HAVING COUNT (t.t_id)>=2;


--7] Display Count of how many times each insurance is used by different patients
select i.i_name, COUNT(p.i_id)
from patient p, insurance i
where p.i_id=i.i_id
GROUP BY i.i_name
HAVING count(p.i_id)>1;


--8] Display names and salary of the staff from highest to lowest years of experience
select s.s_fname,s.s_salary,s.s_yoe
from staff s
ORDER BY s.s_yoe DESC;

--9]Retrieve the name of the Gynaecologist who has 2 patients.
select s.s_fname , COUNT(pr.p_id)
from staff s,jobtype j, prescription pr
where s.j_id=j.j_id and j.j_name like '%Gynaecologist%' and s.s_id=pr.s_id
GROUP BY s.s_fname
HAVING COUNT (pr.p_id)>1;


--10]Display patient name and number of days they were admitted in chronological order
select distint p.p_fname, (pr.discharge_date - pr.admit_date)admitted_days
from patient_record pr, Patient p
where pr.p_id=p.p_id
ORDER BY p.p_fname;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--ARITHMETIC AND LOGIC OPERATIONS

--1] Display patient information who has undergone test FULL BODY CHECK UP in month of january
select p.p_id, p.p_fname, p.p_address
from patient p, prescription pr, test t
where p.p_id=pr.p_id AND pr.pr_id=t.pr_id
AND t.t_name like '%FULL BODY CHECK UP%'
AND t.t_date like '%-01-%';

--2]Display patient details who are diagnosed with Pain in joints
select p.p_id , p.p_fname , p.p_gender
from patient p , prescription pr 
where p.p_id=pr.p_id
AND pr.diagnosis like '%Pain in joint%';


--3] Display Ophthalmologist and Surgeon name and salary by giving 10% bonus 
select s.s_fname, (1.1*s.s_salary)
from staff s, jobtype j
where s.j_id=j.j_id
AND (j.j_name like '%Ophthalmologist%' OR j.j_name like '%Surgeon%');

--4]Display name and salary of staff members name starting with H and salary>200000
select s.s_fname, s.s_salary from staff s where
s.s_fname like '%H%'
OR s.s_salary>200000;

--5] Display the patient details who got admitted in room number 23,24 and 25
select p.p_fname, p.p_address 
from patient p, patient_record pr
where p.p_id=pr.p_id
AND pr.r_no IN (23,24,25);


--6] Display staff information whose salary ranges between 30k - 35k
select s.s_fname,s.s_salary 
from staff s
where s.s_salary
BETWEEN 30000 AND 35000;

--7] Display test name prescription id whose will get their test results between 16 april 2020 and 25 april 2020
select t.t_name, t.pr_id 
from test t
where t.tr_date
BETWEEN '16-04-2020' AND '25-04-2020';

--8] Display names of staff members who either is assigned to room or does tests.
select s.s_fname 
from staff s, room r 
where s.s_id=r.s_id
UNION
select s.s_fname 
from staff s, test t
where s.s_id=t.s_id;


--9] Display name of female patients who have insuarance amount>100000
select p.p_fname 
from patient p
where p.p_gender='female'
INTERSECT
select p.p_fname 
from patient p, insurance i
where i.i_amount>100000
and i.i_id=p.i_id;

--10] Display Doctors name who diagnosis the patient with visual error and have experience more than 5 years
select s.s_fname 
from staff s, prescription pr
where s.s_id=pr.s_id
AND pr.diagnosis=' Visual refractive errors'
INTERSECT
select s.s_fname 
from staff s, jobtype j
where s.j_id=j.j_id 
AND s.s_yoe>5;