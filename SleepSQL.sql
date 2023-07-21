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


SELECT COUNT(occupation), occupation FROM health 
	WHERE stress_levell BETWEEN 3 AND 5 
	AND heart_rate BETWEEN 65 AND 75 
	GROUP BY occupation 
	ORDER BY COUNT(occupation);
-- The lowest stress level jobs are engineer, lawyer, nursem teacher, accountant. These also have a lower heart rate.


SELECT COUNT(occupation), occupation FROM health 
	WHERE stress_levell BETWEEN 6 AND 8 
	AND heart_rate BETWEEN 76 AND 86 
	GROUP BY occupation 
	ORDER BY COUNT(occupation);
-- There isnt a lot of people who have a highly stressful job and heartrate that is high. Why is this?
-- The type of jobs deemed stressful and have a high heart rate are mostly desk jobs


SELECT COUNT(occupation), occupation FROM health 
	WHERE stress_levell BETWEEN 6 AND 8 
	AND BMI LIKE '%Overweight%' OR '&Obese%'
	GROUP BY occupation 
	ORDER BY COUNT(occupation);
-- The most stressful occupations for overweight and obese people are a nurse (33) and salesperson (32).


SELECT COUNT(occupation), occupation FROM health 
	WHERE stress_levell BETWEEN 6 AND 8 
	AND BMI LIKE '%Normal%' OR '&Normalweight%'
	GROUP BY occupation 
	ORDER BY COUNT(occupation);
-- The most stressful occupation for normal and normal weight people is a doctor (65).
-- Why are the majority of nurses working in stressful conditions overweight/obese yet 
-- most doctors are normal weight?
-- "Doctors are medical experts who are required to perform a variety of procedures, while 
-- nurses are typically thought of as someone who is constantly ready to help the doctor."
-- Doctors vs nurse pay, can a doctor afford to live a healthier lifestyle than a nurse and salesperson?



-- Q3: Does having a sleep disorder affect how much physical activity a person can do?


SELECT COUNT(sleep_disorder), sleep_disorder FROM health 
	GROUP BY sleep_disorder;
-- The majority of people do not have a sleep disorder, 78 have sleep apnea and 77 have insomnia

SELECT COUNT(pa_level), pa_level FROM health 
	WHERE sleep_disorder NOT LIKE '%None%' 
    GROUP BY pa_level 
    ORDER BY COUNT(pa_level);
-- Lowest pa level is 30 and highest 90.
-- 62 people with a sleep disorder only have 45 pa level however, 34 people have 90 pa level and 21 have 71 
-- which is on the higher side of the pa levels of this sample of participants.
-- Is this because of a specific sleep disorder?

SELECT COUNT(pa_level), pa_level FROM health 
	WHERE sleep_disorder NOT LIKE '%None%' LIKE '%Sleep Apnea%'
    GROUP BY pa_level 
    ORDER BY COUNT(pa_level);







SELECT sleep_duration, COUNT(sleep_duration) FROM health 
	GROUP BY sleep_duration 
	ORDER BY COUNT(sleep_duration);