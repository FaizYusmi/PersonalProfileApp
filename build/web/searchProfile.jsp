<%@page import="bean.ProfileBean"%>

<!DOCTYPE html>

<html>

<head>

<title>Search Profile</title>

<style>

body{
    font-family:Arial, sans-serif;
    background:url('background.jpg');
    padding: 40px;linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)),
            url('background.jpg');

            background-size:cover;

            background-position:center;

}

.container{
    width:700px;
    margin:auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 0 10px rgba(0,0,0,0.2);
}

h1{
    color:#243b55;
}

input{
    padding:10px;
    width:250px;
}

button{
    padding:10px 20px;
    background:#243b55;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}
.back-btn{

    display:inline-block;

    margin-top:25px;

    padding:12px 25px;

    background:#243b55;

    color:white;

    text-decoration:none;

    border-radius:10px;

    transition:0.3s;

.result{
    margin-top:20px;
    padding:20px;
    background:#f8f8f8;
    border-radius:10px;
}

</style>

</head>

<body>

<div class="container">

<h1>Search Student Profile</h1>

<form action="SearchProfileServlet"
      method="post">

    <label>Student ID :</label>

    <input type="text"
           name="studentId"
           required>

    <button type="submit">
        Search
    </button>

</form>

<%

ProfileBean p =
(ProfileBean) request.getAttribute("profile");

if(p != null){

%>

<div class="result">

    <h2>Profile Found</h2>

    <p>
        <strong>Name :</strong>
        <%= p.getName() %>
    </p>

    <p>
        <strong>Student ID :</strong>
        <%= p.getStudentId() %>
    </p>

    <p>
        <strong>Program :</strong>
        <%= p.getProgram() %>
    </p>

    <p>
        <strong>Email :</strong>
        <%= p.getEmail() %>
    </p>

    <p>
        <strong>Hobbies :</strong>
        <%= p.getHobbies() %>
    </p>

    <p>
        <strong>Introduction :</strong>
        <%= p.getIntro() %>
    </p>

</div>

<%
}
%>

<br><br>

  <a href="index.jsp" class="back-btn">
        Back To Home
    </a>

</div>

</body>

</html>

