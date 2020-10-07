CREATE DATABASE SCHOOL;
CREATE TABLE STUDENT(
	ID int NOT NULL PRIMARY KEY,
	NAME varchar(20),
    AGE int
);
CREATE TABLE TEACHER(
	ID int,
	NAME varchar(20),
	SUBJECT varchar(20),
    PRIMARY KEY (ID)
);
CREATE TABLE CLASS(
	ID int NOT NULL PRIMARY KEY,
	NAME varchar(20),
	TEACHER varchar(20)
);
CREATE TABLE PURSUEL(
	STUDENT_ID int,
    CLASS_ID int,
    RECORD int CHECK(0 <= RECORD AND RECORD <= 100),
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (ID),
    FOREIGN KEY (CLASS_ID) REFERENCES CLASS (ID),
    PRIMARY KEY (STUDENT_ID, CLASS_ID)
);

INSERT INTO STUDENT VALUES(1, '佐藤一郎', 20);
INSERT INTO STUDENT VALUES(2, '鈴木二郎', 21);
INSERT INTO STUDENT VALUES(3, '玉田三郎', 19);
INSERT INTO TEACHER VALUES(1, 'Tom', '数学');
INSERT INTO TEACHER VALUES(2, 'John', '国語');
INSERT INTO TEACHER VALUES(3, 'Andy', '数学');
INSERT INTO TEACHER VALUES(4, 'Bob', '英語');
INSERT INTO CLASS VALUES(1, '前期国語1',  2);
INSERT INTO CLASS VALUES(2, '前期国語2',  2);
INSERT INTO CLASS VALUES(3, '前期数学1',  1);
INSERT INTO CLASS VALUES(4, '前期数学1',  3);
INSERT INTO CLASS VALUES(5, '前期英語1',  4);
INSERT INTO PURSUEL VALUES(1, 1, NULL);
INSERT INTO PURSUEL VALUES(1, 2, NULL);
INSERT INTO PURSUEL VALUES(1, 3, NULL);
INSERT INTO PURSUEL VALUES(1, 4, NULL);
INSERT INTO PURSUEL VALUES(1, 5, NULL);
INSERT INTO PURSUEL VALUES(2, 1, NULL);
INSERT INTO PURSUEL VALUES(2, 2, NULL);
INSERT INTO PURSUEL VALUES(2, 3, NULL);
INSERT INTO PURSUEL VALUES(2, 4, NULL);
INSERT INTO PURSUEL VALUES(2, 5, NULL);
INSERT INTO PURSUEL VALUES(3, 1, NULL);
INSERT INTO PURSUEL VALUES(3, 2, NULL);
INSERT INTO PURSUEL VALUES(3, 3, NULL);
INSERT INTO PURSUEL VALUES(3, 4, NULL);
INSERT INTO PURSUEL VALUES(3, 5, NULL);


