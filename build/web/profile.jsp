<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<title>Profile Details</title>

<style>

body{
    font-family:Arial;
    background:#f4f4f4;
    padding:40px;
}

.container{
    width:700px;
    margin:auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.2);
}

h1{
    color:#243b55;
}

p{
    font-size:18px;
}

</style>

</head>

<body>

<div class="container">

<h1>Profile Details</h1>

<p><b>Name:</b> ${name}</p>

<p><b>Student ID:</b> ${studentId}</p>

<p><b>Program:</b> ${program}</p>

<p><b>Email:</b> ${email}</p>

<p><b>Hobbies:</b> ${hobbies}</p>

<p><b>Introduction:</b> ${intro}</p>

<br>

<a href="index.jsp">Back</a>

</div>

</body>

</html>
