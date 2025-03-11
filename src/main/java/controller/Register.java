package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Enquiry;

@WebServlet(name = "register", urlPatterns = { "/register" })
public class Register extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=ISO-8859-1");
		HttpSession session = request.getSession();
		Enquiry enq = new Enquiry(session);
		try {
			if (request.getParameter("enq") != null) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phno = request.getParameter("phone");
				String sub = request.getParameter("sub");
				String msg = request.getParameter("msg");
				String status = enq.Enquiry(name, email, phno, sub, msg);
				if (status.equals("Already Enquired")) {
					request.setAttribute("status", "Already Enquired");
					RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
					rd.forward(request, response);
				} else if (status.equals("Submitted")) {
					request.setAttribute("status", "Successfully Enquired");
					RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed");
					RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
					rd.forward(request, response);
				}
			}

			else if (request.getParameter("addevent") != null) {
				String img = request.getParameter("image");
				String name = request.getParameter("name");
				String cost = request.getParameter("cost");
				String details = request.getParameter("details");
				String category = request.getParameter("category");
				String status = enq.addEvent(img, name, cost, details, category);
				if (status.equals("Submitted")) {
					request.setAttribute("status", "New Event Added");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				} else if (status.equals("Already Added")) {
					request.setAttribute("status", "Already Added");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed To Add Event");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				}
			}

			else if (request.getParameter("delevent") != null) {
				String category = request.getParameter("ecategory");
				String status = enq.delEvent(category);
				if (status.equals("success")) {
					request.setAttribute("status", "Event Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				} else if (status.equals("not available")) {
					request.setAttribute("status", "Event Category doesn't exist");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Event");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				}
			} else if (request.getParameter("signup") != null) {
				String name = request.getParameter("nm");
				String email = request.getParameter("ema");
				String password = request.getParameter("pwd");
				String confirm = request.getParameter("cpwd");
				if (password.equals(confirm)) {
					String status = enq.signup(name, email, password);
					if (status.equals("existed")) {
						request.setAttribute("status", "Already Registered");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);
					} else if (status.equals("success")) {
						request.setAttribute("status", "Successfully Registered");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);
					} else if (status.equals("failed")) {
						request.setAttribute("status", "Failed to Register");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);
					}
				}
			} else if (request.getParameter("login") != null) {
				String lemail = request.getParameter("em");
				String lpassword = request.getParameter("pw");
				String status = enq.login(lemail, lpassword, session);
				if (status.equals("adm success")) {
					RequestDispatcher rd = request.getRequestDispatcher("adHome.jsp");
					rd.forward(request, response);
				} else if (status.equals("success")) {
					RequestDispatcher rd = request.getRequestDispatcher("eventCategories.jsp");
					rd.forward(request, response);
				} else if (status.equals("failure")) {
					request.setAttribute("status", "Wrong email or password");
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
				}
			}

			else if (request.getParameter("forgot") != null) {
				String email = request.getParameter("em");
				String npassword = request.getParameter("pw");
				String cpassword = request.getParameter("cpw");
				String status = enq.forgotPassword(email, npassword, cpassword);
				if (status.equals("Success")) {
					request.setAttribute("status", "New Password Created");
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed To Create New Password");
					RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
					rd.forward(request, response);
				}
			}

			else if (session.getAttribute("uname") != null && request.getParameter("bookevent") != null) {
				String status = enq.Booknow(request);
				if (status.equals("success")) {
					request.setAttribute("status",
							"Booking successful.<a href='eventstatus.jsp'>Click here</a> to check status.");
					RequestDispatcher rd = request
							.getRequestDispatcher("eventBooking.jsp?event_id=" + request.getParameter("event_id"));
					rd.forward(request, response);
				} else if (status.equals("failure")) {
					request.setAttribute("status", "Booking failed");
					RequestDispatcher rd = request
							.getRequestDispatcher("eventBooking.jsp?event_id=" + request.getParameter("event_id"));
					rd.forward(request, response);
				} else if (status.equals("existed")) {
					request.setAttribute("status", "Date not available for event");
					RequestDispatcher rd = request
							.getRequestDispatcher("eventBooking.jsp?event_id=" + request.getParameter("event_id"));
					rd.forward(request, response);
				}
			} else if (session.getAttribute("uname") != null && request.getParameter("cancelevent") != null) {
				int event_id = Integer.parseInt(request.getParameter("event_id"));
				int status = enq.deleteevent(event_id);
				if (status > 0) {
					RequestDispatcher rd = request.getRequestDispatcher("eventStatus.jsp");
					rd.forward(request, response);
				}
			}

			else if (request.getParameter("review") != null) {
				String rating = request.getParameter("rating");
				String opinion = request.getParameter("opinion");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String status = enq.review(name, email, rating, opinion);
				if (status.equals("Successful")) {
					request.setAttribute("status", "Thank you for your Feedback");
					RequestDispatcher rd = request.getRequestDispatcher("review.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed to recieve your Feedback");
					RequestDispatcher rd = request.getRequestDispatcher("review.jsp");
					rd.forward(request, response);
				}
			} else if (request.getParameter("logout") != null) {
				session.invalidate();
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getServletInfo() {
		return "Short description";
	}

}
