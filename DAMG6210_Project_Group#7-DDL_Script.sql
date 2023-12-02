CREATE DATABASE FITNESS_360

USE FITNESS_360

-- Creating the USER table
CREATE TABLE [USER] (    
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
     UserDOB DATE CHECK (UserDOB <= DATEADD(YEAR, -18, GETDATE())),
    UserGender VARCHAR(10),
    UserEmailID VARCHAR(100),
    UserPhoneNumber VARCHAR(20),
    Age AS DATEDIFF(YEAR, UserDOB, GETDATE()) - 
            CASE WHEN (MONTH(UserDOB) > MONTH(GETDATE()) OR 
                       (MONTH(UserDOB) = MONTH(GETDATE()) AND DAY(UserDOB) > DAY(GETDATE())))
                 THEN 1
                 ELSE 0
            END
);

-- Create a function to calculate BMI
CREATE FUNCTION dbo.CalculateBMI (@Weight DECIMAL(5, 2), @Height DECIMAL(5, 2))
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @BMI DECIMAL(5, 2);
    SET @BMI = @Weight / (POWER(@Height, 2));
    RETURN @BMI;
END;

-- Create the PROGRESS_REPORT table using above function
CREATE TABLE PROGRESS_REPORT (
    ReportID INT PRIMARY KEY,
    UserID INT,
    ReportWeight DECIMAL(5, 2),
    Report_Height DECIMAL(5, 2),
    Report_BMI AS dbo.CalculateBMI(ReportWeight, Report_Height), -- Calculating BMI using the function
    Report_Date DATE,
    FOREIGN KEY (UserID) REFERENCES [USER](UserID) ON DELETE CASCADE
);

