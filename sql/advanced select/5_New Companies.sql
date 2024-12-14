select company_code, founder,
(select count(distinct lead_manager_code) from lead_manager where company_code = c.company_code),
(select count(distinct senior_manager_code) from senior_manager where company_code = c.company_code),
(select count(distinct manager_code) from manager where company_code = c.company_code),
(select count(distinct employee_code) from employee where company_code = c.company_code)
from company c
order by company_code;