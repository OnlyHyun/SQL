-- SQL example

-- 1) ������ 12000 �̻� �Ǵ� �������� last_name �� ������ ��ȸ
SELECT last_name, salary
FROM employees
WHERE salary >= 12000;

-- 2) �����ȣ�� 176�� ����� last_name�� �μ� ��ȣ ��ȸ
SELECT last_name, department_id
FROM employees
WHERE employee_id = 176;

-- 3) ������ 5000���� 12000�� ���� �̿��� ������� last_name �� ���� ��ȸ
SELECT last_name, salary
FROM   employees
WHERE  salary >= 5000 
AND    salary <=12000;

-- 4) ���� ������� last_name, ���, ������ڸ� ��ȸ
SELECT   last_name, employee_id, hire_date
FROM     employees
ORDER BY hire_date;

-- 5) 30 �� �� 50 �� �μ����� �ٹ��ϴ� ��� ������� last_name �� �μ� ��ȣ�� ���ĺ������� ��ȸ
SELECT last_name, department_id
FROM employees
WHERE department_id = 30 
OR    department_id = 50
ORDER BY 1;

-- 6) 2002�⵵�� ���� ��� ������� last_name �� ����� ��ȸ
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '02/%'
ORDER BY 2;

-- 7) 2002�� 6�� 1�Ϻ��� 2002�� 9�� 1�� ���̿� ���� ������� last_name, ���, ������� ��ȸ
SELECT last_name, employee_id, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('02/06/01') AND TO_DATE('02/09/01')
ORDER BY hire_date;

-- 8) �Ŵ����� ���� ������� last_name, job_id�� ��ȸ
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

-- 9) Ŀ�̼��� ���� ��� ������� last_name, ���� �� Ŀ�̼� ��ȸ
-- ���� ����, Ŀ�̼� ���� ����
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary desc, commission_pct desc;

-- 10) last_name�� �� ��° ���ڰ� a�� ������� last_name�� ��ȸ
SELECT last_name
FROM employees
WHERE last_name LIKE '___a%';

-- 11) last_name�� a �� e ���ڰ� �ִ� ������� last_name�� ��ȸ
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%e%';

-- 12) ������ 2500, 3500, 7000�� �ƴϸ� ������ SA_REP �̳� ST_CLERK�� ����� last_name, job_id, salary ��ȸ
SELECT last_name, job_id, salary
FROM employees
WHERE SALARY NOT IN(2500, 3500, 7000)
AND JOB_ID IN ('SA_REP', 'ST_CLERK');

-- 13) ������ AD_PRESS�� ����� A�����, ST_MAN�� ����� B�����, IT_PROG�� ����� C�����
--           SA_REP�� ����� D�����, ST_CLERK�� ����� E����� ��Ÿ�� 0�� �ο��Ͽ� ��ȸ
SELECT job_id,
CASE job_id WHEN 'AD_PRES' THEN 'A'
            WHEN 'ST_MAN' THEN 'B'
            WHEN 'IT_PROG' THEN 'C'
            WHEN 'SA_REP' THEN 'D'
            WHEN 'ST_CLERK' THEN 'E'
            ELSE '0' END "Grade"
FROM employees;

-- 14) ��� ������� last_name, �μ� ��ȣ �� �μ� �̸��� ��ȸ
SELECT emp.last_name, emp.department_id, dep.department_name
FROM employees emp
JOIN departments dep
  ON emp.department_id = dep.department_id;
  
-- 15) �μ���ȣ 30 ���� ��� �������� ������ �������� ��ȸ(90 �μ� ���� ����)
SELECT distinct(emp.job_id), dep.department_id
  FROM employees emp
  JOIN departments dep
    ON emp.department_id = dep.department_id
  WHERE emp.department_id IN(30, 90)
ORDER BY department_id;

-- 16) Ŀ�̼��� ���� ��� ������� last_name, �μ� ��, ���� ID �� ���� ���� ��ȸ
SELECT last_name, department_name, city, total.location_id
FROM locations loc
JOIN  (SELECT *
         FROM employees emp 
         JOIN departments dep
           ON emp.department_id = dep.department_id) total
  ON loc.location_id = total.location_id
WHERE total.commission_pct IS NOT NULL;

-- 17) last_name �� davies �� ������� �Ŀ� ���� ������� last_name �� hire_date�� ��ȸ
SELECT last_name, hire_date
FROM employees
WHERE hire_date >= ( SELECT hire_date 
                     FROM employees
                     WHERE last_name = 'Davies' );
                     
-- 18) �ڽ��� �Ŵ������� ���� ���� ������� LAST_NAME �� ������� ��ȸ
SELECT last_name, hire_date
FROM employees emp
WHERE hire_date < ( SELECT hire_Date
                    FROM employees
                    WHERE employee_id = emp.manager_id ) ;
-- 19) ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ
SELECT MAX(salary), MIN(salary), SUM(salary), ROUND(AVG(salary))
FROM employees;

-- 20) �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ
SELECT job_id, MAX(salary), MAX(salary), SUM(salary), ROUND(AVG(salary))
FROM employees
GROUP BY job_id;

-- 21) ������ ������ ���� ������� �� ���� ��ȸ
SELECT job_id, count(job_id)
FROM employees
GROUP BY job_id;

-- 22) �Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ
SELECT COUNT(DISTINCT(manager_id))
FROM employees;

-- 23) �系 �ִ� ���� �� �ּ� ������ ���̸� ��ȸ
SELECT MAX(salary)-MIN(salary)
FROM employees;

-- 24) �Ŵ����� ��� �� �� �Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ������ ��ȸ�Ѵ�.
--     �Ŵ����� ���� ������� �����Ѵ�.
--     �ּ� ������ 6000 �̸��� ���� �����Ѵ�.
--     ���� ���� �������� ��ȸ�Ѵ�.
SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >= 6000
ORDER BY MIN(salary) desc;



-- 25) �μ� ��, ��ġ ID, �� �μ� �� ��� �� ��, �� �μ� �� ��� ������ ��ȸ
--     ��� ������ �Ҽ��� 2 �ڸ������� ǥ��
SELECT department_name, location_id, COUNT(emp.department_id), ROUND(AVG(salary), 2)
FROM employees emp 
JOIN departments dep
  ON emp.department_id = dep.department_id
GROUP BY department_name, location_id;