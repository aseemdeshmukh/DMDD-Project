USE FITNESS_360

INSERT INTO [USER] (UserID, UserName, UserDOB, UserGender, UserEmailID, UserPhoneNumber)
VALUES
    (1001, 'John Smith', '1994-05-15', 'Male', 'john.smith@gmail.com', '+1857332987'),
    (1002, 'Ayushi Patel', '1985-09-28', 'Female', 'ayushipatel@gmail.com', '+1987654321'),
    (1003, 'Alex Johnson', '1995-03-10', 'Non-binary', 'alex.johnson@yahoo.com', '+16173509876'),
    (1004, 'Emily Brown', '2000-11-02', 'Female', 'emily.brown@gmail.com', '+18575649843'),
    (1005, 'Michael Davis', '1982-07-20', 'Male', 'michael.davis@hotmail.com', '+1332098546'),
    (1006, 'Wei Chen', '1998-01-09', 'Female', 'wei_chen@gmail.com', '+1617498213'),
    (1007, 'Liam Garcia', '1993-12-18', 'Male', 'liam.garcia@yahoo.com', '+1248790365'),
    (1008, 'Sara Ali', '1987-04-30', 'Female', 'sara.ali@yahoo.com', '+18574999654'),
    (1009, 'William Rodriguez', '2002-06-25', 'Male', 'william.rodriguez@neu.edu', '+18572731984'),
    (1010, 'Cheng Zhao', '1991-08-07', 'Male', 'cheng.henry@gmail.com', '+1857032777'),
    (1011, 'Sanjay Gupta', '2001-02-14', 'Male', 'sanjayg@gmail.com', '+16173742322'),
    (1012, 'Chloe Anderson', '1996-10-05', 'Female', 'chloe.anderson@gmail.com', '+18574443892');
	

INSERT INTO PROGRESS_REPORT (ReportID, UserID, ReportWeight, Report_Height, Report_Date)
VALUES
    (2001, 1001, 75.5, 1.75, '2023-10-10'), 
    (2002, 1002, 60.0, 1.62, '2023-10-12'), 
    (2003, 1003, 80.0, 1.685, '2023-10-15'), 
    (2004, 1004, 65.2, 1.555, '2023-10-18'), 
    (2005, 1005, 85.0, 1.8, '2023-10-20'), 
    (2006, 1006, 55.1, 1.6, '2023-10-22'), 
    (2007, 1007, 70.0, 1.7, '2023-10-25'), 
    (2008, 1008, 62.5, 1.65, '2023-10-28'), 
    (2009, 1009, 78.0, 1.72, '2023-10-30'), 
    (2010, 1011, 72.3, 1.68, '2023-11-03'), 
    (2012, 1012, 63.0, 1.6, '2023-11-06'); 




-- Insert values into FITNESS_GOALS
INSERT INTO FITNESS_GOALS (GoalID, Goal_Type, Goal_Target_Date, UserID)
VALUES
    (1, 'Weight Loss', '2024-01-01', 1001),
    (2, 'Weight Loss', '2024-02-01', 1002),
    (3, 'Weight Loss', '2024-03-01', 1003),
    (4, 'Weight Loss', '2024-04-01', 1004),
	(5, 'Shredding', '2024-05-01', 1005),
    (6, 'Shredding', '2024-06-01', 1006),
    (7, 'Shredding', '2024-07-01', 1007),
    (8, 'Shredding', '2024-08-01', 1008),
	(9, 'Strength', '2024-09-01', 1009),
    (10, 'Strength', '2024-10-01', 1010),
    (11, 'Strength', '2024-11-01', 1011),
    (12, 'Strength', '2024-12-01', 1012);
	

-- Insert values into WEIGHT_LOSS
INSERT INTO WEIGHT_LOSS (GoalID, Waist_Measurement)
VALUES
    (1, 32.5),
    (2, 35.0),
    (3, 33.0),
    (4, 34.2);

-- Insert values into STRENGTH
INSERT INTO STRENGTH (GoalID, One_Rep_Maximum)
VALUES
    (5, 350.0),
    (6, 200.0),
    (7, 280.0),
    (8, 190.0);

-- Insert values into SHREDDING
INSERT INTO SHREDDING (GoalID, Fat_Percentage)
VALUES
    (9, 10.0),
	(10, 14.0),
	(11, 16.0),
	(12, 12.0);

-- Inserting values into TRAINING_PLAN

