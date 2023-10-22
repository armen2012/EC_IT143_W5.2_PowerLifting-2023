/*****************************************************************************************************************
NAME:    Power_Lifting 2023 Scripts
PURPOSE: EC_IT143_W5.2

MODIFICATION LOG:
Ver       Date          Author            Description
-----   ----------   -----------       -------------------------------------------------------------------------------
1.0     18/10/2023   Armen Hagobian    1. Built this script for EC_IT143_W5.2



NOTES: 
Answers to questions you and other students created about your My Communities data sets.
 
******************************************************************************************************************/
-- My Comunity: Power_Lifting
-- Q1: Stacey Singleton
-- I'm interested in whether the powerlifters bodyweight has an effect of which type of lifts they are better at?
-- A1:- Well, first of all, strength doesnt scale arithmetically by body size but logarithmically, so smaller lifters will on average always be relatively stronger.
-- A double bodyweight deadlift is fairly trivial at 70kg but quite impressive at 140kg. Let us ask SQL. 

-- Query 01  - Shows strength to weight ratio

SELECT 
    Name,
    BodyweightKg,
    TotalKg,
    TotalKg / BodyweightKg AS StrengthToWeightRatio
FROM 
    [Power_Lifting 2023]
ORDER BY 
    StrengthToWeightRatio DESC;

-- Query 02 - Shows  totalKg increase by BodyWeightKg

SELECT 
    Name,
    BodyweightKg,
    TotalKg,
    LOG(BodyweightKg) AS LnBodyweight
FROM 
    [Power_Lifting 2023];



----------------------------------------------------------------
-- My Comunity: Power_Lifting
-- Q2: The group fintess instrcutor engage exercise classes that cater to a wide variety of fitness levels. 
-- What is the average amount they bench press? 
-- A2: The average Male/Female in their thirties can bench press 70 to 90 percent of their body weight. Let us ask SQL? 

SELECT 
    Sex,
    AVG(BestBenchKg) / AVG(BodyweightKg) * 100 AS AvgBenchPressPercentage
FROM 
    [Power_Lifting 2023] 
WHERE 
    Age >= 30 AND Age <= 39
GROUP BY 
    Sex;


--------------------------------------------------------------------
-- My Comunity: Power_Lifting
-- Q3: Personal Trainer 
--  When it comes to personal trainer, they are the essential part of helping gym members achieve their fitness goals. 
-- They will asst them in their work-outs, and they make sure that the weight fits according to their age?
-- A3: Simpliled equations were derived to calculate mean weight for age, so let us ask SQL? 

SELECT 
    Age,
    AVG(TotalKg) AS AvgTotalLifted
FROM 
    [Power_Lifting 2023]
GROUP BY 
    Age
ORDER BY 
    Age;



--------------------------------------------------------------------------
-- My Comunity: Power_Lifting
-- Q4: Stacey Singleton
-- If they are heavy, do they do better at a bench press as opposed to a best banch, where they have to also lift their bodyweight? 
-- Find the heaviest 5 lifters
-- A4: It depends on your definition of strength and also how much you weight. Let us ask SQL?  

SELECT 
    Name,
    BodyweightKg,
    BestBenchKg,
    BestBenchKg - BodyweightKg AS BodyweightAdjustedBench
FROM 
    [Power_Lifting 2023]
ORDER BY 
    BodyweightKg DESC
LIMIT 5;


-----------------------------------------------------------------------------
-- My Comunity: Power_Lifting
-- Q5: Coach
-- How will the coach determine the age with the weight of the person?
-- A5: Coaches are responsible for planning, organising and delivering an appropriate range of sports activites and programmes for individuals and teams. 

-- Calculate the average weight for each age
SELECT 
    Age,
    AVG(BodyweightKg) AS AverageWeight
FROM 
    [Power_Lifting 2023]
GROUP BY 
    Age
ORDER BY 
    Age;



-------------------------------------------------------------------------------

