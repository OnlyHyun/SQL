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
                           WHERE last_name LIKE '%u%' ) ;

