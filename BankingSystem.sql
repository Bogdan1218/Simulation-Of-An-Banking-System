
--CREAREA TABELEI CLIENTI
-----------------------------------------------------------
CREATE TABLE Clienti
(ID_Client NUMBER(6),
Tip_Client VARCHAR2(20),
Nume VARCHAR2(25),
Prenume VARCHAR2(25), 
CNP VARCHAR2(16),  
Data_Nastere DATE, 
Email VARCHAR2(40), 
Numar_Telefon VARCHAR2(15),
Sex VARCHAR2(10),
Stare_Civila VARCHAR(15),
ID_Adresa NUMBER(6),
Data_Inregistrare DATE, 
ID_Tip_Cont_Deschis NUMBER(2),
Scor_Credit NUMBER(5),
NIF VARCHAR2(20)
);
-----------------------------------------------------------

--CREAREA TABELEI ADRESE
-----------------------------------------------------------
CREATE TABLE Adrese
(ID_Adresa NUMBER(6),
Strada VARCHAR2(30),
Bloc VARCHAR2(10),
Numar NUMBER(6),
Cod_Postal VARCHAR2(6),
Judet VARCHAR2(20),
Localitate VARCHAR2(25),
ID_Tara NUMBER(6)
);
-----------------------------------------------------------

--CREAREA TABELEI TARI
-----------------------------------------------------------
CREATE TABLE Tari
(ID_Tara NUMBER(6),
Denumire_Tara VARCHAR2(25)
);
-----------------------------------------------------------

--CREAREA TABELEI Conturi
-----------------------------------------------------------
CREATE TABLE Conturi
(ID_Cont NUMBER(6),
Status_Cont VARCHAR2(15),
ID_Client NUMBER(6),
ID_Tip_Cont_Deschis NUMBER(2),
Data_Deschidere_Cont DATE,
Suma_Totala_Cont NUMBER (15),
Rata_Dobanzii NUMBER(2,2)
);
------------------------------------------------------------

--CREAREA TABELEI Tipuri_Conturi
------------------------------------------------------------
CREATE TABLE Tipuri_Conturi
(ID_Tip_Cont_Deschis NUMBER(6),
Denumire_Tip_Cont VARCHAR2(25),
Descriere_Tip_Cont VARCHAR2(250)
);
------------------------------------------------------------

--CREAREA TABELEI Angajati
------------------------------------------------------------
CREATE TABLE Angajati
(ID_Angajat NUMBER(6),
Nume VARCHAR2(25),
Prenume VARCHAR2(25),
CNP VARCHAR2(16),
Data_Angajare DATE,
Prefix_Functie VARCHAR2(15),
ID_Departament NUMBER(6),
Email VARCHAR2(30),
Numar_Telefon VARCHAR2(15),
Sex VARCHAR2(10),
Salariul NUMBER(7,2),
ID_Manager NUMBER(6)
);
------------------------------------------------------------

--CREAREA TABELEI Departamente
------------------------------------------------------------
CREATE TABLE Departamente
(ID_Departament NUMBER(6),
Denumire_Departament VARCHAR2(25),
ID_Adresa NUMBER(6)
);
------------------------------------------------------------

--CREAREA TABELEI Tranzactii
------------------------------------------------------------
CREATE TABLE Tranzactii
(
ID_Tranzactie NUMBER(6),
ID_Tip_Tranzactie NUMBER(6),
ID_Angajat NUMBER(6),
Data_Tranzactie DATE,
Suma_Implicata NUMBER(10,2),
ID_Cont_Receptie NUMBER(6),
ID_Cont_Transmisie NUMBER(6)
);
------------------------------------------------------------

--CREAREA TABELEI Tipuri_Tranzactii
------------------------------------------------------------
CREATE TABLE Tipuri_Tranzactii
(ID_Tip_Tranzactie NUMBER(6),
Denumire_Tranzactie VARCHAR2(30),
Descriere_Tranzactie VARCHAR2(250),
Comision_Tranzactie NUMBER(2,2)
);
------------------------------------------------------------

--CREAREA TABELEI Lista_Functii
------------------------------------------------------------
CREATE TABLE LISTA_FUNCTII
(Prefix_Functie VARCHAR2(15),
Denumire_Functie VARCHAR2(30),
Descriere_Functie VARCHAR2(300)
);
------------------------------------------------------------

