CREATE TABLE student
(
    id               int,
    name             varchar(255),
    surname          varchar(255),
    dob              date,
    primary_skill    varchar(255),
    created_datetime timestamp,
    updated_datetime timestamp,
    CONSTRAINT student_pk PRIMARY KEY (id)
);

CREATE TABLE phone
(
    id         int,
    student_id int,
    number     varchar(50),
    CONSTRAINT phone_pk PRIMARY KEY (id),
    CONSTRAINT phone_to_student_rel FOREIGN KEY (student_id)
        REFERENCES student(id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE subject
(
    id    INT NOT NULL AUTO_INCREMENT,
    name  varchar(255),
    tutor varchar(255),
    CONSTRAINT subject_pk PRIMARY KEY (id)
);

CREATE TABLE exam_result
(
    id          INT NOT NULL AUTO_INCREMENT,
    student_id int,
    subject_id int,
    mark       smallint,
    CONSTRAINT exam_result_pk PRIMARY KEY (id),
    CONSTRAINT result_to_student_rel FOREIGN KEY (student_id)
        REFERENCES student(id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        
    CONSTRAINT result_to_subject_rel FOREIGN KEY (subject_id)
        REFERENCES subject (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
