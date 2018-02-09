# SQL Background

---
# 1. Definition of SQL

> SQL is Structured Query Language.
 
SQL is used to access and control data, and to use and communicate with the server.
 
# 2. SQL function 

## 2.1 Single Row Function

> This function is only executed for a single row and returns one result per row. 

- ### 1. Character functions
   
      - LOWER(column|expression) 
      > Converts alphabetic values to lowercase
      
      - UPPER(column|expression)
      > Converts alphabetic values to uppercase
      
      - INITCAP(column|expression)
      > Converts the first character of an alphabetic value to uppercase, and places the remaining 
        characters in lowercase
    
      - CONCAT(column1|expression1, column2|expression2)
      > Associates the first character value with the second character value. It is the same function 
        as the concatenation operator (||)
      
      - SUBSTR(column|expression, m[,n])
      > Returns the characters specified by the length of n characters from the character value starting 
        at position m (if m is negative, it starts counting from the end of the character value, if n is 
        omitted, all characters are returned to the end of the string)
      
      - LENGTH(column|expression) 
      > Returns the number of characters in the expression
      
      - INSTR(column|expression, ’string’, [,m], [n] ) 
      > Returns the numeric position of the specified string. Optionally, you can provide a search start location, m, 
        and the number of occurrences of the string, n. The default value for m and n is 1, which starts the search 
        from the beginning of the string and reports the results found first
      
      - LPAD(column|expression, n,  'string') 
      > Returns an expression filled with a character expression from the left to be n in length
      
      - RPAD(column|expression, n,  'string') 
      > Returns an expression filled with a character expression from the right to be n in length 
      
      - TRIM(leading|trailing|both, trim_character FROM trim_source) 
      > You can trim leading or trailing characters (or both) in a string. If trim_character or trim_source is 
        a character literal, you must enclose it in single quotation marks

      - REPLACE(text, search_string, replacement_string) 
      > Searches a string in a text expression and finds the string, replacing it with the specified 
        replacement string

- ### 2. Number functions

      - ROUND(column|expression, n) 
      > Rounds a column, expression, or value to n decimal places. If n is omitted, there are no decimal places. 
        (If n is negative, the number to the left of the decimal point is rounded.)
      
      - TRUNC(column|expression, n)
      > Truncates a column, expression, or value to n decimal places. If n is omitted, the default is 0
      
      - MOD(m,n) 
      > Returns the remainder of dividing m by n.

- ### 3. Date functions
     
     
     
- ### 4. Conversion functions

- ### 5. General functions


## 2.2 Multiple Row Functions

>


---

# 3. JOIN

## 3.1 Join Type

### - 1. Natural Join
    - > Select the rows in both tables that have the same values in all the corresponding columns

### - 2. Self Join
    - > 

### - 3. Nonequi Join
    - > Nonequijoin is a join condition that contains other operators than the equals operator
    
### - 4. Outer Join

#### - Lefter Outer Join
     
#### - Right Outer Join 

#### - Full Outer Join

---

# 4. DDL 문 사용하여 테이블 생성 및 관리

## 4.1 데이터베이스 객체

- 테이블

  > 기본 저장 단위이며 행으로 구성되어 있다.

- 뷰

  > 하나 이상의 테이블에 있는 데이터 부분 집합을 논리적으로 나타낸다.

- 시퀀스
	
  > 숫자 값을 생성한다.

- 인덱스
  
  > 일부 query 성능을 향샹시킨다.

- 동의어
  
  > 객체에 다른 이름을 부여한다.

## 4.2 CREATE TABLE 문

### 다른 유저의 테이블에 액세스
    
    > 테이블을 생성하려면 유저는 CREATE TABLE 권한이 있어야 하며 객체를 생성할 저장 영역이 있어야 한다. DBA는 DCL문을 사용하여 유저에게 권한을 부여할 수 있다.
    > 다른 유저가 소유한 테이블은 유저의 스키마에 없기 때문에 이러한 테이블에는 소유자의 이름을 접두어로 사용해야 한다.

	EX. user a의 입장
    
	SELECT *
	FROM userb.employees;

### DEFAULT 옵션

    > 열에 대한 값이 없는 행이 삽입되는 경우 NULL 값이 입력되는 것을 방지해주는 기능을 한다. 
    
	EX. DEFAULT 옵션 사용법

	CREATE TABLE dept( deptno	NUMBER(2),
			   dname	VARCHAR2(14),
			   loc		VARCHAR2(13),
			   create_date DATE DEFAULT SYSDATE);


### 데이터 유형

- VARCHAR2(size)
  
  > 가변 길이 문자 데이터

- CHAR(size)

  > 고정 길이 문자 데이터

- NUMBER(p, s)

  > 가변 길이 숫자 데이터

- DATE 

  > 날짜 및 시간 값

- LONG

  > 가변 길이 문자 데이터(최대 2GB)

- CLOB

  > 문자 데이터(최대 4GB)

- RAW and LONG RAW

  > 원시 이진 데이터

- BLOB

  > 바이너리 데이터(최대 4GB)

- BFILE

  > 외부 파일에 저장된 바이너리 데이터(최대 4GB)

- ROWID

  > 테이블에 있는 행의 고유한 주소를 나타내는 base-64 숫자 체계

### Datetime 데이터 유형

- TIMESTAMP

  > 소수 표시 초 단위의 날짜

- INTERVAL YEAR TO MONTH

  > 년, 월 간격으로 저장된다

- INTERVAL DAY TO SECOND

  > 일, 시, 분, 초 간격으로 저장된다

### 제약 조건

> 제약 조건은 테이블 레벨에서 규칙을 강제 적용한다
> 제약 조건은 테이블에 종속 관계가 있는 경우 삭제를 방지한다

#### 1. 제약 조건 유형

- NOT NULL

  > 열에 null값을 포함할 수 없음을 지정

- UNIQUE

  > 테이블의 모든 행에 대해 값이 고유해야 하는 열 또는 열 조합을 지정

- PRIMARY KEY

  > 테이블의 각 행을 고유하게 식별

- FOREIGN KEY

  > 특정 테이블의 열과 참조 테이블의 열 간에 참조 무결성을 설정하고 적용하여
  > 한 테이블의 값이 다른 테이블의 값과 일치하도록 한다

- CHECK

  > 참이어야 하는 조건을 지정

#### 2. 제약 조건 지침

- 유저가 제약 조건 이름을 지정하거나 유저가 지정하지 않을 시 
  Oracle 서버가 SYS_Cn 형식을 사용하여 이름을 생성할 수 있다
	
- 다음 시점 중 하나에서 제약 조건을 생성한다

-- 1. 테이블이 생성되는 시점

-- 2. 테이블 생성 후

	- 열 또는 테이블 레벨에서 제약 조건을 정의한다

	- 데이너 딕셔너리에서 제약 조건을 확인한다

#### 3. 제약 조건 정의

	- 구문 :

		CREATE TABLE [schema.] table
		       (column datatype [DEFAULT expr]
		       [column_constraint],
		       ...
		       [table_constraint][,...]);

	- 열 레벨 제약 조건 구문 :

		column [CONSTRAINT constraint_name] constraint_type,

		EX. 열 레벨 제약 조건 예제

		CREATE TABLE employees(
		  employee_id NUMBER(6)
		    CONSTRAINT emp_emp_id_pk PRIMARY KEY,
		  first_name  VARCHAR2(20).
		...);

	- 테이블 레벨 제약 조건 구문 :

		column,...
		  [CONSTRAINT constraint_name] constraint_type
		  (column, ...),


		EX. 테이블 레벨 제약 조건 예제

