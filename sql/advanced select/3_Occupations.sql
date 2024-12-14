WITH RankedOccupations AS (
    SELECT
        NAME,
        OCCUPATION,
        ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS rn  -- herbir meslek icin name siralamasi
    FROM
        OCCUPATIONS
)
SELECT
    MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME END) AS Doctor,  -- eger occupation doctor ise name i al 
    MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME END) AS Professor, -- (max: null olmayan degeri secmek icin)
    MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME END) AS Singer,
    MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME END) AS Actor
FROM
    RankedOccupations
GROUP BY
    rn
ORDER BY
    rn; 

-- bence subquery ile de yapilabilirdi