INSERT INTO TRAINING_PLAN (TrainingPlan_ID, TrainingTime_inHrs, Training_Type)
VALUES
    (1, 1.5, 'Cardiovascular Health1'),
    (2, 2.0, 'Cardiovascular Health2'),
    (3, 1.8, 'Six Pack'),
    (4, 1.3, 'Lean Bulk'),
    (5, 1.9, 'Hypertrophy'),
    (6, 1.75, 'Endurance and Strength');
			
-- Inserting values into the GOAL_TRAINING_PLAN_ASSOCIATION table
INSERT INTO GOAL_TRAINING_PLAN_ASSOCIATION (Goal_TrainingPlan_ID, TrainingPlan_ID, GoalID)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 3),
    (4, 2, 4),
    (5, 3, 5),
    (6, 3, 6),
    (7, 4, 7),
    (8, 4, 8),
    (9, 5, 9),
    (10, 5, 10),
    (11, 6, 11),
    (12, 6, 12);


INSERT INTO EXERCISE (Exercise_ID, Exercise_Name, Exercise_Description, Muscle_Type)
VALUES
    -- Back exercises
    (1, 'Pull-Ups', 'Upper body pulling exercise', 'Back'),
    (2, 'Barbell Rows', 'Strengthens back muscles with weights', 'Back'),
    (3, 'Lat Pulldowns', 'Targets back muscles using a machine', 'Back'),
    (4, 'Rope Pull Down', 'Strengthens lower back muscles', 'Back'),
    (5, 'Deadlift Variations', 'Various deadlift exercises for back', 'Back'),

    -- Biceps exercises
    (6, 'Hammer Curls', 'Focuses on bicep brachialis muscle', 'Biceps'),
    (7, 'Preacher Curls', 'Isolated bicep exercise using bench', 'Biceps'),
    (8, 'Chin-Ups', 'Upper body exercise targeting biceps', 'Biceps'),
    (9, 'Cable Curls', 'Uses cables for bicep isolation', 'Biceps'),
    (10, 'Incline Dumbbell Curls', 'Works biceps at an incline angle', 'Biceps'),

    -- Chest exercises
    (11, 'Dumbbell Flyes', 'Targets chest muscles with dumbbells', 'Chest'),
    (12, 'Incline Chest Press', 'Different variations of push-ups', 'Chest'),
    (13, 'Chest Press Machine', 'Uses a machine for chest muscles', 'Chest'),
    (14, 'Dips', 'Focuses on lower chest and triceps', 'Chest'),
    (15, 'Chest Cable Flyes', 'Works chest muscles using cables', 'Chest'),

    -- Triceps exercises
    (16, 'Tricep Kickbacks', 'Targets triceps using dumbbells', 'Triceps'),
    (17, 'Skull Crushers', 'Isolated tricep exercise with barbell', 'Triceps'),
    (18, 'Tricep Rope Pushdowns', 'Uses ropes for tricep isolation', 'Triceps'),
    (19, 'Close Grip Bench Press', 'Focuses on triceps with narrow grip', 'Triceps'),
    (20, 'Tricep Dumbbell Extensions', 'Works triceps using dumbbells', 'Triceps'),

    -- Shoulder exercises
    (21, 'Shoulder lateral Raises', 'Targets side deltoids', 'Shoulders'),
    (22, 'Military Press', 'Strengthens shoulders and triceps', 'Shoulders'),
    (23, 'Front Dumbbell Raises', 'Focuses on front deltoids', 'Shoulders'),
    (24, 'Shrugs', 'Works upper traps and shoulders', 'Shoulders'),
    (25, 'Arnold Press', 'Engages multiple shoulder muscles', 'Shoulders'),

    -- Leg exercises
    (26, 'Lunges', 'Works multiple leg muscles', 'Legs'),
    (27, 'Leg Press', 'Strengthens legs using a machine', 'Legs'),
    (28, 'Calf Raises', 'Focuses on calf muscles', 'Legs'),
    (29, 'Leg Extensions', 'Targets quadriceps', 'Legs'),
    (30, 'Hamstring Curls', 'Works hamstring muscles', 'Legs'),

    -- Running variations
    (31, 'Treadmill Running 5 miles - Incline', 'Running on a treadmill with elevation', 'Running'),
    (32, 'Outdoor Running 5 miles- Uphill', 'Outdoor running on uphill terrain', 'Running'),
    (33, 'Treadmill Running - Sprint Intervals for 10 mins', 'High-intensity intervals on a treadmill- 15 seconds in Speed 3, 30 seconds in speed 5 or 6 and 15 seconds in speed 8 or 9 ', 'Running'),
    (34, 'Long Distance Outdoor Running for 8 miles', 'Extended distance running outdoors', 'Running'),
    (35, 'Trail Running for 2 miles', 'Running on trails with varied terrain', 'Running'),

	-- Abs exercises
	(36, 'Crunches', 'Basic abdominal exercise targeting rectus abdominis muscles', 'Abs'),
    (37, 'Plank for 1 minute', 'Core-strengthening exercise that engages multiple muscle groups including abs', 'Abs'),
    (38, 'Russian Twist', 'Exercise targeting obliques and improving core strength', 'Abs'),
    (39, 'Leg Raises', 'Strengthens lower abdominal muscles', 'Abs'),
    (40, 'Mountain Climbers', 'Full-body exercise engaging core muscles', 'Abs');


