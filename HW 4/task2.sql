DROP TABLE IF EXISTS petPet; 
DROP TABLE IF EXISTS petEvent; 


CREATE TABLE petPet (
    petname VARCHAR(20) ,
    owner VARCHAR(45) ,
    species VARCHAR(45) , 
    gender ENUM('M', 'F') ,
    birth DATE ,
    death DATE,
    PRIMARY KEY (petname, owner)  
);


CREATE TABLE petEvent (
    petname VARCHAR(20) ,
    eventdate DATE ,
    eventtype VARCHAR(15) ,
    remark VARCHAR(255),
    FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE,  
    PRIMARY KEY (petname, eventdate)  
);

------------------------- CUTOFF POINT ------------------------------


INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');


INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);  


INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');


INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '1995-05-15', 'litter', '5 kittens, 2 male, 3 female');


INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broke a rib');


INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Puffball', '2020-09-01', 'death', 'died');


DELETE FROM petPet
WHERE petname = 'Buffy' AND owner = 'Harold';


------------------------ CUTOFF POINT ------------------------------

-- Up to the end should be in task2.sql