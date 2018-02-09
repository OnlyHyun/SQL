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

		CREATE TABLE employees(
		  employee_id NUMBER(6),
		  first_name  VARCHAR2(20),
		  ...
		  job_id      VARCHAR2(10) NOT NULL,
		  CONSTRAINT emp_emp_id_pk
		    PRIMARY KEY (EMPLOYEE_ID));


---

# 5. DML 문을 이용하여 테이블 조작하기

> DML 문은 다음과 같은 경우에 쓰인다
- 테이블에 새 행 추가
- 테이블의 기존 행 수정
- 테이블에서 기존 행 제거

> 트랜잭션은 논리적 작업 단위를 형성하는 DML 문의 모음으로 구성된다

## 5.1 INSERT문

### - INSERT 문을 사용하여 테이블에 새 행을 추가할 수 있다

	EX. 
	
	INSERT INTO table [(column [, colimn...])]
	VALUES	    (value [, value...]);

### - null 값을 가진 행 삽입

	- 암시적 방법 : 열 리스트에서 열을 생략한다

	- 명시적 방법 : VALUES 절에서 NULL 키워드를 지정한다

### - 다른 테이블에서 행 복사

	- INSERT 문을 subquery로 작성한다

	- VALUES 절을 사용하면 안 된다

	- INSERT 절의 열 개수를 subquery의 열 개수와 일치시킨다

	EX.

	INSERT INTO sales_reps(id, name, salary, commission_pct) 
	  SELECT employee_id, last_name, salary, commission_pct 
	  FROM   employees 
	  WHERE  job_id LIKE '%REP%';

## 5.2 UPDATE문

### - UPDATE 문을 사용하여 테이블의 기존 값을 수정할 수 있다
> 필요한 경우 한 번에 두 개 이상의 행을 갱신할 수 있다


### - 테이블의 행 갱신

	- WHERE 절을 지정하면 특정 행에서 값이 수정된다
	
	- WHERE 절을 생략하면 테이블의 모든 행에서 값이 수정된다

	- 열 값을 NULL로 갱신하려면 SET column_name = NULL 을 지정한다

### - Subquery를 사용하여 두 개의 열 갱신

	EX.

	UPDATE table 
	SET     column =
				(SELECT column 
				 FROM table 
				 WHERE condition)
		[ , 
		 column = 
				(SELECT column 
				 FROM table 
				 WHERE condition)]
	[WHERE  condition ];
 

## 5.3 DELETE문

### - DELETE 문을 사용하여 테이블에서 기존 행을 제거할 수 있다

### - WHERE절을 지정하면 특정 행이 삭제된다

### - WHERE절을 생략하면 테이블의 모든 행이 삭제된다

### - 다른 테이블을 기반으로 행 삭제

	EX.

	DELETE FROM employees 
	WHERE  department_id = (SELECT department_id 
				FROM   departments 
				WHERE  department_name LIKE '%Public%');
	
## 번외) TRUNCATE 문

### - DML문이 아니라 DDL문이므로 쉽게 언두할 수 없다

### - 테이블은 빈 상태로, 테이블 구조는 그대로 남겨둔 채 테이블에서 모든 행을 제거한다

# 6. 데이터베이스 트랜잭션

## 데이터베이스 트랜잭션은 다음 중 하나로 구성된다

	- 데이터를 일관되게 변경하는 여러 DML문

	- 하나의 DDL문

	- 하나의 DCL문

## 첫번째 DML SQL 문이 실행될 때 시작된다
## 다음 상황 중 하나가 발생하면 종료된다

	- COMMIT 또는 ROLLBACK 문 실행

	- DDL 또는 DCL문 실행(자동 커밋)

	- 유저가 SQL Developer 또는 SQL*Plus를 종료

	- 시스템 중단

## COMMIT 및 ROLLBACK 문의 이점

	- 데이터 일관성 보장
	- 변경 사항을 영구 적용하기 전에 데이터 변경 사항 검토
	- 논리적으로 관련된 작업 그룹화

## 명시적 트랜잭션 제어문

- COMMIT			- 보류 중인 모든 데이터 변경 사항을 영구적으로 
				  적용하여 현재 트랜잭션을 종료한다

- SAVEPOINT name		- 현재 트랙재션 내에 저장점을 표시한다 

- ROLLBACK			- 보류 중인 모든 데이터 변경 사항을 폐기하여 현재 트랜잭션을 종료한다

- ROLLBACK TO SAVEPOINT name	- 현재 트랜잭션을 지정된 저장점으로 롤백한다. 이에 따라 롤백 중인
				  저장점 이후에 생성된 변경 사항 또는 저장점은 폐기된다

## 암시적 트랜잭션 처리

### 자동 커밋은 다음 상황에서 발생한다

	- DDL 문이 실행되는 경우

	- DCL 문이 실행되는 경우

	- COMMIT 또는 ROLLBACK 문을 명시적으로 실행하지 않은
	  채 SQL Developer 또는 SQL*Plus가 정상적으로 종료된 경우

### SQL Developer 또는 SQL*Plus가 비정상적으로 종료되거나 시스템 faulure가 발생된 경우 자동 롤백이 발생

## COMMIT 또는 ROLLBACK 전의 데이터 상태

	- 이전의 데이터 상태를 복구할 수 있다
	
	- 현재 유저는 SELECT 문을 사용하여 DML 작업의 결과를 확인할 수 있다
	
	- 다른 유저는 현재 유저가 실행한 DML 문의 결과를 볼 수 없다
	
	- 영향을 받는 행이 잠기므로 다른 유저가 영향을 받는 해의 데이터를 변경할 수 없다

## COMMIT 후의 데이터 상태

	- 데이터 변경 사항이 데이터베이스에 저장된다

	- 이전의 데이터 상태를 겹쳐쓴다

	- 모든 유저가 결과를 확인할 수 있다

	- 영향을 받는 행의 Lock이 해제되어 다른 유저가 조작할 수 있게 된다

	- 모든 저장점이 지워진다

## 명령문 레벨 롤백









