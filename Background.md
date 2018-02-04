# SQL Background


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
      > Converts the first character of an alphabetic value to uppercase, and places the remaining characters in lowercase
    
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
      > Searches a string in a text expression and finds the string, replacing it with the specified replacement string

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


