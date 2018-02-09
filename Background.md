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
    