INSERT INTO WORKOUT_INFO (workinfo_ID, TrainingPlan_ID, Exercise_ID, Weights, set_s, Repetitions)
VALUES
    (1, 1, 31, 0.0, 0, 0),     
    (2, 1, 32, 0.0, 0, 0),
	(3, 1, 33, 0.0, 0, 0),     
    (4, 1, 12, 30, 3, 10),
	(5, 1, 26, 0.0, 3, 12),     
    (6, 1, 27, 90.0, 4, 10),
	(7, 1, 36, 15.0, 3, 12),     
    (8, 1, 37, .0, 2, 0),
	(9, 2, 31, 0.0, 0, 0),     
    (10, 2, 32, 0.0, 0, 0),
	(11, 2, 34, 0.0, 0, 0),     
    (12, 2, 35, 0.0, 0, 0),
	(13, 2, 36, 20.0, 3, 12),     
    (14, 2, 38, 15.0, 3, 12),
	(15, 2, 39, 0.0, 3, 12),     
    (16, 2, 40, 0.0, 3, 12),
	(17, 3, 36, 20.0, 3, 12),     
    (18, 3, 37, 0.0, 3, 0),
	(19, 3, 38, 20.0, 3, 16),		
    (20, 3, 39, 5.0, 3, 10),
	(21, 3, 40, 0.0, 3, 12),     
    (22, 3, 1, 20.0, 3, 10),
	(23, 3, 3, 100.0, 3, 12),     
    (24, 3, 12, 55.0, 3, 12),
	(25, 3, 22, 60.0, 3, 12),     
    (26, 3, 26, 180.0, 2, 10),
	(27, 3, 28, 90.0, 3, 15),     
    (28, 3, 29, 100.0, 3, 10),
	(29, 3, 30, 90.0, 3, 12),     
    (30, 3, 31, 0.0, 0, 0),
	(31, 4, 1, 20.0, 4, 12),     
    (32, 4, 2, 90.0, 3, 12),
	(33, 4, 3, 120.0, 3, 12),     
    (34, 4, 8, 0, 2, 10),
	(35, 4, 10, 30.0, 3, 12),     
    (36, 4, 11, 25.0, 4, 10),
	(37, 4, 12, 60.0, 3, 12),     
    (38, 4, 13, 125.0, 4, 12),
	(39, 4, 14, 35.0, 3, 12),     
    (40, 4, 17, 25.0, 4, 10),
	(41, 4, 18, 47.5, 4, 10),
	(42, 4, 24, 40.0, 2, 15),
	(43, 4, 25, 25.0, 4, 12),
	(44, 4, 27, 180.0, 4, 12),
	(45, 4, 28, 115.0, 3, 10),
	(46, 4, 29, 130.0, 3, 10),
	(47, 4, 36, 10.0, 3, 10),
	(48, 4, 37, 0.0, 1, 10),
	(48, 4, 38, 15.0, 4, 10),
	(48, 4, 39, 0.0, 3, 10),
	(49, 5, 3, 120.0, 4, 12),
	(50, 5, 4, 60.0, 4, 12),
	(51, 5, 5, 135.0, 4, 12),
	(52, 5, 11, 25.0, 4, 12),
	(53, 5, 12, 55.0, 4, 12),
	(54, 5, 13, 135.0, 4, 12),
	(55, 5, 21, 15.0, 4, 12),
	(56, 5, 22, 45.0, 4, 12),
	(57, 5, 23, 15.0, 4, 12),
	(58, 5, 26, 135.0, 4, 12),
	(59, 5, 28, 115.0, 4, 12),
	(60, 5, 30, 115.0, 4, 12),
	(61, 6, 2, 70.0, 3, 8),
	(62, 6, 3, 140.0, 3, 10),
	(63, 6, 4, 80.0, 4, 12),
	(64, 6, 5, 200.0, 6, 5),
	(65, 6, 6, 40.0, 3, 8),
	(66, 6, 7, 100.0, 3, 6),
	(67, 6, 12, 90.0, 3, 6),
	(68, 6, 13, 180.0, 4, 6),
	(69, 6, 14, 50.0, 4, 10),
	(70, 6, 15, 100.0, 4, 6),
	(71, 6, 19, 70.0, 4, 8),
	(72, 6, 20, 50.0, 3, 10),
	(73, 6, 21, 25.0, 3, 6),
	(74, 6, 22,	60.0, 4, 8),
	(75, 6, 24, 70.0, 3, 8),
	(75, 6, 26, 0.0, 4, 8),
	(75, 6, 28, 180.0, 3, 8),
	(75, 6, 29, 180.0, 4, 5),
	(75, 6, 30, 150.0, 3, 8);
    