--RESTRICTII INTEGRITATE Tabela Angajati
------------------------------------------------------------
ALTER TABLE Angajati
ADD CONSTRAINT ID_Angajat_PK PRIMARY KEY (ID_Angajat);
ALTER TABLE Angajati
ADD CONSTRAINT ID_Angajat_NN CHECK (ID_Angajat IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT CNP_UQ UNIQUE (CNP);
ALTER TABLE Angajati
ADD CONSTRAINT CNP_NN CHECK (CNP IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT Nume_NN CHECK (Nume IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT Prenume_NN CHECK (Prenume IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT Data_Angajare_NN CHECK (Data_Angajare IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT Prefix_Functie_NN CHECK (Prefix_Functie IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT Email_UQ UNIQUE (Email);
ALTER TABLE Angajati
ADD CONSTRAINT Email_NN CHECK (Email IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT Numar_Telefon_NN CHECK (Numar_Telefon IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT Sex_NN CHECK (SEX IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT Salariul_NN CHECK (Salariul IS NOT NULL);
ALTER TABLE Angajati
ADD CONSTRAINT ID_Departament_NN CHECK (ID_Departament IS NOT NULL);
------------------------------------------------------------

--RESTRICTII INTEGRITATE Tabela Departamente
----------------------------------------------------------
ALTER TABLE Departamente
ADD CONSTRAINT ID_Departament_PK PRIMARY KEY (ID_Departament);
ALTER TABLE Departamente
ADD CONSTRAINT Denumire_Departament_NN CHECK (Denumire_Departament IS NOT NULL);
ALTER TABLE Departamente
ADD CONSTRAINT ID_Adresa_NN CHECK (ID_Adresa IS NOT NULL);
----------------------------------------------------------


--RESTRICTII INTEGRITATE Tabela Tranzactii
----------------------------------------------------------
ALTER TABLE TRANZACTII
ADD CONSTRAINT ID_Tranzactie_PK PRIMARY KEY (ID_Tranzactie);
ALTER TABLE TRANZACTII
ADD CONSTRAINT ID_Tip_Tranzactie_NN CHECK (ID_Tip_Tranzactie IS NOT NULL);
ALTER TABLE TRANZACTII
ADD CONSTRAINT Data_Tranzactie_NN CHECK (Data_Tranzactie IS NOT NULL);
ALTER TABLE TRANZACTII
ADD CONSTRAINT ID_Cont_Receptie_NN CHECK (ID_Cont_Receptie IS NOT NULL);
ALTER TABLE TRANZACTII
ADD CONSTRAINT ID_Cont_Transmisie_NN CHECK (ID_Cont_Transmisie IS NOT NULL);
ALTER TABLE TRANZACTII
ADD CONSTRAINT SUMA_IMPLICATA_NN CHECK (SUMA_IMPLICATA IS NOT NULL);
----------------------------------------------------------

--RESTRICTII INTEGRITATE Tabela Tipuri_Conturi
----------------------------------------------------------
ALTER TABLE TIPURI_CONTURI
ADD CONSTRAINT ID_Tip_Cont_Deschis_PK PRIMARY KEY (ID_Tip_Cont_Deschis);
ALTER TABLE TIPURI_CONTURI
ADD CONSTRAINT Denumire_Tip_Cont_NN CHECK (Denumire_Tip_Cont IS NOT NULL);
ALTER TABLE TIPURI_CONTURI
ADD CONSTRAINT Descriere_Tip_Cont_NN CHECK (Descriere_Tip_Cont IS NOT NULL);
----------------------------------------------------------

--RESTRICTII INTEGRITATE Tabela Tipuri_Tranzactii
----------------------------------------------------------
ALTER TABLE TIPURI_TRANZACTII
ADD CONSTRAINT ID_TIP_TRANZACTIE_PK PRIMARY KEY (ID_TIP_TRANZACTIE);
ALTER TABLE TIPURI_TRANZACTII
ADD CONSTRAINT Denumire_Tranzactie_NN CHECK (Denumire_Tranzactie IS NOT NULL);
ALTER TABLE TIPURI_TRANZACTII
ADD CONSTRAINT Descriere_Tranzactie_NN CHECK (Descriere_Tranzactie IS NOT NULL);
----------------------------------------------------------

--RESTRICTII INTEGRITATE Tabela Clienti
----------------------------------------------------------
ALTER TABLE CLIENTI
ADD CONSTRAINT ID_Client_PK PRIMARY KEY(ID_Client);
ALTER TABLE CLIENTI
ADD CONSTRAINT Tip_Client_NN CHECK (Tip_Client IS NOT NULL);
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_Nume_NN CHECK (Nume IS NOT NULL);
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_Prenume_NN CHECK (Prenume IS NOT NULL);
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_CNP_NN CHECK (CNP IS NOT NULL);
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_CNP_UQ UNIQUE(CNP);
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_Data_Nastere_NN CHECK (Data_Nastere IS NOT NULL);
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_Email_NN CHECK (Email IS NOT NULL);
ALTER TABLE CLIENTI 
ADD CONSTRAINT Clienti_Email_UQ UNIQUE (Email);
ALTER TABLE CLIENTI 
ADD CONSTRAINT Clienti_Numar_Telefon_NN CHECK (Numar_Telefon IS NOT NULL);
ALTER TABLE CLIENTI 
ADD CONSTRAINT Clienti_Sex_NN CHECK (Sex IS NOT NULL);
ALTER TABLE CLIENTI 
ADD CONSTRAINT Clienti_Stare_Civila_NN CHECK (Stare_Civila IS NOT NULL);
ALTER TABLE CLIENTI 
ADD CONSTRAINT Clienti_ID_Adresa_NN CHECK (ID_Adresa IS NOT NULL);
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_Data_Inregistrare_NN CHECK (Data_Inregistrare IS NOT NULL);
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_Scor_Credit_NN CHECK (Scor_Credit IS NOT NULL);
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_NIF_UQ UNIQUE (NIF);
----------------------------------------------------------

--RESTRICTII INTEGRITATE Tabela Conturi
----------------------------------------------------------
ALTER TABLE CONTURI 
ADD CONSTRAINT ID_Cont_PK PRIMARY KEY (ID_Cont);
ALTER TABLE CONTURI 
ADD CONSTRAINT Status_Cont_NN CHECK (Status_Cont IS NOT NULL);
ALTER TABLE CONTURI 
ADD CONSTRAINT Conturi_ID_Client_NN CHECK (ID_Client IS NOT NULL);
ALTER TABLE CONTURI 
ADD CONSTRAINT Conturi_ID_Tip_Cont_Deschis_NN CHECK (ID_Tip_Cont_Deschis IS NOT NULL);
ALTER TABLE CONTURI 
ADD CONSTRAINT Conturi_Data_Deschidere_Cont_NN CHECK (Data_Deschidere_Cont IS NOT NULL);
ALTER TABLE CONTURI
ADD CONSTRAINT Conturi_Suma_Totala_Cont_NN CHECK (Suma_Totala_Cont IS NOT NULL);
----------------------------------------------------------

--RESTRICTII INTEGRITATE Tabela Adrese
----------------------------------------------------------
ALTER TABLE ADRESE
ADD CONSTRAINT ID_Adresa_PK PRIMARY KEY (ID_Adresa);
ALTER TABLE ADRESE 
ADD CONSTRAINT Strada_NN CHECK (Strada IS NOT NULL);
ALTER TABLE ADRESE 
ADD CONSTRAINT Numar_NN CHECK (Numar IS NOT NULL);
ALTER TABLE ADRESE 
ADD CONSTRAINT Cod_Postal_NN CHECK (Cod_Postal IS NOT NULL);
ALTER TABLE ADRESE 
ADD CONSTRAINT Judet_NN  CHECK (Judet IS NOT NULL);
ALTER TABLE ADRESE 
ADD CONSTRAINT Localitate_NN CHECK (Localitate IS NOT NULL);
ALTER TABLE ADRESE
ADD CONSTRAINT Adrese_ID_Tara_NN CHECK (ID_Tara IS NOT NULL);
----------------------------------------------------------

--RESTRICTII INTEGRITATE Tabela Tari 
----------------------------------------------------------
ALTER TABLE TARI
ADD CONSTRAINT ID_Tara_PK PRIMARY KEY (ID_Tara);
ALTER TABLE TARI
ADD CONSTRAINT Denumire_Tara_NN CHECK (Denumire_Tara IS NOT NULL);
----------------------------------------------------------

--RESTRICTII INTEGRITATE Tabela Lista_Functii 
----------------------------------------------------------
ALTER TABLE LISTA_FUNCTII
ADD CONSTRAINT Prefix_Functie_PK PRIMARY KEY (Prefix_Functie);
ALTER TABLE LISTA_FUNCTII
ADD CONSTRAINT Denumire_Functie_NN CHECK (Denumire_Functie IS NOT NULL);
ALTER TABLE LISTA_FUNCTII
ADD CONSTRAINT Descriere_Functie_NN CHECK (Descriere_Functie IS NOT NULL);
----------------------------------------------------------

--RESTRICTII FOREIGN KEY Tabela Tranzactii
----------------------------------------------------------
ALTER TABLE TRANZACTII
ADD CONSTRAINT TIPURI_TRANZACTII_ID_TIP_TRANZACTIE_FK 
FOREIGN KEY(ID_TIP_TRANZACTIE) REFERENCES TIPURI_TRANZACTII(ID_TIP_TRANZACTIE);
----------------------------------------------------------

--RESTRICTII FOREIGN KEY Tabela Angajati -> Departamente
----------------------------------------------------------
ALTER TABLE ANGAJATI
ADD CONSTRAINT ID_Departament_FK FOREIGN KEY (ID_DEPARTAMENT)
REFERENCES DEPARTAMENTE(ID_DEPARTAMENT);
----------------------------------------------------------

--RESTRICTII FOREIGN KEY Tabela Tranzactii -> Angajati
----------------------------------------------------------
ALTER TABLE TRANZACTII
ADD CONSTRAINT Tranzactii_ID_Angajat_FK FOREIGN KEY(ID_Angajat)
REFERENCES ANGAJATI(ID_Angajat);
----------------------------------------------------------

--RESTRICTII FOREIGN KEY Tabela Tranzactii -> Conturi
----------------------------------------------------------
ALTER TABLE TRANZACTII
ADD CONSTRAINT ID_Client_Receptie_FK FOREIGN KEY(ID_Cont_Receptie)
REFERENCES CONTURI(ID_Cont);
ALTER TABLE TRANZACTII
ADD CONSTRAINT ID_Client_Transmisie_FK FOREIGN KEY(ID_Cont_Transmisie)
REFERENCES CONTURI(ID_Cont);
----------------------------------------------------------

--RESTRICTII FOREIGN KEY Tabela Angajati -> Lista_Functii
----------------------------------------------------------
ALTER TABLE ANGAJATI
ADD CONSTRAINT Prefix_Functie_FK 
FOREIGN KEY(Prefix_Functie) REFERENCES LISTA_FUNCTII(Prefix_Functie);
----------------------------------------------------------

--RESTRICTII FOREIGN KEY Tabela Clienti -> Adrese
----------------------------------------------------------
ALTER TABLE CLIENTI
ADD CONSTRAINT Clienti_ID_Adresa_FK FOREIGN KEY(ID_Adresa)
REFERENCES ADRESE(ID_Adresa);
----------------------------------------------------------

--RESTRICTII FOREIGN KEY Tabela Adrese -> Tari
----------------------------------------------------------
ALTER TABLE ADRESE
ADD CONSTRAINT ID_Tara_FK
FOREIGN KEY(ID_Tara) REFERENCES TARI(ID_Tara);
----------------------------------------------------------

--RESTRICTII FOREIGN KEY Tabela Conturi -> Tipuri Conturi
----------------------------------------------------------
ALTER TABLE CONTURI
ADD CONSTRAINT Conturi_ID_Tip_Cont_Deschis_FK 
FOREIGN KEY(ID_Tip_Cont_Deschis) REFERENCES TIPURI_CONTURI(ID_Tip_Cont_Deschis);
----------------------------------------------------------

--RESTRICTIE BUCLA Angajati -> Angajati
----------------------------------------------------------
ALTER TABLE ANGAJATI
ADD CONSTRAINT ID_Manager_Bucla_FK 
FOREIGN KEY (ID_Manager) REFERENCES ANGAJATI(ID_Angajat);
----------------------------------------------------------

--RESTRICTIE FOREIGN KEY Tabela Conturi -> Clienti
----------------------------------------------------------
ALTER TABLE CONTURI 
ADD CONSTRAINT ID_Client_FK
FOREIGN KEY (ID_Client) REFERENCES CLIENTI(ID_Client);
----------------------------------------------------------

--RESTRICTIE FOREIGN KEY Tabela Adrese -> Departamente
----------------------------------------------------------
ALTER TABLE DEPARTAMENTE
ADD CONSTRAINT ID_Adresa_Dep_FK
FOREIGN KEY (ID_Adresa) REFERENCES ADRESE(ID_Adresa);
----------------------------------------------------------

--ADAUGARE INREGISTRARI IN TABELA 'LISTA_FUNCTII'
----------------------------------------------------------
INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('DG_ADMIN','Director General','Administreaza, coordoneaza si autorizeaza hotarari ce afecteaza in mod direct banca, aproba numarul de angajati si nivelul salarizarii personalului bancii, monitorizeaza functionarea adecvata si eficienta a sistemului intern, fiind responsabil de buna desfasurare a activitatilor bancare.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('VD_ADMIN','Vicedirector','Sustine activitatile Directorului General privind buna organizare a bancii, coordonarea si conducerea angajatilor intr-o maniera etica si adecvata, fiind responsabil de deciziile entitatii in lipsa Directorului General, preluandu-i functia pe o perioada de timp limitata, pana la revenirea acestuia.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('MAN_TRAD','Trading Manager','Supervizeaza si coordoneaza activitatile de tranzactionare ale bancii, analizeaza pietele financiare, isi asuma deciziile de tranzactionare si monitorizeaza performantele investitiilor realizate, evaluand strategiile utilizate.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('ANG_TRAD','Trader','Achizitioneaza si vinde active financiare in numele bancii cu scopul de a genera, in prezent sau pe termen scurt, profit, fiind renumerat cu un procent din acea suma, fiind nevoit sa actioneze in mod etic si sa reprezinte corespunzator valorile bancii.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('MAN_FIN','Manager Finante','Supervizeaza operatiunile financiare, coordoneaza bugetarea, raportarea financiara si analiza performantei bancii, fiind responsanbil pentru implementarea strategiilor, contribuind la stabilitatea si cresterea institutiei prin gestionarea adecvata a finantelor.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('TRZ_FIN','Trezorier','Gestioneaza lichiditatile, datoriile si activele companiei, asigurand ca banca este intotdeauna solvabila.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('CON_FIN','Contabil','Efectueaza operatiuni contabile si financiare zilnice, creeaza rapoarte financiare care ofera informatii relevante privind performanta entitatii, tinand evidenta elementelor de activ, datorii si capital.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('AT_FIN','Analist Tranzactii','Examineaza si evalueaza detaliile financiare ale tranzactiilor, asigurandu-se ca sunt in conformitate cu reglementarile bancii.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('MAN_IMP','Manager Imprumuturi','Supervizeaza activitatea echipei de imprumuturi, asigurandu-se ca se respecta metodologia privind procesele de imprumutand, si ofera suport administrativ.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('CONS_IMP','Consilier de Imprumuturi','Furnizeaza consultanta clientilor privind optiunile de imprumut, oferind detaliile necesare pentru ca planul de imprumut ales sa fie sustenabil si potrivit cu necesitatile clientilor.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('OFC_IMP','Ofiter de Credit','Preia, analizeaza si evalueaza cererile de imprumut de la clienti, determinand si evaluand eligibilitatea si riscul asociat acordarii imprumutului catre o anumita persoana fizica sau juridica.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('PRG_IT','Programator','Dezvolta si intretine software bancar, asigura securitatea informatica si integritatea sistemelor pentru gestionarea eficienta a datelor de natura financiara.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('MAN_HR','Manager Resurse Umane','Coordoneaza recrutarea si selectia de personal, dezvoltarea programelor de formare si implementarea politicilor de resurse umane, promovand un mediu de lucru bun si sanatos.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('ANG_HR','Specialist Resurse Umane','Participa la procesele de recrutare si selectie, intocmeste documentele legate de angajare si raspunde la intrebarile celorlalti angajati privind politicile interne.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('MAN_MRK','Manager Marketing','Coordoneaza strategiile de marketing pentru promovarea produselor si serviciilor de natura financiara, monitorizeaza concurenta, analizeaza piata si implementeaza tactici pentru consolidarea imaginii bancii.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('ANG_MRK','Specialist Marketing','Sprijina eforturile strategice ale Managerului de Marketing, implementeaza campanii publicitare, monitorizeaza performanta lor si culege date despre clienti.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('MAN_RC','Manager Relatii Clienti','Conduce echipa responsabila pentru interactiunea si satisfactia clientilor asociati bancii, se asigura ca cererile si problemele acestora sunt abordate eficient.');

INSERT INTO Lista_functii (prefix_functie,denumire_functie,descriere_functie)
VALUES ('ANG_RC','Specialist Relatii Clienti','Gestioneaza interactiunile zilnice cu clientii, raspunde la intrebari, rezolva problemele semnalate si furnizeaza asistenta in privinta produselor si serviciilor.');

----------------------------------------------------------

--ADAUGARE INREGISTRARI IN TABELA "Tari"
----------------------------------------------------------
INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (1,'Albania');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (2,'Andorra');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (3,'Anglia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (4,'Armenia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (5,'Azerbaidjan');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (6,'Austria');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (7,'Belarus');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (8,'Belgia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (9,'Bosnia si Hertegovina');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (10,'Andorra');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (11,'Anglia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (12,'Bulgaria');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (13,'Cehia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (14,'Cipru');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (15,'Croatia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (16,'Danemarca');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (17,'Elvetia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (18,'Estonia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (19,'Finlanda');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (20,'Franta');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (21,'Georgia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (22,'Germania');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (23,'Grecia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (24,'Irlanda');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (25,'Islanda');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (26,'Italia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (27,'Lituania');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (28,'Letonia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (29,'Luxemburg');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (30,'Muntenegru');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (31,'Norvegia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (32,'Olanda');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (33,'Polonia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (34,'Portugalia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (35,'Republica Moldova');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (36,'Romania');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (37,'Serbia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (38,'Scotia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (39,'Slovenia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (40,'Slovacia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (41,'Spania');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (42,'Suedia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (43,'Tara Galilor');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (44,'Turcia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (45,'Ucraina');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (46,'Ungaria');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (47,'SUA');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (48,'Japonia');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (49,'China');

INSERT INTO Tari (ID_Tara,Denumire_Tara)
VALUES (50,'India');
----------------------------------------------------------

--ADAUGARE INREGISTRARI IN TABELA "Adrese"
----------------------------------------------------------
INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1000,'Nicolae Iorga','51A',13,'133421','Bucuresti','Bucuresti','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1001,'Soseaua Berceni','42',5,'041914','Bucuresti','Bucuresti','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1002,'Piata Libertatii','14B',22,'410067','Oradea','Oradea','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1003,'Isaccei','24A',57,'820228','Tulcea','Tulcea','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1004,'Pescarilor','10A',37,'900538','Constanta','Constanta','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1005,'Vasile Lupu','14B',32,'100018','Prahova','Ploiesti','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1006,'Trandafirilor','4',11,'900189','Constanta','Constanta','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1007,'Gheorghe Doja','56C',7,'700376','Iasi','Iasi','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1008,'Calea Baciului','24B',2,'400230','Cluj-Napoca','Cluj-Napoca','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1009,'Vuia Traian','25A',3,'120262','Buzau','Buzau','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1010,'Livezii','17',41,'510170','Alba Iulia','Alba Iulia','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1011,'Republicii','33A',16,'337345','Hunedoara','Hunedoara','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1012,'Negru Radu','72D',36,'800157','Galati','Galati','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1013,'Nicolae Titulescu','15B',54,'011131','Bucuresti','Bucuresti','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1014,'Spitalului','52C',41,'720001','Suceava','Suceava','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1015,'Nicolae Balcescu','6A',15,'535500','Harghita','Gheorgheni','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1016,'Lapusneanu','6',1,'900196','Constanta','Constanta','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1017,'Poligonului','25B',27,'100070','Prahova','Prahova','36');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1018,'Baumberger','5E',15,'79024','null','Munich','22');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1019,'Gislason Circles','61',247,'31258','Arizona','Phoenix','47');

INSERT INTO Adrese(ID_Adresa,Strada,Bloc,Numar,Cod_Postal,Judet,Localitate,ID_Tara)
VALUES(1020,'Herzogchester','11',366,'19090','Oklahoma','Oklahoma','47');

----------------------------------------------------------

--ADAUGARE INREGISTRARI IN TABELA 'DEPARTAMENTE'
----------------------------------------------------------
INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(1,'Administrativ',1000);

INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(2,'Trading',1001);

INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(3,'Finante',1002);

INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(4,'Imprumuturi',1003);

INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(5,'IT',1004);

INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(6,'Resurse Umane',1005);

INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(7,'Marketing',1006);

INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(8,'Suport Clienti',1007);

INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(9,'Statistici',1008);

INSERT INTO Departamente(id_departament,denumire_departament,id_adresa)
VALUES(10,'Juridic',1009);
----------------------------------------------------------

--ADAUGARE INREGISTRARI IN TABELA 'ANGAJATI'
----------------------------------------------------------
INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1000,'Tu??','Mihail-Bogdan','5011224274942',TO_DATE('24-12-2022','DD-MM-YYYY'),'DG_ADMIN',1,'bogdantuta1812@gmail.com','0740940327','Masculin',20000,null);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1001,'Popescu','Valentin','1901128194610',TO_DATE('29-12-2022','DD-MM-YYYY'),'VD_ADMIN',1,'popvalentin@yahoo.com','0749501602','Masculin',16000,1000);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1002,'Felix','Cosmina','2880121167623',TO_DATE('28-12-2022','DD-MM-YYYY'),'VD_ADMIN',1,'cosminafelix1@yahoo.com','0752590318','Feminin',16000,1000);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1003,'Coman','Adrian','1950729185353',TO_DATE('06-01-2023','DD-MM-YYYY'),'MAN_FIN',3,'comanadrian100@gmail.com','0751051502','Masculin',8500,1000);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1004,'Otel','Daria','2911120269979',TO_DATE('05-01-2023','DD-MM-YYYY'),'MAN_TRAD',2,'oteldaria50@hotmail.com','0740529421','Feminin',10000,1000);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1005,'Cristescu','Isabela','2980918379278',TO_DATE('15-01-2023','DD-MM-YYYY'),'ANG_TRAD',2,'cristescuisb@hotmail.com','0762841234','Feminin',7000,1004);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1006,'Straton','Denis','1960711031196',TO_DATE('26-01-2023','DD-MM-YYYY'),'TRZ_FIN',3,'straton.denis2@gmail.com','0742500589','Masculin',7000,1003);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1007,'Cojocaru','Sofia','6010903191942',TO_DATE('05-02-2023','DD-MM-YYYY'),'TRZ_FIN',3,'cojsofia@yahoo.com','0775025872','Feminin',7000,1003);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1008,'Balint','Maria','2881025227440',TO_DATE('02-02-2023','DD-MM-YYYY'),'CON_FIN',3,'balint_maria17@yahoo.com','0767420172','Feminin',6500,1003);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1009,'Ene','Valentin','1891023385139',TO_DATE('10-03-2023','DD-MM-YYYY'),'CON_FIN',3,'enevalentin@hotmail.com','0774104152','Masculin',6000,1003);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1010,'Petrache','Florin','1960221377779',TO_DATE('20-03-2023','DD-MM-YYYY'),'ANG_TRAD',2,'florin_petrache99@hotmail.com','0748450142','Masculin',7000,1004);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1011,'Porumb','Daniel','1931117511849',TO_DATE('15-01-2023','DD-MM-YYYY'),'MAN_IMP',4,'porumbdaniel62@yahoo.com','0757246821','Masculin',9000,1000);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1012,'Dobre','Roxana','2980201031457',TO_DATE('26-03-2023','DD-MM-YYYY'),'CONS_IMP',4,'roxana_dobre@yahoo.com','0746109421','Feminin',5500,1011);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1013,'Popa','Denisa','2890311160209',TO_DATE('31-03-2023','DD-MM-YYYY'),'CONS_IMP',4,'popadenisa52@gmail.com','0772421012','Feminin',5500,1011);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1014,'Mincu','Silviu','1890430015653',TO_DATE('30-03-2023','DD-MM-YYYY'),'CONS_IMP',4,'silviumincu1@gmail.com','0756106281','Masculin',5500,1011);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1015,'Teodor','Andrei','1910125212364',TO_DATE('04-04-2023','DD-MM-YYYY'),'OFC_IMP',4,'teoandrei4124@hotmail.com','0741529561','Masculin',7000,1011);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1016,'Pavel','Sebastian','1931222510842',TO_DATE('04-04-2023','DD-MM-YYYY'),'PRG_IT',5,'pavel.seb@hotmail.com','0752196731','Masculin',12000,1000);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1017,'Precup','Ioana','2951212255778',TO_DATE('14-05-2023','DD-MM-YYYY'),'PRG_IT',5,'ioanaprecup12@gmail.com','0740103961','Feminin',11000,1000);

INSERT INTO Angajati (id_angajat,nume,prenume,cnp,data_angajare,prefix_functie,id_departament,email,numar_telefon,sex,salariul,id_manager)
VALUES (1018,'Cristescu','Bogdan','1930221285546',TO_DATE('13-11-2022','DD-MM-YYYY'),'AT_FIN',3,'cristescubog@gmail.com','0752504589','Masculin',5000,1003);

----------------------------------------------------------

--ADAUGARE INREGISTRARI IN TABELA "Tipuri_Tranzactii"
----------------------------------------------------------
INSERT INTO Tipuri_Tranzactii(ID_Tip_Tranzactie,Denumire_Tranzactie,Descriere_Tranzactie,Comision_Tranzactie)
VALUES(1,'Depunere','Adaugare de fonduri in contul bancar personal, asigurand accesul la servicii financiare, facilitand gestionarea eficienta a resurselor.',0);

INSERT INTO Tipuri_Tranzactii(ID_Tip_Tranzactie,Denumire_Tranzactie,Descriere_Tranzactie,Comision_Tranzactie)
VALUES(2,'Retragere','Permite extragerea de fonduri din contul bancar pentru a avea bani lichizi, asigurand accesul la numerar.',0);

INSERT INTO Tipuri_Tranzactii(ID_Tip_Tranzactie,Denumire_Tranzactie,Descriere_Tranzactie,Comision_Tranzactie)
VALUES(3,'Transfer Bancar','Asigura posibilitatea de a muta fonduri rapid intre contul clientului respectiv si alte persoane, rapid si eficient.',0.03);
----------------------------------------------------------

--ADAUGARE INREGISTRARI IN TABELA "Tipuri_Conturi"
----------------------------------------------------------
INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(1,'Cont Curent','Cont folosit pentru tranzactii zilnice, permite depuneri si retrageri frecvente.');

INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(2,'Cont Economii','Cont menit pentru economii si dobanzi, acces limitat la fonduri pentru a promova economisirea pe termen lung.');

INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(3,'Cont Investitii','Cont menit pentru cei interesati sa activeze pe pietele financiare si sa investeasca.');

INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(4,'Cont Studenti','Cont destinat studentilor de la facultatile publice, cat si private, avand beneficii specifice.');

INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(5,'Cont pentru Copii','Cont realizat pentru a economisi bani pentru viitorul copiilor, avand caracteristici si avantaje specifice.');

INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(6,'Cont Persoane Juridice','Cont sugerat pentru persoanele juridice care vor ca tranzactiile sa aiba loc rapid si sigur.');

INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(7,'Cont Pensii','Cont ce contribuie la siguranta financiara pe termen lung, gestionand economiile pentru perioada de pensionare.');

INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(8,'Cont Caritate','Cont pentru donatii si proiecte filantropice, oferind transparenta pentru gestionarea banilor destinati cauzelor sociale.');

INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(9,'Cont Escrow','Cont menit pentru persoanele juridice care vor sa transmita banii doar dupa indeplinirea unor conditii stabilite prin contract.');

INSERT INTO Tipuri_Conturi(ID_Tip_Cont_Deschis,Denumire_Tip_Cont,Descriere_Tip_Cont)
VALUES(10,'Cont Capital Social','Cont utilizat pentru depunerea banilor la infiintarea unei intreprinderi de catre persoana legala autorizata.');
----------------------------------------------------------



--ADAUGARE INREGISTRARI IN TABELA "Clienti"
----------------------------------------------------------
INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(1,'Persoana Fizica','Tanase','Florin','5030205140391',TO_DATE('05-02-2003','DD-MM-YYYY'),'florintanase12@gmail.com','0740627131','Masculin','Casatorit',1004,TO_DATE('11-05-2023','DD-MM-YYYY'),745,null);

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(2,'Persoana Fizica','Halep','Alexia','2910613280109',TO_DATE('13-06-1991','DD-MM-YYYY'),'alexiahalep@gmail.com','0752105014','Feminin','Casatorit',1007,TO_DATE('17-01-2022','DD-MM-YYYY'),638,null);

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(3,'Persoana Fizica','Hatley','Peggy','1900215516381',TO_DATE('15-02-1990','DD-MM-YYYY'),'peggyhatley22@hotmail.com','215-268-6436','Feminin','Necasatorit',1019,TO_DATE('26-10-2021','DD-MM-YYYY'),595,null);

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(4,'Persoana Fizica','Gojo','Satoru','5020304422344',TO_DATE('04-03-2002','DD-MM-YYYY'),'gojosatoru@yahoo.com','209-387-8793','Masculin','Necasatorit',1020,TO_DATE('30-04-2023','DD-MM-YYYY'),700,null);

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(5,'Persoana Fizica','Gheorghe','Valentin','1900428108331',TO_DATE('28-04-1990','DD-MM-YYYY'),'valigheorghe1@gmail.com','0742940162','Masculin','Necasatorit',1012,TO_DATE('30-04-2023','DD-MM-YYYY'),742,null);

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(6,'Persoana Juridica','Brancoveanu','Daniel','1901104355831',TO_DATE('04-11-1990','DD-MM-YYYY'),'danbrancoveanu2@gmail.com','0772612817','Masculin','Necasatorit',1003,TO_DATE('11-12-2022','DD-MM-YYYY'),681,15412450);

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(7,'Persoana Fizica','Calin','Violeta','6000128051727',TO_DATE('28-01-2000','DD-MM-YYYY'),'calinvioleta14@hotmail.com','0749621061','Feminin','Necasatorit',1005,TO_DATE('26-03-2023','DD-MM-YYYY'),594,null);

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(8,'Persoana Fizica','Gheorghiu','Alin','1990120114568',TO_DATE('20-01-1999','DD-MM-YYYY'),'alingheorghiu2@yahoo.com','0751620161','Masculin','Casatorit',1006,TO_DATE('06-08-2021','DD-MM-YYYY'),701,null);

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(9,'Persoana Fizica','Marinescu','Elena','2800601440330',TO_DATE('01-06-1980','DD-MM-YYYY'),'elenamarinescu@yahoo.com','0752716193','Feminin','Casatorit',1010,TO_DATE('30-03-2022','DD-MM-YYYY'),658,null);

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(10,'Persoana Juridica','Pavel','Adrian','1851206164178',TO_DATE('06-12-1985','DD-MM-YYYY'),'paveladrianbusiness@gmail.com','0748483017','Masculin','Casatorit',1011,TO_DATE('09-10-2021','DD-MM-YYYY'),712,'33883390');

INSERT INTO Clienti(ID_Client,Tip_Client,Nume,Prenume,CNP,Data_Nastere,Email,Numar_Telefon,Sex,Stare_Civila,ID_Adresa,Data_Inregistrare,Scor_Credit,NIF)
VALUES(11,'Persoana Fizica','Popa','Adrian','1890313156257',TO_DATE('13-03-1989','DD-MM-YYYY'),'adrianpopa77@yahoo.com','0773726126','Masculin','Casatorit',1013,TO_DATE('14-01-2023','DD-MM-YYYY'),627,null);

----------------------------------------------------------

--ADAUGARE INREGISTRARI IN TABELA "CONTURI"
----------------------------------------------------------
INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1000,'Activ',1,2,TO_DATE('12-05-2023','DD-MM-YYYY'),10500,0.03);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1001,'Activ',2,1,TO_DATE('18-01-2022','DD-MM-YYYY'),25000.41,0.03);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1002,'Activ',3,7,TO_DATE('29-10-2022','DD-MM-YYYY'),50125.90,0.04);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1003,'Activ',6,6,TO_DATE('15-12-2022','DD-MM-YYYY'),300000,0.05);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1004,'Activ',4,4,TO_DATE('02-05-2023','DD-MM-YYYY'),4500,0.03);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1005,'Inactiv',5,1,TO_DATE('03-05-2023','DD-MM-YYYY'),0,null);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1006,'Activ',7,1,TO_DATE('27-03-2023','DD-MM-YYYY'),15000,0.03);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1007,'Inactiv',8,1,TO_DATE('07-08-2021','DD-MM-YYYY'),0,null);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1008,'Activ',9,3,TO_DATE('01-04-2022','DD-MM-YYYY'),45000.61,0.03);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1009,'Activ',10,6,TO_DATE('10-10-2021','DD-MM-YYYY'),245000,0.05);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1010,'Inactiv',11,5,TO_DATE('15-01-2023','DD-MM-YYYY'),0,null);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1011,'Activ',5,5,TO_DATE('19-06-2023','DD-MM-YYYY'),5000,0.03);

