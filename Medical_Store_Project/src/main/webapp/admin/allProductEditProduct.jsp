<%@ page import="com.db.DBConnection"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
body{
	  font-family: Georgia,'Times New Roman', Times, serif;
	  text-align:center;
}
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: #303454;font-weight: bold; font-size: 35px; padding :20px;text-align:center;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<% 
String msg = request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product Successfully Updated!</h3>
<% }%>
<% 
if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<% }%>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>     
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   Connection con = DBConnection.createDbConnection();
    	   Statement st = con.createStatement();
    	   ResultSet rs= st.executeQuery("select * from product");
    	   while(rs.next())
    	   {
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td><%= rs.getString(5) %></td>
            <td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%
         }
         }
         catch(Exception e )
       {
        	 e.printStackTrace();
       }%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>