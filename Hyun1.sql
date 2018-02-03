-- 26) 총 사원 수 및 2001, 2002, 2003, 2004 년도 별 고용된 사원들의 총 수를 조회
SELECT DISTINCT(
      SELECT COUNT(employee_id)
      FROM employees
    ) "TOTAL",
    ( SELECT COUNT(employee_id)
      FROM employees
      WHERE hire_date LIKE '01%' ) "2001",
    ( SELECT COUNT(employee_id) 
      FROM employees
      WHERE hire_date LIKE '02%' ) "2002",
    ( SELECT COUNT(employee_id) 
      FROM employees
      WHERE hire_date LIKE '03%' ) "2003",
    ( SELECT COUNT(employee_id) 
      FROM employees
      WHERE hire_date LIKE '04%' ) "2004"
FROM employees;

-- 27) 다음과 같은 포맷으로 각 부서별 각 직업별 연봉 총합 조회
-- (결과 예제)
--  JOB  DEPT10 ..... DEPT 90   Total


SELECT DISTINCT(job_id) "JOB", ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 10
                                 AND  emp.job_id = job_id ) "DEPT 10",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 20
                                 AND  emp.job_id = job_id ) "DEPT 20",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 30
                                 AND  emp.job_id = job_id ) "DEPT 30",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 40
                                 AND  emp.job_id = job_id ) "DEPT 40",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 50
                                 AND  emp.job_id = job_id ) "DEPT 50",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 60
                                 AND  emp.job_id = job_id ) "DEPT 60",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 70
                                 AND  emp.job_id = job_id ) "DEPT 70",
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
                                 WHERE department_id = 100
                                 AND  emp.job_id = job_id ) "DEPT 100",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE department_id = 110
                                 AND  emp.job_id = job_id ) "DEPT 110",
                               ( SELECT NVL( SUM(salary), 0 )
                                 FROM employees
                                 WHERE emp.job_id = job_id) "Total"      
FROM employees emp
GROUP BY job_id;

-- 28) last_name 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜를 조회
-- 결과값에서 Zlotkey 는 제외
SELECT employee_id, hire_date
FROM employees
WHERE department_id = ( SELECT department_id
                        FROM employees
                        WHERE last_name = 'Zlotkey')
AND last_name != 'Zlotkey';

-- 29) 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 을 조회
SELECT employee_id, last_name
FROM employees
WHERE salary > ( SELECT AVG(salary)
                 FROM employees);

-- 30) last_name 에 u가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 을 조회
-- u가 포함되는 사원들의 부서번호 저장 후 DISTINCT를 통해 중복제거한 후 IN 을 통해 다중 행을 받아 수행
SELECT employee_id, last_name
FROM employees
WHERE department_id IN ( SELECT DISTINCT(department_id)
                           FROM employees
                           WHERE last_name LIKE '%u%' ) ;

