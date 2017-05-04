package service;

import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import utility.JpaUtility;
import model.Department;
import model.Employee;

public class EmployeeService {
	public List<Employee> addNewEmployee(String firstName, String lastName, String age, Integer deptId) throws SQLException{
		EntityManager em = JpaUtility.getEntityManager();
		em.getTransaction().begin();
		Employee e = new Employee();
		e.setFirstName(firstName);
		e.setLastName(lastName);
		e.setAge(Integer.parseInt(age));
		Query q = em.createQuery("select distinct d from Department d where dept_id="+deptId);
		List<Department> resList = q.getResultList();
		e.setDepartment((Department)resList.get(0));
		em.persist(e);
		em.getTransaction().commit();
		return getEmployeeList();		
	}
	public List<Employee> getEmployeeList() throws SQLException{
		EntityManager em = JpaUtility.getEntityManager();
		em.getTransaction().begin();
		Query query = em.createQuery("select e from Employee e");
		List<Employee> resList = query.getResultList();
		em.getTransaction().commit();
		return resList;
	}
}
