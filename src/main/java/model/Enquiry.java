package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Enquiry {

	private Connection con;
	HttpSession se;

	public Enquiry(HttpSession session) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event?user=root&password=System@1");
			se = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String Enquiry(String name, String email, String phone, String subject, String message) {

		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from enquirylist where phno='" + phone + "' or email='" + email + "';");
			boolean b = rs.next();
			if (b)
				status = "Already Enquired";
			else {
				ps = (PreparedStatement) con.prepareStatement("insert into enquirylist values (0,?,?,?,?,?,now())");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, phone);
				ps.setString(4, subject);
				ps.setString(5, message);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "Submitted";
				else
					status = "Failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String forgotPassword(String email, String npassword, String cpassword) {
		PreparedStatement ps;
		String status = "";
		if (npassword.equals(cpassword)) {
			try {
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();
				ps = (PreparedStatement) con.prepareStatement("update customer set pwd=? where cemail=?");
				ps.setString(1, npassword);
				ps.setString(2, email);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "Success";
				else
					status = "Failed";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return status;
		} else {
			status = "Failed";
			return status;
		}
	}

	public String addEvent(String img, String name, String cost, String details, String category) {

		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from events where event_name='" + name + "';");
			boolean b = rs.next();
			if (b)
				status = "Already Added";
			else {
				ps = (PreparedStatement) con.prepareStatement("insert into events values (0,?,?,?,?,?,now())");
				ps.setString(1, img);
				ps.setString(2, name);
				ps.setString(3, cost);
				ps.setString(4, details);
				ps.setString(5, category);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "Submitted";
				else
					status = "Failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String signup(String name, String email, String pwd) {
		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from customer where cemail='" + email + "';");
			boolean b = rs.next();
			if (b)
				status = "existed";
			else {
				ps = (PreparedStatement) con.prepareStatement("insert into customer values (0,?,?,?,now())");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, pwd);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "success";
				else
					status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String login(String email, String password, HttpSession session) {
		String status = "", eid = "sumanth@gmail.com", pwd = "Sumanth", em = "", nm = "", id = "";
		if (email.equals(eid) && password.equals(pwd)) {
			se = session;
			id = "1";
			nm = "sumanth";
			em = "sumanth@gmail.com";
			session.setAttribute("uname", nm);
			session.setAttribute("email", em);
			session.setAttribute("id", id);
			status = "adm success";
		} else {
			try {
				se = session;
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();
				rs = st.executeQuery("select * from customer where cemail='" + email + "' and pwd='" + password + "';");
				boolean b = rs.next();
				if (b == true) {
					id = rs.getString("cid");
					nm = rs.getString("cname");
					em = rs.getString("cemail");
					session.setAttribute("uname", nm);
					session.setAttribute("email", em);
					session.setAttribute("id", id);
					status = "success";
				} else
					status = "failure";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return status;
	}

	public ArrayList<Dproduct> get_eventinfo(String event_category) {
		ArrayList<Dproduct> al = new ArrayList<Dproduct>();
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			String qry = " select * from events where event_category='" + event_category + "';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Dproduct d = new Dproduct();
				d.setP_id(rs.getString("event_id")); // 1..r---db 2.. pass the data or value to Dproduct class set
														// method
				d.setP_image(rs.getString("event_img"));
				d.setP_name(rs.getString("event_name"));
				d.setP_cost(rs.getString("event_cost"));
				d.setP_details(rs.getString("event_details"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public Dproduct getEventFormInfo(String event_id) {
		Statement st = null;
		ResultSet rs = null;
		Dproduct s = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from events where event_id= '" + event_id + "'");
			boolean b = rs.next();
			if (b == true) {
				s = new Dproduct();
				s.setP_name(rs.getString("event_name"));
				s.setP_cost(rs.getString("event_cost"));
			} else {
				s = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	public String Booknow(HttpServletRequest request) {
		String status = "";
		ResultSet rs = null;
		try {
			Statement st = con.createStatement();
			rs = st.executeQuery(
					"select event_id from bookevent where eventdate= '" + request.getParameter("edate") + "'");
			boolean b = rs.next();
			if (b == true) {
				status = "existed";
			} else {
				String qry = "insert into bookevent select 0,event_img,event_name,'" + request.getParameter("email")
						+ "', '" + request.getParameter("address") + "',event_cost,'" + se.getAttribute("uname") + "',"
						+ se.getAttribute("id") + " ,'pending',now(),'" + request.getParameter("edate")
						+ "' from events where event_id=" + request.getParameter("event_id") + ";";
				int a = st.executeUpdate(qry);
				if (a > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int deleteevent(int event_id) {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "update bookevent set status='cancelled' where event_id=' " + event_id + "' ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int acceptevent(int event_id) {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "update bookevent set status='booked' where event_id=' " + event_id + "' ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public ArrayList<Dproduct> geteventstatus() {
		ArrayList<Dproduct> al = new ArrayList<Dproduct>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1,date_format(eventdate,'%d %b,%Y') as date2 from bookevent where uid='"
					+ se.getAttribute("id") + " ';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setP_id(rs.getString("event_id"));
				d.setP_image(rs.getString("event_img"));
				d.setP_name(rs.getString("event_name"));
				d.setP_cost(rs.getString("event_cost"));
				d.setEmail(rs.getString("email"));
				d.setDate(rs.getString("date1"));
				d.setEventdate(rs.getString("date2"));
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<Dproduct> getBill() {
		ArrayList<Dproduct> al = new ArrayList<Dproduct>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select uname,event_name,date_format(eventdate,'%d %b,%Y') as date2,address,event_cost from bookevent where uid="
					+ se.getAttribute("id") + ";";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setUname(rs.getString("uname"));
				d.setP_name(rs.getString("event_name"));
				d.setDate(rs.getString("date2"));
				d.setAddress(rs.getString("address"));
				d.setP_cost(rs.getString("event_cost"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public String delete(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from customer where " + "cid='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String delEvent(String category) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from events where " + "event_category='" + category + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String deleteEnquiryList(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from enquirylist where " + "id='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public ArrayList<Dproduct> geteventstatusAdmin() {
		ArrayList<Dproduct> al = new ArrayList<Dproduct>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1,date_format(eventdate,'%d %b,%Y') as date2 from bookevent;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setP_id(rs.getString("event_id"));
				d.setP_image(rs.getString("event_img"));
				d.setP_name(rs.getString("event_name"));
				d.setP_cost(rs.getString("event_cost"));
				d.setEmail(rs.getString("email"));
				d.setDate(rs.getString("date1"));
				d.setEventdate(rs.getString("date2"));
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<User> getClients() {
		ArrayList<User> al = new ArrayList<User>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1 from customer;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				User d = new User(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setId(rs.getString("cid"));
				d.setName(rs.getString("cname"));
				d.setEmail(rs.getString("cemail"));
				d.setDate(rs.getString("date"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<EnqList> getEnquiryList() {
		ArrayList<EnqList> al = new ArrayList<EnqList>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1 from enquirylist;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				EnqList d = new EnqList(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setId(rs.getString("id"));
				d.setName(rs.getString("name"));
				d.setEmail(rs.getString("email"));
				d.setPhno(rs.getString("phno"));
				d.setSub(rs.getString("sub"));
				d.setMsg(rs.getString("msg"));
				d.setDate(rs.getString("date"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public String review(String name, String email, String rating, String opinion) {

		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			ps = (PreparedStatement) con.prepareStatement("insert into review values (0,?,?,?,?,now())");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, rating);
			ps.setString(4, opinion);
			int a = ps.executeUpdate();
			if (a > 0)
				status = "Successful";
			else
				status = "Failed";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public ArrayList<Ratings> getFeedbackList() {
		ArrayList<Ratings> al = new ArrayList<Ratings>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1 from review;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Ratings d = new Ratings(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setRid(rs.getString("review_id"));
				d.setUname(rs.getString("uname"));
				d.setEmail(rs.getString("email"));
				d.setRating(rs.getString("rating"));
				d.setMessage(rs.getString("message"));
				d.setDate(rs.getString("date"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<Events> getEventList() {
		ArrayList<Events> al = new ArrayList<Events>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select event_img, event_category from events;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Events d = new Events(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setEvent_img(rs.getString("event_img"));
				d.setEvent_category(rs.getString("event_category"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

}