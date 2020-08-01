<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="stag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <title>Web Project</title>
  </head>
  <body>
    <%
        String username = null, admin = null;
        int role = 0;
            if(request.getSession().getAttribute("username") == null){
                response.sendRedirect(request.getContextPath()+"/login");
            }else{
                username = request.getSession().getAttribute("username").toString();
                role = Integer.parseInt(request.getSession().getAttribute("role").toString());
                if( role != 1 )
                    response.sendRedirect(request.getContextPath()+"/");
            }
    %>
    <!-- NavBar https://getbootstrap.com/docs/4.5/components/navbar/ -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="<%= request.getContextPath()%>/">
        <img src="/resources/images/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
        Web Project
      </a>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-item nav-link active" href="<%= request.getContextPath()%>/">Home <span class="sr-only">(current)</span></a>
            <% if (role == 1 ) { %>
            <a class="nav-item nav-link" href="<%= request.getContextPath()%>/admin">Users</a>
            <% } %>
          </div>
        </div>

      <form class="form-inline my-2 my-lg-0" action="<%= request.getContextPath()%>/logout" method="get">
         <button class="btn btn-danger" type="submit">logout</button>
      </form>
    </nav>

     <br>

    <div class="container">
      <div class="row">
        <div class="col">

        </div>
        <div class="col-8">
            <div class="container">
              <div class="row">
                <div class="col">
                    <h2> User Details <h2>
                </div>
                <div class="col">
                </div>
                <div class="col">
                  <a href="<%= request.getContextPath()%>/edit_user"><button type="button" class="btn btn-success">Add User</button></a>
                </div>
              </div>
            </div>
        </div>
        <div class="col">

        </div>
      </div>
    </div>
    <br/>
    <div class="container">
      <div class="row">
        <div class="col">

        </div>
        <div class="col-8">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">Username</th>
                 <!-- <th scope="col">Password</th> -->
                  <th scope="col">role</th>
                  <th scope="col">edit</th>
                  <th scope="col">delete</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${userList}" var="user">
                <tr>
                  <td>${user.username}</td>
                <!--  <td><input type="password" value=${user.password} id="myInput"></td> -->
                  <td>${user.role}</td>
                  <td> <a href="<%= request.getContextPath()%>/edit_user?username=${user.username}"><button type="button" class="btn btn-warning">Edit</button></a></td>
                  <td> <a href="<%= request.getContextPath()%>/delete_user?username=${user.username}"><button type="button" class="btn btn-danger">Delete</button></a></td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
        </div>
        <div class="col">

        </div>
      </div>
    </div>


<%
  response.setHeader("pragma", "no-cache");
  response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
  response.setHeader("Expires", "0");
%>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>-->
    <script src="/resources/js/bootstrap.min.js"></script>
    </body>
</html>
