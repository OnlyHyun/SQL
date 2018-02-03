-- 26) �� ��� �� �� 2001, 2002, 2003, 2004 �⵵ �� ���� ������� �� ���� ��ȸ
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

-- 27) ������ ���� �������� �� �μ��� �� ������ ���� ���� ��ȸ
-- (��� ����)
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

-- 28) last_name �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥�� ��ȸ
-- ��������� Zlotkey �� ����
SELECT employee_id, hire_date
FROM employees
WHERE department_id = ( SELECT department_id
                        FROM employees
                        WHERE last_name = 'Zlotkey')
AND last_name != 'Zlotkey';

-- 29) ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME �� ��ȸ
SELECT employee_id, last_name
FROM employees
WHERE salary > ( SELECT AVG(salary)
                 FROM employees);

-- 30) last_name �� u�� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ
-- u�� ���ԵǴ� ������� �μ���ȣ ���� �� DISTINCT�� ���� �ߺ������� �� IN �� ���� ���� ���� �޾� ����
SELECT employee_id, last_name
FROM employees
WHERE department_id IN ( SELECT DISTINCT(department_id)
                           FROM employees
                           WHERE last_name LIKE '%u%' );

-- 31) ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ
SELECT last_name, emp.department_id, job_id
FROM employees emp, departments dep
WHERE emp.department_id = dep.department_id
AND  location_id = 1700;

SELECT last_name, emp.department_id, job_id
FROM employees emp 
JOIN departments dep
  ON emp.department_id = dep.department_id
WHERE location_id = 1700;

-- 32) King �� �Ŵ����� �ΰ� �ִ� ��� ������� last_name �� ������ ��ȸ
SELECT last_name, salary
FROM employees
WHERE manager_id IN ( SELECT employee_id
                       FROM employees
                      WHERE last_name = 'King' );
                      
-- 33) executive �μ��� �ٹ��ϴ� ��� ������� �μ� ��ȣ, last_name, job_id �� ��ȸ
SELECT emp.department_id, last_name, job_id
FROM  employees emp, departments dep
WHERE emp.department_id = dep.department_id
AND department_name = 'Executive';

-- 34) ȸ�� ��ü ��� ���� ���� �� ���� ����� �� LAST_NAME �� u �� �ִ� �������
--     �ٹ��ϴ� �μ����� �ٹ��ϴ� ������� ���, LAST_NAME �� ������ ��ȸ
SELECT employee_id, last_name, salary
FROM employees
WHERE department_id IN ( SELECT DISTINCT(department_id)
                           FROM employees
                           WHERE last_name LIKE '%u%' )
AND salary > ( SELECT AVG(salary) FROM employees );


-- 35) ST_CLERK �� ���� ID �� ���� ����� ���� �μ� ID �� ��ȸ�Ѵ�.
-- NULL ���� ����
-- �ϴ� NOT EXISTS �� ���� �غ���
SELECT DISTINCT(department_id)
FROM employees
WHERE department_id NOT IN ( SELECT DISTINCT(department_id) -- ST_CLERK�� department_id�� ��ġ���� �ʴ� ��鸸 ���ڴ�
                             FROM employees
                             WHERE job_id = 'ST_CLERK' )
AND department_id IS NOT NULL;

-- NOT EXISTS ���
SELECT DISTINCT(department_id)
FROM employees e1
WHERE NOT EXISTS ( SELECT '' 
                   FROM employees e2
                   WHERE job_id = 'ST_CLERK'
                   AND e1.department_id = e2.department_id) 
                   -- ���� ������ �μ� ��ȣ�� ��ġ�ϴ� ������(�̰� Ȯ������ ������ ST_CLERK�� �ִ� �� ������ ��ȸ�� �� �ۿ� ����)                   
AND department_id IS NOT NULL; -- NULL ���� �ƴ� �ɷδٰ� ��ȸ

-- 36) ��ġ�� �μ��� ���� ���� ID �� ���� �̸��� ��ȸ(NOT EXISTS ���) 
SELECT country_id, country_name
FROM countries con
WHERE NOT EXISTS  ( SELECT  '1'
                    FROM    locations loc, departments dep
                    WHERE   con.country_id = loc.country_id
                    AND     loc.location_id in (dep.location_id))
ORDER   BY country_id;

-- �� ���̵��� ���������...../