INSERT INTO CONTURI(ID_Cont,Status_Cont,ID_Client,ID_Tip_Cont_Deschis,Data_Deschidere_Cont,Suma_Totala_Cont,Rata_Dobanzii)
VALUES(1012,'Activ',2,2,TO_DATE('25-01-2022','DD-MM-YYYY'),1500,0.03);


----------------------------------------------------------

--ADAUGARE INREGISTRARI IN TABELA "TRANZACTII"
---------------------------------------------------------
INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100001,1,null,TO_DATE('01-01-2024','DD-MM-YYYY'),5000,1001,1001);

INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100002,2,null,TO_DATE('05-01-2024','DD-MM-YYYY'),2580,1001,1001);

INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100003,3,1018,TO_DATE('14-03-2022','DD-MM-YYYY'),6510,1006,1007);

INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100004,3,1018,TO_DATE('21-07-2022','DD-MM-YYYY'),1000,1007,1006);

INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100005,3,1018,TO_DATE('15-09-2023','DD-MM-YYYY'),1000,1003,1009);

INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100006,3,1018,TO_DATE('21-12-2023','DD-MM-YYYY'),3600,1003,1009);

INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100007,1,null,TO_DATE('06-10-2023','DD-MM-YYYY'),2500,1011,1011);

INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100008,2,null,TO_DATE('24-12-2023','DD-MM-YYYY'),500,1006,1006);

INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100009,1,null,TO_DATE('11-01-2024','DD-MM-YYYY'),800,1001,1001);

INSERT INTO TRANZACTII(ID_Tranzactie,ID_Tip_Tranzactie,ID_Angajat,Data_Tranzactie,Suma_Implicata,ID_Cont_Receptie,ID_Cont_Transmisie)
VALUES(100010,3,1018,TO_DATE('14-05-2022','DD-MM-YYYY'),10000,1009,1009);

---------------------------------------------------------