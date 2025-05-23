#1. List All Courses with Their Category Names
SELECT c.course_name, cat.category_name
FROM courses c
JOIN categories cat ON c.category_id = cat.category_id

#2. Count the Number of Courses in Each Category
SELECT cat.category_name, COUNT(c.course_id) AS course_count
FROM categories cat
LEFT JOIN courses c ON cat.category_id = c.category_id
GROUP BY cat.category_name;

#3. List All Students’ Full Names and Email Addresses
SELECT CONCAT(first_name, ' ', last_name) AS full_name, email
FROM `user`
WHERE role = 'student';

#4. Retrieve All Modules for a Specific Course Sorted by Module Order
SELECT module_name, module_order
FROM modules
WHERE course_id = 11     #change the course_id (From 1 to 11) to see respective modules
ORDER BY module_order;

#5. List All Content Items for a Specific Module
SELECT title, content_type, url
FROM content
WHERE module_id = 29;   #change the module_id (From 1 to 29) to see respective content items

#6. Find the Average Score for a Specific Assessment
SELECT SUM(score) / COUNT(assessment_id) AS Average_score
FROM assessment_submission
WHERE assessment_id = 2;   #change the module_id (From 1 to 28) to see respective content items

#7. List All Enrollments with Student Names and Course Names
SELECT CONCAT(u.first_name, ' ', u.last_name) AS Student_full_name,
		c.course_name AS Course_name, 
        DATE(e.enrolled_at) AS Enrolled_date
FROM enrollments e
JOIN courses c ON c.course_id = e.course_id
JOIN `user` u ON u.user_id = e.user_id 
WHERE `role`= 'student';

#8. Retrieve All Instructors’ Full Names
SELECT CONCAT(first_name, ' ', last_name) AS Instructor_full_name, email
FROM `user`
WHERE `role` = 'Instructor';

#9. Count the Number of Assessment Submissions per Assessment
SELECT a.assessment_name, COUNT(s.submission_id) AS No_of_Assessment_Submissions
FROM assessment_submission s
LEFT JOIN assessments a ON a.assessment_id = s.assessment_id
GROUP BY assessment_name;

#10. List the Top Scoring Submission for Each Assessment
SELECT a.assessment_name AS Assessment_name, MAX(s.score) AS Score, s.submission_id, s.submission_data
FROM assessment_submission s
JOIN assessments a ON a.assessment_id = s.assessment_id
GROUP BY a.assessment_name
ORDER BY Score desc;

#11. Retrieve Courses Created After a Specific Date
SELECT course_id, course_name, `description`
FROM courses
WHERE created_at > '2023-04-01';   #change date (2023-01-01 to 2023-05-31) to see respective Courses

#12. Find Students Who Have Not Submitted Any Assessments
SELECT u.user_id, concat(u.first_name, ' ', u.last_name) AS Student_Full_Name, u.email
FROM `user` u 
JOIN assessment_submission s ON u.user_id = s.user_id
WHERE u.`role` = 'student' AND s.submission_id IS NULL;

#13. List the Content for Courses in the 'Programming' Category
SELECT cont.content_id, cont.title AS TITLE, cont.content_type AS content_type, cont.url AS URL
FROM content cont
JOIN modules m ON cont.module_id = m.module_id 
JOIN courses c ON m.course_id = c.course_id
JOIN categories cat ON c.category_id = cat.category_id
WHERE category_name = 'Programming';

#14. Retrieve Modules That Have No Associated Content
SELECT m.module_id, m.module_name, m.module_order
FROM modules m
JOIN content cont ON m.module_id = cont.module_id
WHERE m.module_id AND cont.module_id IS NULL

#15. List Courses with the Total Number of Enrollments
SELECT c.course_name AS Course_Name, COUNT(e.enrollment_id) AS NO_of_Enrollments
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

#16. Find the Average Assessment Submission Score for Each Course
SELECT c.course_name AS Course_Name, AVG(s.score) AS Average_score
FROM courses c
JOIN modules m ON c.course_id = m.course_id
JOIN assessments a ON m.module_id = a.module_id
JOIN assessment_submission s ON a.assessment_id = s.assessment_id
GROUP BY  c.course_id, c.course_name;

#17. List Users with Their Number of Enrollments
SELECT u.user_id, CONCAT(u.first_name, ' ', last_name) AS User_name, COUNT(e.enrollment_id) AS No_of_Enrollments
FROM `user` u
JOIN enrollments e ON u.user_id = e.user_id
GROUP BY u.user_id;

#18. Find the Assessment with the Highest Average Score
SELECT  a.assessment_id AS Assessment_ID, a.assessment_name AS Assessment_Name, MAX(s.score) AS HIGHEST_SCORE
FROM assessments a
JOIN assessment_submission s ON s.assessment_id = a.assessment_id
GROUP BY a.assessment_id 
ORDER BY HIGHEST_SCORE Desc
LIMIT 1;

#19. List Courses Along with Their Modules and Content in Hierarchical Order
SELECT c.course_id, c.course_name, m.module_name, cont.title, cont.content_type, cont.url
FROM courses c
LEFT JOIN modules m ON c.course_id = m.course_id
LEFT JOIN content cont ON m.module_id = cont.module_id
ORDER BY c.course_name, m.module_name, cont.title

#20. Find the Total Number of Assessments Per Course
SELECT c.course_name AS Course_Name, COUNT(a.assessment_id) AS No_of_Assessments
FROM courses c
JOIN modules m ON c.course_id = m.course_id
JOIN assessments a ON m.module_id = a.module_id
GROUP BY c.course_name

#21. List All Enrollments from May 2023
SELECT enrollment_id, course_id, user_id, DATE(enrolled_at)
FROM enrollments
WHERE enrolled_at BETWEEN '2023-05-01' AND '2023-05-31';

#22. Retrieve Assessment Submission Details Along with Course and Student Information
SELECT s.submission_id AS Submission_ID,
		CONCAT(u.first_name, ' ', u.last_name) AS Student_name, 
        a.assessment_name AS Assessment_Name, c.course_name AS Course_Name, 
        s.submitted_at AS Submitted_At, s.score AS Score, s.submission_data AS Submission_Data
FROM assessment_submission s
LEFT JOIN `user` u ON s.user_id = u.user_id
LEFT JOIN assessments a ON s.assessment_id = a.assessment_id
LEFT JOIN modules m ON a.module_id = m.module_id
LEFT JOIN courses c ON m.course_id = c.course_id
GROUP BY Submission_ID;

#23. List All Users with Their Roles
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name, `role`
FROM `user`

#24. Find the Percentage of Passing Submissions for Each Assessment
SELECT 
    a.assessment_id, 
    a.assessment_name, 
    COUNT(s.submission_id) AS total_submissions, 
    SUM(CASE WHEN s.score >= 60 THEN 1 ELSE 0 END) AS passing_submissions,
    ROUND((SUM(s.score) * 100.0) / sum(a.max_score), 2) AS percentage
FROM assessments a
JOIN assessment_submission s ON a.assessment_id = s.assessment_id
GROUP BY a.assessment_id, a.assessment_name
ORDER BY a.assessment_id ASC;

#25. Find Courses That Do Not Have Any Enrollments
SELECT c.course_id, c.course_name
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL

