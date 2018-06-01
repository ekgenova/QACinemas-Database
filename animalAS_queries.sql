#not neutered
SELECT 
    animal_id AS ID,
    animal_type AS Type,
    animal_name AS Name,
    neutered AS Neutered
FROM
    animals AS a
        JOIN
    animalhealth AS ah ON (a.animal_id = ah.Animals_animal_id)
WHERE
    ah.neutered = 'no'
GROUP BY animal_type;


#there longest, all unadopted animals and since when
SELECT 
    animal_id AS ID,
    animal_type AS Type,
    animal_name AS Name,
    animal_arrived AS Since
FROM
    (SELECT 
        animal_id,
            animal_type,
            animal_name,
            animal_arrived,
            date_adopted AS Adopted
    FROM
        animals AS a
    LEFT OUTER JOIN adoptedanimals AS aa ON (a.animal_id = aa.Animals_animal_id)
    WHERE
        date_adopted IS NULL
    GROUP BY a.animal_arrived) AS not_adopted;


#specific type
SELECT 
    animal_id AS ID,
    animal_name AS Name,
    animal_arrived AS Since
FROM
    (SELECT 
        animal_id, animal_name, animal_arrived, date_adopted
    FROM
        animals AS a
    LEFT OUTER JOIN adoptedanimals AS aa ON (a.animal_id = aa.Animals_animal_id)
    WHERE
        date_adopted IS NULL
            AND animal_type = 'dog'
    GROUP BY animal_id) AS not_null;


#white cats up for adoption
SELECT 
    animal_id AS ID,
    animal_name AS Name,
    animal_arrived AS Since,
    colour AS Colour
FROM
    (SELECT 
        a.animal_id,
            animal_name,
            animal_arrived,
            date_adopted,
            ac.colour
    FROM
        animals AS a
    LEFT OUTER JOIN adoptedanimals AS aa ON (a.animal_id = aa.Animals_animal_id)
    JOIN animal_colour AS ac ON (a.animal_id = ac.animal_id)
    WHERE
        date_adopted IS NULL
            AND animal_type = 'cat'
            AND ac.colour = 'white'
    ORDER BY a.animal_id) AS white_cats;


#customers subscribed to newsletter

SELECT 
    cust_id AS ID,
    cust_FName AS FirstName,
    cust_LName AS Surname,
    cust_email AS Email,
    cust_subscribed AS Subscribed
FROM
    customers
WHERE
    cust_subscribed = 'yes'
ORDER BY cust_id;


#total animals of each type
SELECT animal_type AS Type, COUNT(animal_type) AS Total FROM 
(SELECT animal_type, date_adopted FROM animals AS a LEFT OUTER JOIN adoptedanimals AS aa
ON (a.animal_id=aa.Animals_animal_id)
WHERE date_adopted IS NULL) AS total_unadopted
GROUP BY animal_type;


#specific adopted animal
SELECT 
    animal_id AS AnimalID,
    animal_type AS Type,
    animal_name AS Name,
    date_adopted AS AdoptedOn,
    CONCAT_WS (' ',cust_FName, cust_LName) AS 'By'
FROM
    animals AS a
        JOIN
    adoptedanimals AS aa ON (a.animal_id = aa.Animals_animal_id)
        JOIN
    customers AS c ON (aa.Customers_cust_id = c.cust_id)
WHERE
    c.cust_id = 1;
    

#total animals adopted this year
SELECT COUNT(Animals_animal_id) AS AdoptedThisYear FROM adoptedanimals AS aa
WHERE aa.date_adopted> 20171231;


#animals recovering from illness
SELECT 
    animal_id AS ID,
    animal_type AS Type,
    animal_name AS Name,
    health_condition AS Health
FROM
    animals AS a
        JOIN
    animalhealth AS ah ON (a.animal_id = ah.Animals_animal_id)
WHERE
    ah.health_condition = 'recovering'
GROUP BY animal_id;


# find non-vacced cats & dogs (others don't need)
SELECT animal_id AS AnimalID, animal_type AS Type, animal_name AS Name, vacc_code AS Needed
FROM
(SELECT a.animal_id, animal_type, animal_name, vacc_code, vacc_date FROM animals AS a LEFT OUTER JOIN animalvacc AS av
ON (a.animal_id=av.animal_id)
WHERE vacc_date IS NULL) AS not_vacced
WHERE animal_type='dog' OR animal_type='cat';