INSERT INTO DIET_PLAN(Diet_Plan_ID, PlanName, PlanDescription)
VALUES
	(001, 'Protein Power', 'High Protein Diet plan'),
	(002, 'PowerFuel Plan', 'emphasizes a balanced intake of lean proteins, complex carbohydrates, and healthy fats'),
	(003,'Plant Based','Vegan Diet Plan'),
	(004,'Weight Loss', 'Weight Loss Diet plan'),
	(005, 'Peak Performance', 'Athlete performance based Diet Plan'),
	(006, 'Keto Kickstart', 'High-fat, low-carb ketogenic diet'),
	(007,'Gluten Free','Eliminates gluten-containing grains'),
	(008,'EnduraStrength Diet','structured to supply essential nutrients for muscular development and sustained energy levels');

INSERT INTO USER_DIET_PLAN_ASSOCIATION (User_DietPlan_ID, Diet_Plan_ID, UserID)
VALUES
    (1, 004, 1001),
    (2, 004, 1002),
    (3, 003, 1003),
    (4, 006, 1004),
    (5, 001, 1005),
    (6, 005, 1006),
    (7, 002, 1007),
    (8, 005, 1008),
    (9, 002, 1009),
    (10, 008, 1010),
    (11, 008, 1011),
    (12, 002, 1012);

INSERT into  FOOD( Food_ID, FoodName, Calories_per_serving, Carbohydrates , Proteins , Fats)
values
	(1,'Quinoa Salad with Mixed Vegetables and Grilled Chicken','450','40','25','15'),
	(2,'Salmon and Avocado Sushi Bowl','500','35','35','20'),
	(3,'Grilled Chicken Breasts','165','0','31','3.6'),
	(4,'Grilled salmon','150','0', '21','7'),
	(5,'Greek Yogurt with Almonds','200','15','20','8'),
	(6,'Quinoa Salad with Chickpeas','300','45','10','10'),
	(7,'Lentil and Vegetable Stir-Fry','250','45','15','5'),
	(8,'Grilled Chicken Salad','250','10','30','10'),
	(9, 'Vegetable Stir-Fry with Tofu (per serving','200','15','15','0'),
	(10,'Chicken and Quinoa Bowl','500','45','35','20'),
	(11, 'Sweet Potato and Black Bean Wrap', '450', '70','5','10'),
	(12, 'Avocado and Chicken Salad','400','8','20','30'),
	(13, 'Cauliflower Rice with Grilled Salmon','350','5','25','25'),
	(14, 'Grilled Chicken Salad with Olive Oil Dressing','350','10','30','20'),
	(15, 'Quinoa and Vegetable Stuffed Bell Peppers','200 ','30','8','6'),
	(16, 'Mediterranean Chickpea Salad','50 ','40','12','18'),
	(17, 'Salmon and Quinoa Bowl with Turmeric and Leafy Greens','800','0','5','20'),
	(18,'Berries and Greek Yogurt Parfait','150 ','20','12','3');


