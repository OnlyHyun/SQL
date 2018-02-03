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
                           WHERE last_name LIKE '%u%' );

-- 31) 위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회
SELECT last_name, emp.department_id, job_id
FROM employees emp, departments dep
WHERE emp.department_id = dep.department_id
AND  location_id = 1700;

SELECT last_name, emp.department_id, job_id
FROM employees emp 
JOIN departments dep
  ON emp.department_id = dep.department_id
WHERE location_id = 1700;

-- 32) King 을 매니저로 두고 있는 모든 사원들의 last_name 및 연봉을 조회
SELECT last_name, salary
FROM employees
WHERE manager_id IN ( SELECT employee_id
                       FROM employees
                      WHERE last_name = 'King' );
                      
-- 33) executive 부서에 근무하는 모든 사원들의 부서 번호, last_name, job_id 를 조회
SELECT emp.department_id, last_name, job_id
FROM  employees emp, departments dep
WHERE emp.department_id = dep.department_id
AND department_name = 'Executive';

-- 34) 회사 전체 평균 연봉 보다 더 버는 사원들 중 LAST_NAME 에 u 가 있는 사원들이
--     근무하는 부서에서 근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회
SELECT employee_id, last_name, salary
FROM employees
WHERE department_id IN ( SELECT DISTINCT(department_id)
                           FROM employees
                           WHERE last_name LIKE '%u%' )
AND salary > ( SELECT AVG(salary) FROM employees );


-- 35) ST_CLERK 인 직업 ID 를 가진 사원이 없는 부서 ID 를 조회한다.
-- NULL 값은 제외
-- 일단 NOT EXISTS 안 쓰고 해보자
SELECT DISTINCT(department_id)
FROM employees
WHERE department_id NOT IN ( SELECT DISTINCT(department_id) -- ST_CLERK의 department_id와 일치하지 않는 놈들만 고르겠다
                             FROM employees
                             WHERE job_id = 'ST_CLERK' )
AND department_id IS NOT NULL;

-- NOT EXISTS 사용
SELECT DISTINCT(department_id)
FROM employees e1
WHERE NOT EXISTS ( SELECT '' 
                   FROM employees e2
                   WHERE job_id = 'ST_CLERK'
                   AND e1.department_id = e2.department_id) 
                   -- 메인 쿼리의 부서 번호랑 일치하는 놈인지(이걸 확인하지 않으면 ST_CLERK가 있는 걸 무조건 조회할 수 밖에 없음)                   
AND department_id IS NOT NULL; -- NULL 값이 아닌 걸로다가 조회

-- 36) 위치한 부서가 없는 국가 ID 및 국가 이름을 조회(NOT EXISTS 사용) 
SELECT country_id, country_name
FROM countries con
WHERE NOT EXISTS  ( SELECT  '1'
                    FROM    locations loc, departments dep
                    WHERE   con.country_id = loc.country_id
                    AND     loc.location_id in (dep.location_id))
ORDER   BY country_id;

-- 슬 난이도가 어려워진다...../