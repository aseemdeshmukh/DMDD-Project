# FITNESS TRACKING AND WORKOUT MANAGEMENT SYSTEM

Final Project DAMG 6210 - DMDD course- GROUP 7

Group Members:
1. Aseem Deshmukh
2. Karthik Panghat
3. Sheetal Pujari
4. Riya Sethi
5. Himanshu Walia

**Project Overview**
The project focuses on designing a comprehensive database for fitness tracking and management which can be used by a fitness business or a fitness enthusiast. The database enables user to track their fitness goals easily through a digital platform. This database design will form a foundation for a user-friendly fitness application, enabling users to interact with their fitness data and receive recommendations in order to achieve their goals.

**Background**
In today’s world, health and fitness is paramount for all individuals. Growing urbanization and rising middle class is leading to sedentary and hectic lifestyle, which is eventually attracting various diseases, thereby making fitness a necessity. The importance of regular exercise and diet are thus widely recognized. However, managing tracking progress can be challenging, and accessing personalized guidance can be expensive. Each Individuals has their own fitness goals. The goals can include weight loss, muscle gain, endurance enhancement or just managing a healthy lifestyle. Streamlining the goals and the fitness journey is thus important. With the advent of smartphones and wearables, there is an opportunity to develop a digital platform that could help an to customize his/her fitness journey. Such a system would even help a fitness business to help their clients. By making health and fitness accessible, the project aims to contribute to a healthy lifestyle to its users.

**Objectives**
The system plans to provide following features:
1.	Create user data with the personal information and fitness goals
2.	Create daily work out plan, information about sets and repetitions and track cardio
3.	Provide workout plans according to fitness goals (weight loss/gain, muscle mass gain, strength improvement etc.)
4.	Provide a progress report of weight loss/gain, BMI etc.
5.	Provide customized diet plan to achieve the fitness goals.
6.	Provide a space for sharing the fitness journey and achievements and interacting with fellow fitness enthusiasts.

**Entities**
1. User:
Attributes: UserID, name, gender,age,email_id,password
3. Fitness goals:
Attributes: GoalID, description,target_date,target_calories
4. Community:
Attributes: Community_ID, posts, content, post_date
5. Progress Report:
Attributes: Report_ID, date, weight, height, body_fat_percentage
6. Diet Plan:
Attributes: PlanID, Planname, PlanDescription, nutrientvalue
7. Meal Plan
Attributes: MealID, date, time, total_calories
8. Workout Info:
Attributes: weights, sets, repetitions
9. Exercise:
Attributes: ExerciseID, name, description
10. Group Activity:
Attributes: ActivityID, name, description, category
11. Daily Workout:
Attributes: PlanID, name, description
12. Workout session:
Attributes: SessionID, date, time_start, time_end
