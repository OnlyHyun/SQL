-- 26) 총 사원 수 및 2001, 2003, 2005, 2006 년도 별 고용된 사원들의 총 수를 조회
SELECT DISTINCT(
      SELECT COUNT(employee_id)
      FROM employees
    ) "TOTAL",
    ( SELECT COUNT(employee_id)
      FROM employees
      WHERE hire_date LIKE '01%' ) "2001",
    ( SELECT COUNT(employee_id) 
      FROM employees
      WHERE hire_date LIKE '03%' ) "2003",
    ( SELECT COUNT(employee_id) 
      FROM employees
      WHERE hire_date LIKE '05%' ) "2005",
    ( SELECT COUNT(employee_id) 
      FROM employees
      WHERE hire_date LIKE '06%' ) "2006"
FROM employees;

-- 27) 다음과 같은 포맷으로 각 부서 별 각 직업 별 연봉 총 합 및 각 부서별 연봉 총 합을 조회한다.
-- (결과 예제)
--  JOB         DEPT 20    DEPT 50    DEPT 80    DEPT 90    Total
--  직업별로 쫙    직업군의 20번 부서애들 값                       직업별 총합
--  
--                부서별 총합

SELECT DISTINCT(job_id) "JOB", ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 20
                                 AND  emp.job_id = job_id ) "DEPT 20",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 50
                                 AND  emp.job_id = job_id ) "DEPT 50",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 80
                                 AND  emp.job_id = job_id ) "DEPT 80",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 90
                                 AND  emp.job_id = job_id ) "DEPT 90",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE emp.job_id = job_id) "Total"      
FROM employees emp
GROUP BY job_id;