INSERT INTO FOOD_PORTION ( Portion_ID, Diet_Plan_ID, Food_ID,  PortionSize)
VALUES
	(1, 001,2,'10 oz bowl'),
	(2, 001,10,'12 oz bowl'),
	(3, 001,17,'8 oz bowl'),
	(4, 002,2,'12 oz bowl'),
	(5, 002,3,'12 oz bowl'),
	(6, 002,10,'12 oz bowl'),
	(7, 003,9,'10 oz bowl'),
	(8, 004,1,'10 oz bowl'),
	(9, 004,7,'12 oz bowl'),
	(10, 004,11,'12 oz bowl'),
	(11, 004,18,'12 oz bowl'),
	(12, 005,2,'12 oz bowl'),
	(13, 005,3,'10 oz bowl'),
	(14, 005,5,'12 oz bowl'),
	(15, 005,17,'12 oz bowl'),
	(16, 006,8,'10 oz bowl'),
	(17, 006,13,'10 oz bowl'),
	(18, 006,15,'12 oz bowl'),
	(19, 007,12,'12 oz bowl'),
	(20, 007,9,'12 oz bowl'),
	(21, 008,3,'12 oz bowl'),
	(22, 008,10,'12 oz bowl'),
	(23, 008,13,'12 oz bowl'),
	(24, 008,17,'12 oz bowl');

INSERT INTO COMMUNITY (Community_ID, Post, PostDate, Achievement, UserID)
VALUES
    (1, 'Completed a 5K run today! Feeling great!', '2023-09-20', '5K Run Achievement', 1001),
    (2, 'Hit a new personal best in weightlifting!', '2023-09-21', 'Weightlifting Personal Best', 1004),
    (3, 'Finished a challenging HIIT like session', '2023-09-22', 'High Intensity Session Accomplishment', 1002),
    (4, 'Worked on core strength exercises', '2023-09-23', 'Core Strength Training', 1002),
    (5, 'Started a new fitness program', '2023-09-24', 'New Fitness Program Initiated', 1003),
    (6, 'Completed a high-intensity interval training session', '2023-11-25', 'HIIT Workout Finished', 1006),
    (7, 'Biked 20 miles in the morning!', '2023-09-26', 'Morning Biking Achievement', 1007),
    (8, 'Attended a nutrition seminar', '2023-09-27', 'Nutrition Seminar Attended', 1008),
    (9, 'Improved flexibility with stretching exercises', '2023-09-28', 'Flexibility Improvement', 1009),
    (10, 'Reached a new goal in calisthenics', '2023-09-29', 'Calisthenics Goal Achieved', 1010),
    (11, 'Started a meditation routine', '2023-09-30', 'Meditation Routine Initiated', 1011),
    (12, 'Completed a group workout session', '2023-10-01', 'Group Workout Accomplished', 1012),
    (13, 'Achieved a personal record in swimming', '2023-10-02', 'Swimming Personal Record', 1001),
    (14, 'Working on improving endurance', '2023-10-03', 'Endurance Improvement', 1004),
    (15, 'Started a healthy eating challenge', '2023-10-04', 'Healthy Eating Challenge Started', 1002),
    (16, 'Focused on strength training today', '2023-10-05', 'Strength Training Focus', 1005),
    (17, 'Explored new hiking trails', '2023-09-06', 'Hiking Adventure', 1003),
    (18, 'Took a rest day to recover', '2023-09-07', 'Rest Day for Recovery', 1006),
    (19, 'Learning new yoga poses', '2023-11-08', 'Yoga Pose Learning', 1007),
    (20, 'Started a new fitness challenge with friends', '2023-09-09', 'Friend Fitness Challenge', 1008);


INSERT INTO WORKOUT_SESSION (Session_ID, Session_Date, Session_Starttime, Session_Endtime, UserID)
VALUES
    (100, '2023-11-15', '08:00:00', '09:30:00', 1001),
    (101, '2023-11-16', '09:30:00', '10:45:00', 1002),
    (102, '2023-11-17', '16:00:00', '17:30:00', 1003),
    (103, '2023-11-18', '07:00:00', '08:15:00', 1004),
    (104, '2023-11-19', '12:00:00', '13:15:00', 1005),
    (105, '2023-11-20', '10:30:00', '11:45:00', 1006),
    (106, '2023-11-21', '14:00:00', '15:15:00', 1007),
    (107, '2023-11-22', '18:30:00', '19:45:00', 1008),
    (108, '2023-11-23', '07:45:00', '09:00:00', 1009),
    (109, '2023-11-24', '17:00:00', '18:15:00', 1010),
    (110, '2023-11-25', '09:30:00', '10:45:00', 1011),
    (111, '2023-11-26', '15:00:00', '16:15:00', 1012);
