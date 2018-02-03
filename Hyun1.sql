-- 26) �� ��� �� �� 2001, 2003, 2005, 2006 �⵵ �� ���� ������� �� ���� ��ȸ
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

-- 27) ������ ���� �������� �� �μ� �� �� ���� �� ���� �� �� �� �� �μ��� ���� �� ���� ��ȸ�Ѵ�.
-- (��� ����)
--  JOB         DEPT 20    DEPT 50    DEPT 80    DEPT 90    Total
--  �������� ��    �������� 20�� �μ��ֵ� ��                       ������ ����
--  
--                �μ��� ����

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
