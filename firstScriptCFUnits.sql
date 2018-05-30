CREATE DATABASE IF NOT EXISTS cf_units;

USE cf_units;

SHOW DATABASES;

CREATE TABLE unit (
unitID INT NOT NULL AUTO_INCREMENT,
unitName VARCHAR(30),
unitAttribute VARCHAR(6),
PRIMARY KEY (unitID));

CREATE TABLE quest (
questID INT NOT NULL AUTO_INCREMENT,
questName VARCHAR(30),
questDifficulty VARCHAR(30),
unitID INT,
PRIMARY KEY (questID),
FOREIGN KEY (unitID) REFERENCES unit(unitID) ON DELETE CASCADE);

ALTER TABLE unit ADD unitTribe VARCHAR(30);
ALTER TABLE unit ADD unitCost VARCHAR(2);
ALTER TABLE unit MODIFY unitCost INT;
ALTER TABLE unit ADD unitSomething VARCHAR(30);
ALTER TABLE unit DROP unitSomething;


INSERT INTO unit (unitName, unitAttribute) VALUES ("Euclid","Blue"), ("Poisson", "Green");
INSERT INTO unit (unitName, unitAttribute) VALUES ("Fahrenheit", "Red"), ("Fourier", "Yellow");
INSERT INTO unit (unitName, unitAttribute) VALUES ("Azazel", "Green");
INSERT INTO unit (unitName, unitAttribute) VALUES ("Musashi Miyamoto", "Yellow");

UPDATE unit SET unitTribe="Academic" WHERE unitName = "Poisson";
UPDATE unit SET unitTribe="Academic" WHERE unitName = "Fahrenheit";
UPDATE unit SET unitTribe="Academic" WHERE unitName = "Fourier";

UPDATE unit SET unitName="Fermat", unitAttribute="Blue" WHERE unitID=8;

INSERT INTO quest (questName, questDifficulty, unitID) VALUES ("Azazel Invades", "Wizard", 5);
INSERT INTO quest (questName, questDifficulty, unitID) VALUES ("Musashi Miyamoto Invades", "Wizard", 6);

DELETE FROM unit WHERE unitAttribute="Blue";
DELETE FROM quest WHERE questName="Azazel Invades";
DELETE FROM unit WHERE unitID=6;

SELECT * FROM unit;
SELECT * FROM quest;