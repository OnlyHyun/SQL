# SQL example

1. 연봉이 12000 이상 되는 직원들의 last_name 및 연봉을 조회

        SELECT last_name, salary
        FROM employees
        WHERE salary >= 12000;

2. 사원번호가 176인 사람의 last_name과 부서 번호 조회

        SELECT last_name, department_id
        FROM employees
        WHERE employee_id = 176;

3. 연봉이 5000에서 12000의 범위 이외인 사람들의 last_name 및 연봉 조회

        SELECT last_name, salary
        FROM   employees
        WHERE  salary >= 5000 
        AND    salary <=12000;

4. 고용된 사원들의 last_name, 사번, 고용일자를 조회

        SELECT   last_name, employee_id, hire_date
        FROM     employees
        ORDER BY hire_date;

5. 30 번 및 50 번 부서에서 근무하는 모든 사원들의 last_name 및 부서 번호를 알파벳순으로 조회

        SELECT last_name, department_id
        FROM employees
        WHERE department_id = 30 
        OR    department_id = 50
        ORDER BY 1;

6. 2002년도에 고용된 모든 사람들의 last_name 및 고용일 조회

        SELECT last_name, hire_date
        FROM employees
        WHERE hire_date LIKE '02/%'
        ORDER BY 2;

7. 2002년 6월 1일부터 2002년 9월 1일 사이에 고용된 사원들의 last_name, 사번, 고용일자 조회

        SELECT last_name, employee_id, hire_date
        FROM employees
        WHERE hire_date BETWEEN TO_DATE('02/06/01') AND TO_DATE('02/09/01')
        ORDER BY hire_date;

8. 매니저가 없는 사람들의 last_name, job_id을 조회

        SELECT last_name, job_id
        FROM employees
        WHERE manager_id IS NULL;

9. 커미션을 버는 모든 사원들의 last_name, 연봉 및 커미션 조회
   연봉 역순, 커미션 역순 정렬

        SELECT last_name, salary, commission_pct
        FROM employees
        WHERE commission_pct IS NOT NULL
        ORDER BY salary desc, commission_pct desc;

10. last_name의 네 번째 글자가 a인 사원들의 last_name을 조회

        SELECT last_name
        FROM employees
        WHERE last_name LIKE '___a%';

11. last_name에 a 및 e 글자가 있는 사원들의 last_name을 조회

        SELECT last_name
        FROM employees
        WHERE last_name LIKE '%a%e%';

12. 연봉이 2500, 3500, 7000이 아니며 직업이 SA_REP 이나 ST_CLERK인 사람의 last_name, job_id, salary 조회

        SELECT last_name, job_id, salary
        FROM employees
        WHERE SALARY NOT IN(2500, 3500, 7000)
        AND JOB_ID IN ('SA_REP', 'ST_CLERK');

13. 직업이 AD_PRESS인 사람은 A등급을, ST_MAN인 사람은 B등급을, IT_PROG인 사람은 C등급을
          SA_REP인 사람은 D등급을, ST_CLERK인 사람은 E등급을 기타는 0을 부여하여 조회

        SELECT job_id,
        CASE job_id WHEN 'AD_PRES' THEN 'A'
                    WHEN 'ST_MAN' THEN 'B'
                    WHEN 'IT_PROG' THEN 'C'
                    WHEN 'SA_REP' THEN 'D'
                    WHEN 'ST_CLERK' THEN 'E'
                    ELSE '0' END "Grade"
        FROM employees;

14. 모든 사원들의 last_name, 부서 번호 및 부서 이름을 조회

        SELECT emp.last_name, emp.department_id, dep.department_name
        FROM employees emp
        JOIN departments dep
          ON emp.department_id = dep.department_id;
  
15. 부서번호 30 내의 모든 직업들을 유일한 포맷으로 조회(90 부서 또한 포함)

        SELECT distinct(emp.job_id), dep.department_id
          FROM employees emp
          JOIN departments dep
            ON emp.department_id = dep.department_id
          WHERE emp.department_id IN(30, 90)
        ORDER BY department_id;

16. 커미션을 버는 모든 사람들의 last_name, 부서 명, 지역 ID 및 도시 명을 조회

        SELECT last_name, department_name, city, total.location_id
        FROM locations loc
        JOIN  (SELECT *
                 FROM employees emp 
                 JOIN departments dep
                   ON emp.department_id = dep.department_id) total
          ON loc.location_id = total.location_id
        WHERE total.commission_pct IS NOT NULL;

17. last_name 이 davies 인 사람보다 후에 고용된 사원들의 last_name 및 hire_date를 조회
        
        SELECT last_name, hire_date
        FROM employees
        WHERE hire_date >= ( SELECT hire_date 
                              FROM employees
                            WHERE last_name = 'Davies' );
