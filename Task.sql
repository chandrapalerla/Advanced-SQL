-- Select all primary skills that contain more than one word (please note that both ‘-‘ and ‘ ’ could be used as a separator).

select primary_skill from student
where jpop.primary_skill like '% %'
or primary_skill like '%-%';

--Select all students who does not have second name (it is absent or consists from only one letter/letter with dot).

select * from jpop.student
where surname is null
or surname = ''
or length(surname) = 1
or surname like '_.';

-- Select number of students passed exams for each subject and order result by number of student descending.

select  s.name, count(st.student_id) as number_of_students_passed 
from jpop.subject s
left join jpop.exam_result st on s.id  = st.subject_id
where st.mark >35
group by s.name
order by number_of_students_passed DESC ;

-- Select number of students with the same exam marks for each subject

select s.name ,count(er.subject_id) as  number_of_students 
from jpop.exam_result er
join jpop.subject s on er.subject_id  = s.id 
group by s.name ,er.mark
ORDER BY s.name, er.mark ;


--Select students who passed at least two exams for different subject

select er.student_id as studentId
from jpop.exam_result er 
left join jpop.subject s on er.subject_id  = s.id 
where er.mark >35
group by studentId
having  count(s.name)>2 
order by er.student_id

--Select students who passed at least two exams for the same subject.

select er.student_id as studentId,s.name as subjectName
from jpop.exam_result er 
left join jpop.subject s on er.subject_id  = s.id 
where er.mark >35
group by studentId,s.name
having  count(*)>=2 
order by er.student_id

--Select all subjects which exams passed only students with the same primary skills

select su.name
from jpop.exam_result er 
left join jpop.subject su on er.subject_id  = su.id
left join jpop.student st on er.student_id = st.id 
where er.mark > 35
group by su.name 
having COUNT(DISTINCT st.primary_skill) = 1;

--Select all subjects which exams passed only students with the different primary skills. It means that all students passed the exam for the one subject must have different primary skill

select su.name
from jpop.exam_result er 
left join jpop.subject su on er.subject_id  = su.id
left join jpop.student st on er.student_id = st.id 
where er.mark > 35
group by su.name 
having COUNT(DISTINCT st.primary_skill) = COUNT(st.primary_skill);

-- Select all students whose average mark is bigger than overall average mark

select avg(er.mark) AS average, er.student_id 
from jpop.exam_result er 
join jpop.student s on er.student_id = s.id
group by er.student_id
having average > (select avg(er.mark)
                   from jpop.exam_result er)	


--Select biggest mark for each student and add text description for the mark (use COALESCE and WHEN operators)
SELECT 
    s.id AS studentid, 
    s.name AS studentname,
    MAX(er.mark) AS max_mark,
    COUNT(
        CASE WHEN er.mark = MAX(er.mark) 
        THEN 1 
        end)
        AS subjects_with_max_mark
  FROM 
    jpop.student s
LEFT JOIN 
    jpop.exam_result er ON s.id = er.student_id
GROUP BY 
    s.id, s.name
ORDER BY 
    s.id;