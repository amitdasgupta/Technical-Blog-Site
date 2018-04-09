<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<body>
<%
      String name = request.getParameter("fullname").toString();
  String userName = request.getParameter("userName").toString();
  String pass = request.getParameter("pass").toString();
  String addr = request.getParameter("address").toString();
  String age = request.getParameter("age").toString(); 
  String qual = request.getParameter("qual").toString();
  String percent = request.getParameter("percent").toString();
  String year = request.getParameter("yop").toString();

  // validate given input
  if (name.isEmpty() || addr.isEmpty() || age.isEmpty() || qual.isEmpty() || percent.isEmpty() || year.isEmpty()) {
   RequestDispatcher rd = request.getRequestDispatcher("registration.jsp");
   out.println("<font color=red>Please fill all the fields</font>");
   rd.include(request, response);
  } else {
   // inserting data into mysql database 
   // create a test database and student table before running this to create table
   //create table student(name varchar(100), userName varchar(100), pass varchar(100), addr varchar(100), age int, qual varchar(100), percent varchar(100), year varchar(100));
   try {
    Class.forName("com.mysql.jdbc.Driver");
    // loads mysql driver

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root"); 

    String query = "insert into student values(?,?,?,?,?,?,?,?)";

    PreparedStatement ps = con.prepareStatement(query); // generates sql query

    ps.setString(1, name);
    ps.setString(2, userName);
    ps.setString(3, pass);
    ps.setString(4, addr);
    ps.setInt(5, Integer.parseInt(age));
    ps.setString(6, qual);
    ps.setString(7, percent);
    ps.setString(8, year);

    ps.executeUpdate(); // execute it on test database
    System.out.println("successfuly inserted");
    ps.close();
    con.close();
   } catch (Exception e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
   }
   RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
   rd.forward(request, response);
  }
 
    %>
</body>