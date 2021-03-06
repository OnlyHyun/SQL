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

-- 슬 난이도가 어려워진다.....
-- 37) 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 를 조회
SELECT emp.employee_id, emp.job_id
FROM employees emp, job_history job
WHERE emp.employee_id = job.employee_id
AND   emp.job_id = job.job_id;

-- 38) 커미션을 버는 사원들과 부서, 연봉이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉 조회
SELECT last_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN ( SELECT department_id, salary
                                   FROM employees
                                   WHERE commission_pct IS NOT NULL );

-- 39) 위치 ID 가 1700 인 사원들의 연봉과 커미션이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회
SELECT  last_name, E.department_id, salary
FROM    employees E, departments D
WHERE   E.department_id = D.department_id
AND     (salary, NVL(commission_pct, 0)) IN ( SELECT  salary, NVL(commission_pct, 0)
                                              FROM    employees E1, departments D1
                                              WHERE   E1.department_id = D1.department_id
                                              AND     D1.location_id = 1700
                                              AND     E1.employee_id != E.employee_id);
                                              
-- 40) last_name 이 'Kochhar' 인 사원과 동일한 연봉 및 커미션을 버는 사원들의 last_name, 부서 번호 및 연봉을 조회
SELECT  last_name, department_id, salary
FROM    employees
WHERE   (salary, NVL(commission_pct, 0)) IN (  SELECT salary, NVL(commission_pct, 0)
                                               FROM   employees
                                               WHERE  last_name = 'Kochhar')
AND     last_name != 'Kochhar';                                             

-- 41) 직업 ID 가 SA_MAN 인 사원들의 최대 연봉 보다 높게 받는 사원들의 last_name, job_id 및 연봉을 조회
SELECT last_name, job_id, salary
FROM employees
WHERE salary > ( SELECT MAX(salary)
                 FROM   employees
                 WHERE  job_id = 'SA_MAN' );

-- 42) 도시 이름이 T 로 시작하는 지역에 사는 사원들의 사번, last_name 및 부서 번호를 조회 
SELECT  employee_id, last_name, dep.department_id
FROM    employees emp, departments dep, locations loc
WHERE   emp.department_id = dep.department_id
AND     dep.location_id = loc.location_id
AND     loc.city LIKE 'T%';

-- 43) 각 부서별 평균 연봉보다 더 받는 동일부서 근무사원들의 last_name, 연봉, 부서번호 및 해당 부서의 
--     평균 연봉을 조회, 결과는 부서별 연봉을 기준으로 정렬한다.
SELECT  last_name, salary, department_id, ( SELECT   ROUND(AVG(salary))
                                            FROM     employees E2
                                            GROUP BY department_id
                                            HAVING   E1.department_id = E2.department_id ) "AVG(salary)"
FROM    employees E1
WHERE   salary > ( SELECT   AVG(salary)
                   FROM     employees E2
                   GROUP BY department_id
                   HAVING   E1.department_id = E2.department_id )
ORDER BY 4;

-- 44) NOT EXISTS 연산자를 사용하여 매니저가 아닌 사원 이름을 조회
SELECT  last_name
FROM employees EMP
WHERE NOT EXISTS ( SELECT ' ' 
                   FROM   employees MAN
                   WHERE  EMP.employee_id = MAN.manager_id )
ORDER BY  employee_id;

-- 45) 소속부서의 평균 연봉보다 적게 버는 사원들의 last_name, department_id, salary, 부서평균 salary 을 조회
SELECT  last_name, department_id, salary, (  SELECT    ROUND(AVG(salary))
                                             FROM      employees E2
                                             GROUP BY  department_id
                                             HAVING    E1.department_id = E2.department_id ) "AVG(salary)"
FROM    employees E1
WHERE   salary < (  SELECT    AVG(salary)
                    FROM      employees E2
                    GROUP BY  department_id
                    HAVING    E1.department_id = E2.department_id )
ORDER BY  4;

-- 46) 각 사원 별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는
--     사원이 존재하는 모든 사원들의 last_name 을 조회
SELECT  last_name
FROM    employees E1
WHERE   EXISTS  ( SELECT ' ' 
                  FROM   employees E2
                  WHERE  E1.department_id = E2.department_id
                  AND    E1.salary < E2.salary
                  AND    E1.hire_date < E2.hire_date );
-- 저 조건에서 한 명이라도 그런 후배가 있다면 빠져나와서 출력하는 EXISTS문
             

                      