-- Create a function to calculate the duration in weeks between two dates
CREATE FUNCTION dbo.GetTargetDurationWeeks (@TargetDate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Duration INT;
    SET @Duration = DATEDIFF(WEEK, GETDATE(), @TargetDate);
    RETURN @Duration;
END;

-- Create the FITNESS_GOALS table with the computed column using the function
CREATE TABLE FITNESS_GOALS (
    GoalID INT PRIMARY KEY,
    Goal_Type VARCHAR(20),
    Goal_Target_Date DATE,
    UserID INT,
    Target_Duration_weeks AS dbo.GetTargetDurationWeeks(Goal_Target_Date),
    CONSTRAINT CHK_Valid_Goal_Type CHECK (Goal_Type IN ('Weight Loss', 'Shredding', 'Strength')), -- table level check constraints
    CONSTRAINT FK_UserID FOREIGN KEY (UserID) REFERENCES [USER](UserID) ON DELETE CASCADE
);

-- Creating the WEIGHT_LOSS table as a subtype of FITNESS_GOALS
CREATE TABLE WEIGHT_LOSS (
    GoalID INT PRIMARY KEY,
    Waist_Measurement DECIMAL(5, 2),
    CONSTRAINT FK_GoalID_WeightLoss FOREIGN KEY (GoalID) REFERENCES FITNESS_GOALS(GoalID) on DELETE CASCADE
);

-- Creating the STRENGTH table as a subtype of FITNESS_GOALS
CREATE TABLE STRENGTH (
    GoalID INT PRIMARY KEY,
    One_Rep_Maximum DECIMAL(6, 2),
    CONSTRAINT FK_GoalID_Strength FOREIGN KEY (GoalID) REFERENCES FITNESS_GOALS(GoalID) on DELETE CASCADE
);

-- Creating the SHREDDING table as a subtype of FITNESS_GOALS
CREATE TABLE SHREDDING (
    GoalID INT PRIMARY KEY,
    Fat_Percentage DECIMAL(5, 2),
    CONSTRAINT FK_GoalID_Shredding FOREIGN KEY (GoalID) REFERENCES FITNESS_GOALS(GoalID) on DELETE CASCADE
);


-- Creating the TRAINING_PLAN table
CREATE TABLE TRAINING_PLAN (
    TrainingPlan_ID INT PRIMARY KEY,
    TrainingTime_inHrs DECIMAL(4, 2),
	Training_Type VARCHAR(60)
);


CREATE TABLE GOAL_TRAINING_PLAN_ASSOCIATION (
    Goal_TrainingPlan_ID INT PRIMARY KEY,
    TrainingPlan_ID INT,
    GoalID INT,
    FOREIGN KEY (TrainingPlan_ID) REFERENCES TRAINING_PLAN(TrainingPlan_ID),
    FOREIGN KEY (GoalID) REFERENCES FITNESS_GOALS(GoalID)
);

-- Creating the EXERCISE table

	CREATE TABLE EXERCISE (
    Exercise_ID INT PRIMARY KEY,
    Exercise_Name VARCHAR(50),
    Exercise_Description VARCHAR(255),
    Muscle_Type VARCHAR(20) CHECK (Muscle_Type IN ('Back', 'Biceps', 'Chest', 'Triceps', 'Shoulders', 'Legs', 'Running', 'Abs')) NOT NULL -- table level check constraints
);

-- Creating the WORKOUT_INFO table (associative entity between TRAININg_plan AND exercise TABLE)
CREATE TABLE WORKOUT_INFO (
	workinfo_id INT,
    TrainingPlan_ID INT,
    Exercise_ID INT,
    Weights DECIMAL(6, 2),
    Set_s INT,
    Repetitions INT,
    PRIMARY KEY (TrainingPlan_ID, Exercise_ID),
    CONSTRAINT FK_TrainingPlan_ID_WorkoutInfo FOREIGN KEY (TrainingPlan_ID) REFERENCES TRAINING_PLAN(TrainingPlan_ID),
    CONSTRAINT FK_Exercise_ID_WorkoutInfo FOREIGN KEY (Exercise_ID) REFERENCES EXERCISE(Exercise_ID)
);


-- Creating the DIET PLAN table
CREATE TABLE DIET_PLAN (
    Diet_Plan_ID INT PRIMARY KEY,
    PlanName VARCHAR(100),
    PlanDescription VARCHAR(500)
);

CREATE TABLE USER_DIET_PLAN_ASSOCIATION (
    User_DietPlan_ID INT PRIMARY KEY,
    Diet_Plan_ID INT,
    UserID INT,
    FOREIGN KEY (Diet_Plan_ID) REFERENCES DIET_PLAN(Diet_Plan_ID),
    FOREIGN KEY (UserID) REFERENCES [USER](UserID)
);

-- Creating the FOOD table
CREATE TABLE FOOD (
    Food_ID INT PRIMARY KEY,
    FoodName VARCHAR(100),
    Calories_per_serving DECIMAL(6, 2),
    Carbohydrates DECIMAL(6, 2),
    Proteins DECIMAL(6, 2),
    Fats DECIMAL(6, 2)
);

-- Creating the FOOD PORTION table (associative entity)
CREATE TABLE FOOD_PORTION (
	Portion_ID INT,
    Diet_Plan_ID INT,
    Food_ID INT,
    PortionSize VARCHAR(50),
    PRIMARY KEY (Diet_Plan_ID, Food_ID),
    CONSTRAINT FK_Plan_ID FOREIGN KEY (Diet_Plan_ID) REFERENCES DIET_PLAN(Diet_Plan_ID),
    CONSTRAINT FK_Food_ID FOREIGN KEY (Food_ID) REFERENCES FOOD(Food_ID)
);

-- Creating the COMMUNITY table
CREATE TABLE COMMUNITY (
    Community_ID INT PRIMARY KEY,
    Post TEXT,
    PostDate DATE,
    Achievement VARCHAR(100),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES [USER](UserID) on delete CASCADE,
);

-- Creating the WORKOUT SESSION table
CREATE TABLE WORKOUT_SESSION (
    Session_ID INT PRIMARY KEY,
    Session_Date DATE,
    Session_Starttime TIME,
    Session_Endtime TIME,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES [USER](UserID)
);

Select * from [USER]
Select * from COMMUNITY
Select * from DIET_PLAN
Select * from EXERCISE
Select * from FITNESS_GOALS
Select * from FOOD
Select * from FOOD_PORTION
Select * from GOAL_TRAINING_PLAN_ASSOCIATION
Select * from PROGRESS_REPORT
Select * from SHREDDING
Select * from STRENGTH
Select * from TRAINING_PLAN
Select * from USER_DIET_PLAN_ASSOCIATION
Select * from WEIGHT_LOSS
Select * from WORKOUT_INFO

-- STORED PROCEDURES

--Stored Procedure : 1.	Get exercise details based on muscle type
CREATE PROCEDURE [dbo].[GetExerciseDetailByMuscleTypes] @Muscle_Type varchar(300)
AS
SELECT * FROM Exercise
WHERE Muscle_Type = @Muscle_Type

EXEC GetExerciseDetailByMuscleTypes @Muscle_Type = 'CHEST'

--Stored Procedure : 2.	Retrieve fitness goals along with associated training plans for a particular user

CREATE PROCEDURE GetUsersTrainingPlanExercises(@userId INT)
AS
BEGIN
    SELECT tp.TrainingPlan_ID, tp.Training_Type, e.exercise_name, ug.UserID
    FROM TRAINING_PLAN tp
    INNER JOIN GOAL_TRAINING_PLAN_ASSOCIATION gtp ON tp.TrainingPlan_ID = gtp.TrainingPlan_ID
    INNER JOIN FITNESS_GOALS g ON gtp.goalid = g.goalid
    INNER JOIN [USER] ug ON g.UserID = ug.UserID 
	INNER JOIN workout_info wi ON tp.TrainingPlan_ID = wi.TrainingPlan_ID
    INNER JOIN Exercise e ON wi.exercise_id = e.exercise_id
    WHERE ug.userid = @userId;
END

EXEC GetUsersTrainingPlanExercises @userId = '1005'

--Stored Procedure : 3.	Get progress report or community posts along with user details!

CREATE PROCEDURE GetUserProgressReport(@userId INT)
AS
BEGIN
    SELECT u.UserID, u.UserName, u.UserDOB, u.UserGender, u.UserEmailID, u.UserPhoneNumber,
           pr.ReportID, pr.ReportWeight, pr.Report_Height, pr.Report_BMI, pr.Report_Date
    FROM [USER] u
    LEFT JOIN PROGRESS_REPORT pr ON u.UserID = pr.UserID
    WHERE u.UserID = @userId;
END

EXEC GetUserProgressReport '1002'

--TRIGGER: This trigger updates the Report_Date in the PROGRESS_REPORT table when a new WORKOUT_SESSION is added for a user.

CREATE TRIGGER UpdateProgressReportDate
ON WORKOUT_SESSION
AFTER INSERT
AS
BEGIN
   UPDATE PROGRESS_REPORT
   SET Report_Date = GETDATE()
   FROM PROGRESS_REPORT P
   INNER JOIN inserted I ON P.UserID = I.UserID;
END;

-- CREATE VIEWS

-- User Progress View:
CREATE VIEW User_Progress AS
SELECT u.UserName, u.UserGender, pr.Report_Date, pr.ReportWeight, pr.Report_BMI
FROM [USER] u  
JOIN PROGRESS_REPORT pr ON u.UserID = pr.UserID

SELECT * FROM User_Progress

-- User workout sessions
CREATE VIEW v_userworkoutsessions AS
SELECT s.Session_ID, 
       s.Session_Date, 
       s.Session_Starttime, 
       s.Session_Endtime, 
       s.UserID,  
       u.UserName, 
       u.UserGender, 
       u.UserEmailID,
       u.Age
FROM WORKOUT_SESSION s 
INNER JOIN [USER] u ON s.UserID = u.UserID

SELECT * FROM v_userworkoutsessions

-- Workout Plan View:
CREATE VIEW Workout_Plan AS
SELECT u.UserName, tp.Training_Type, e.Exercise_Name, wi.Weights, wi.Set_s, wi.Repetitions
FROM TRAINING_PLAN tp 
INNER JOIN GOAL_TRAINING_PLAN_ASSOCIATION gtp ON gtp.TrainingPlan_ID = tp.TrainingPlan_ID   
INNER JOIN WORKOUT_INFO wi ON wi.TrainingPlan_ID = tp.TrainingPlan_ID
INNER JOIN EXERCISE e ON e.Exercise_ID = wi.Exercise_ID
INNER JOIN FITNESS_GOALS fg ON fg.GoalID = gtp.GoalID
INNER JOIN [USER] u ON fg.UserID = u.UserID

SELECT * FROM Workout_Plan

-- Community post view
CREATE VIEW v_community_posts AS
SELECT c.Post, c.PostDate, c.Achievement, 
       u.UserName, u.UserGender, u.UserEmailID
FROM COMMUNITY c 
INNER JOIN [USER] u ON u.UserID = c.UserID

SELECT * FROM v_community_posts


-- NON CLUSTERED INDEXES
CREATE NONCLUSTERED INDEX IX_User_Report_Date
ON PROGRESS_REPORT(UserID, Report_Date);

CREATE NONCLUSTERED INDEX IX_Muscle_Type
ON EXERCISE (Muscle_Type);

CREATE NONCLUSTERED INDEX IX_Achievement
ON Community (Achievement);

-- CONCURRENCY CONTROLS AND PERFORMANCE OPTIMIZATION

CREATE PROCEDURE InsertCommunityPost
    @Community_ID INT,
    @Post TEXT,
    @PostDate DATE,
    @Achievement VARCHAR(100),
    @UserID INT
AS
BEGIN
    BEGIN TRY
        -- Start a transaction
        BEGIN TRANSACTION;

        -- Check the length of the Post column
        IF DATALENGTH(@Post) > 300
        BEGIN
            -- Rollback the transaction and raise an error
            RAISERROR('The length of the Post column cannot exceed 300 characters.', 16, 1);
            ROLLBACK;
            RETURN;
        END

        -- Insert the data into the COMMUNITY table
        INSERT INTO COMMUNITY (Community_ID, Post, PostDate, Achievement, UserID)
        VALUES (@Community_ID, @Post, @PostDate, @Achievement, @UserID);

        -- Commit the transaction
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction in case of an error
        IF @@TRANCOUNT > 0
            ROLLBACK;

        -- Propagate the error to the calling application
        THROW;
    END CATCH
END;


-- ADDITIONAL UDF

CREATE FUNCTION dbo.ToCategorizeBMI (
    @Report_BMI DECIMAL(5, 2)
)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @Category NVARCHAR(50);

    IF @Report_BMI < 18.5
        SET @Category = 'Underweight';
    ELSE IF @Report_BMI >= 18.5 AND @Report_BMI < 25
        SET @Category = 'Normal';
    ELSE IF @Report_BMI >= 25 AND @Report_BMI < 30
        SET @Category = 'Overweight';
    ELSE
        SET @Category = 'Obesity';
    
    RETURN @Category;
END;

SELECT ReportID, Report_BMI, dbo.ToCategorizeBMI(Report_BMI) AS BMI_Category
FROM PROGRESS_REPORT;


-- Create a user-defined function to suggest personalized workouts and recommendations
CREATE FUNCTION dbo.GeneratePersonalizedWorkoutrecommendations (@UserID INT)
RETURNS NVARCHAR(500)
AS
BEGIN
    DECLARE @Recommendation NVARCHAR(500);

    -- Identify user's fitness goals and BMI
    DECLARE @UserBMI DECIMAL(5, 2);
    SELECT @UserBMI = Report_BMI
    FROM PROGRESS_REPORT
    WHERE UserID = @UserID;

    DECLARE @UserGoalType VARCHAR(20);
    SELECT @UserGoalType = Goal_Type
    FROM FITNESS_GOALS
    WHERE UserID = @UserID;

    -- Generate personalized workout recommendation based on BMI and goals
    SET @Recommendation = 'Here are your personalized workout recommendations based on your goal type (' + @UserGoalType + ') and BMI (' + CAST(@UserBMI AS NVARCHAR(10)) + ').';

    -- Add personalized workout advice or suggestions based on user's goals and BMI
    IF @UserBMI < 18.5
        SET @Recommendation = @Recommendation + ' Focus on strength and muscle gain exercises.';
    ELSE IF @UserBMI >= 18.5 AND @UserBMI < 25
        SET @Recommendation = @Recommendation + ' Incorporate a balanced mix of cardio and strength training.';
    ELSE IF @UserBMI >= 25 AND @UserBMI < 30
        SET @Recommendation = @Recommendation + ' Emphasize more on high-intensity interval training and calorie-burning workouts.';
    ELSE
        SET @Recommendation = @Recommendation + ' Prioritize cardio and calorie deficit workouts to manage weight effectively.';

    RETURN @Recommendation;
END;

DECLARE @WorkoutRecommendation NVARCHAR(500);
SET @WorkoutRecommendation = dbo.GeneratePersonalizedWorkoutrecommendations('1001');
SELECT @WorkoutRecommendation AS WorkoutRecommendation;


-- DATA ENCRYPTION
ALTER TABLE [USER] ADD [Encrypted_Email] VARBINARY(256);

 -- Creating Master Key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'DAMG_FITNESS#7';

 -- Creating Certificate 
CREATE CERTIFICATE EncryptionCert
WITH SUBJECT = 'Encryption for User Email';

 -- Creating Symmetric Key
CREATE SYMMETRIC KEY SymmetricKey
	WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE EncryptionCert;

 -- Encrypt Email Addresses and Insert into the Column
OPEN SYMMETRIC KEY SymmetricKey
    DECRYPTION BY CERTIFICATE EncryptionCert;
UPDATE [USER]
SET Encrypted_Email = ENCRYPTBYKEY(KEY_GUID('SymmetricKey'), UserEmailID);

CLOSE SYMMETRIC KEY SymmetricKey;
