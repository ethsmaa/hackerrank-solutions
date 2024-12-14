WITH RECURSIVE Numbers AS (
    SELECT 2 AS L 
    
    UNION
    
    SELECT L + 1
    FROM Numbers
    WHERE L < 1000
), -- all numbers from 2 to 1000 (inclusive)
NonPrimes AS (
    SELECT 
        N1.L AS Number, 
        N2.L AS Divisor
    FROM Numbers AS N1
    JOIN Numbers AS N2
        ON N2.L < N1.L
    WHERE N1.L % N2.L = 0
) -- non-prime numbers: numbers that are divisible by a number other than 1 and themselves

SELECT 
    GROUP_CONCAT(L SEPARATOR '&') AS PrimeNumbers -- split 
FROM Numbers
WHERE NOT EXISTS ( -- check if the number is not in the list of non-prime numbers
    SELECT 1
    FROM NonPrimes
    WHERE NonPrimes.Number = Numbers.L
)

