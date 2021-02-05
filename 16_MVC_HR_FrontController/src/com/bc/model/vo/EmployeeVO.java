package com.bc.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
@NoArgsConstructor
public class EmployeeVO {
	
	private String commission_pct, department_id, email, employee_id,
		first_name, hire_date, job_id, last_name, manager_id, phone_number, salary;

}
