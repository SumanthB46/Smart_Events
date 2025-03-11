package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Enquiry;

@WebServlet(name = "deleteuser", urlPatterns = { "/deleteuser" })
public class DeleteUser extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=ISO-8859-1");
		HttpSession session = request.getSession();
		try {
			int id = Integer.parseInt(request.getParameter("userid"));
			Enquiry reg = new Enquiry(session);
			String status = reg.delete(id);
			if (status.equals("success")) {
				request.setAttribute("status", "Successfully Deleted");
				request.getRequestDispatcher("ViewClients.jsp").forward(request, response);
			}
			if (status.equals("failure")) {
				request.setAttribute("status", "Deletion failure");
				request.getRequestDispatcher("ViewClients.jsp").forward(request, response);
				response.sendRedirect("ViewClients.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
