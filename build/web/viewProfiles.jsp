<%@page import="java.util.ArrayList"%>
<%@page import="bean.ProfileBean"%>

<%
ArrayList<ProfileBean> profileList =
(ArrayList<ProfileBean>) request.getAttribute("profileList");

if(profileList == null){
    profileList = new ArrayList<ProfileBean>();
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>

    <!-- Font Awesome 6.5.1 -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        body{
            font-family:Arial,sans-serif;
            background:
            linear-gradient(rgba(0,0,0,0.4),
            rgba(0,0,0,0.4)),
            url('background.jpg');

            background-size:cover;
            background-position:center;
            min-height:100vh;

            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;

            padding:20px;
        }

        .container{
            width:95%;
            max-width:1200px;
            background:rgba(255,255,255,0.95);
            border-radius:20px;
            padding:30px;
            box-shadow:0 10px 25px rgba(0,0,0,0.3);
            text-align:center;
        }

        h1{
            color:#243b55;
            margin-bottom:20px;
        }

        /* FILTER BOX */
        .filter-box{
            background:#243b55;
            padding:20px;
            border-radius:12px;

            display:flex;
            flex-wrap:wrap;
            gap:20px;

            justify-content:space-between;
            align-items:flex-end;

            margin-bottom:25px;
        }

        .filter-group{
            display:flex;
            flex-direction:column;
            color:white;
        }

        .filter-group label{
            font-size:14px;
            margin-bottom:6px;
            font-weight:bold;
        }

        .filter-group input,
        .filter-group select{
            padding:10px;
            border:none;
            border-radius:6px;
            width:200px;
        }

        .filter-group input:focus,
        .filter-group select:focus{
            outline:none;
            box-shadow:0 0 8px rgba(255,255,255,0.4);
        }

        .search-btn{
            padding:10px 20px;
            background:white;
            border:none;
            border-radius:6px;
            font-weight:bold;
            cursor:pointer;
            transition:0.3s;
        }

        .search-btn:hover{
            background:#ffc107;
            transform:translateY(-2px);
        }

        /* TABLE */
        table{
            width:100%;
            border-collapse:collapse;
        }

        table th{
            background:#243b55;
            color:white;
            padding:12px;
        }

        table td{
            padding:10px;
            border:1px solid #ddd;
        }

        table tr:nth-child(even){
            background:#f8f9fa;
        }

        table tr:hover{
            background:#eef3ff;
        }

        .back-btn{
            display:inline-block;
            margin-top:20px;
            padding:10px 20px;
            background:#243b55;
            color:white;
            text-decoration:none;
            border-radius:8px;
        }

        .back-btn:hover{
            background:#0f172a;
        }

    </style>
</head>

<body>

<div class="container">

    <h1>All Student Profiles</h1>

    <!-- FILTER FORM -->
    <form action="ViewProfilesServlet" method="get">

        <div class="filter-box">

            <div class="filter-group">
                <label>Search Name</label>
                <input type="text" name="search" placeholder="Enter student name">
            </div>

            <div class="filter-group">
                <label>Programme</label>
                <select name="program">
                    <option value="">All Programme</option>
                    <option value="CS240">CS240</option>
                    <option value="HM261">HM261</option>
                    <option value="CS110">CS110</option>
                    <option value="CS230">CS230</option>
                </select>
            </div>

            <div class="filter-group">
                <label>Sort By</label>
                <select name="sort">
                    <option value="name">Name</option>
                    <option value="studentId">Student ID</option>
                    <option value="program">Programme</option>
                </select>
            </div>

            <div class="filter-group">
                <label>Order</label>
                <select name="order">
                    <option value="ASC">Ascending</option>
                    <option value="DESC">Descending</option>
                </select>
            </div>

            <div class="filter-group">
                <label>&nbsp;</label>
                <button type="submit" class="search-btn">
                    <i class="fa-solid fa-magnifying-glass"></i> Search
                </button>
            </div>

        </div>

    </form>

    <!-- TABLE -->
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Student ID</th>
            <th>Program</th>
            <th>Email</th>
            <th>Hobbies</th>
        </tr>

        <%
        for(ProfileBean p : profileList){
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getStudentId() %></td>
            <td><%= p.getProgram() %></td>
            <td><%= p.getEmail() %></td>
            <td><%= p.getHobbies() %></td>
        </tr>
        <%
        }
        %>

    </table>

    <a href="index.jsp" class="back-btn">Back To Home</a>

</div>

</body>
</html>