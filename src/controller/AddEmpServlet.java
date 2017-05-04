package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DepartmentService;
import service.EmployeeService;


@WebServlet("/AddEmpServlet")
public class AddEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddEmpServlet() {
        super();

    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fn = req.getParameter("firstName");
		String ln = req.getParameter("lastName");
		String age = req.getParameter("age");
		String deptStr = req.getParameter("department");
		EmployeeService es = new EmployeeService();
		try {
			req.getSession().setAttribute("empList", es.addNewEmployee(fn, ln, age, Integer.parseInt(deptStr)));
			req.getSession().setAttribute("dlist", new DepartmentService().getDeptList());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("addEmployee.jsp").forward(req, resp);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
