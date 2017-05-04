package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Department;
import service.DepartmentService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public LoginServlet() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message;
		HttpSession session = request.getSession();
		System.out.println("in loginServlet");
		if((  request.getParameter("Submit"))!=null)
				{
			System.out.println("In post");
			String userName=request.getParameter("userName");
			String password=request.getParameter("password");
			if(userName.equals("Mounica") && password.equals("Dailu")){
				System.out.println("Matched");
				HttpSession s = request.getSession();
				s.setAttribute("username", "Mounica");
				DepartmentService ds = new DepartmentService();
				List<Department> dlist = ds.getDeptList();
				session.setAttribute("dlist", dlist);
				RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
				rd.forward(request, response);
			}
			else{
				PrintWriter pw = response.getWriter();
				pw.print("Username or password error!!!");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
				//PrintWriter out = response.getWriter();
				//out.println("Incorrect username or pwd!!!");
			}
				
				}
	}
	
}
