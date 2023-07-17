USE sleep;
SELECT * FROM health;

-- Q1: What is the sleep duration compared to BMI and Physical Activity Levels?


SELECT COUNT(BMI), BMI FROM health 
	WHERE sleep_duration < 6.5 
	GROUP BY BMI;
-- The magority of people with less than 6.5 hours of sleep are overweight


SELECT COUNT(sleep_duration), sleep_duration FROM health 
	WHERE pa_level < 50 AND BMI LIKE '%Overweight%' 
	GROUP BY sleep_duration 
    ORDER BY COUNT(sleep_duration) DESC;
-- The majority of people who are overweight and have less than 50 physical activity levels only have 6.3 - 6.6 hours of sleep each night
-- This same query can be done for any physical activity level and BMI.



SELECT COUNT(sleep_duration), sleep_duration FROM health 
	WHERE pa_level BETWEEN 50 AND 80 AND BMI LIKE '%Overweight%' 
	GROUP BY sleep_duration 
	ORDER BY COUNT(sleep_duration) DESC;
-- People who have between 50 and 80 pa level and are overweight has come up as 8.1 hours being the most sleep. Why is this?
-- Many sources online claim that the more excercise someone does, the more they sleep, regardless of weight.



SELECT COUNT(sleep_duration), sleep_duration FROM health 
	WHERE pa_level BETWEEN 50 AND 80 AND BMI LIKE '%Normal%' 
	GROUP BY sleep_duration 
	ORDER BY COUNT(sleep_duration) DESC;
-- This is the same but with a normal BMI, the majority falls into the 7.2 hours of sleep category.
-- Being overweight compared to normal weight, doing a lot of physical activity, results in roughly an hour extra sleep per night.



-- Q2 Occupation against stress level and heart rate.















SELECT sleep_duration, COUNT(sleep_duration) FROM health 
	GROUP BY sleep_duration 
	ORDER BY COUNT(sleep_duration);