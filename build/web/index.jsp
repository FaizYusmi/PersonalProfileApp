<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Personal Profile Management System</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{

            font-family:Arial, sans-serif;

            background:
            linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)),
            url('background.jpg');

            background-size:cover;

            background-position:center;

            background-repeat:no-repeat;

            min-height:100vh;

            display:flex;

            justify-content:center;

            align-items:center;

            padding:20px;
        }

        .container{

            width:100%;

            max-width:700px;

            background:rgba(255,255,255,0.95);

            backdrop-filter:blur(8px);

            border-radius:20px;

            padding:40px;

            box-shadow:0 10px 25px rgba(0,0,0,0.3);
        }

        .title-section{

            text-align:center;

            margin-bottom:30px;
        }

        .icon{

            font-size:60px;

            color:#243b55;

            margin-bottom:15px;
        }

        h1{

            color:#243b55;

            margin-bottom:10px;
        }

        .title-section p{

            color:#666;
        }

        .form-group{

            margin-bottom:20px;
        }

        label{

            display:block;

            margin-bottom:8px;

            font-weight:bold;

            color:#333;
        }

        input,
        textarea{

            width:100%;

            padding:14px;

            border:1px solid #ccc;

            border-radius:10px;

            font-size:15px;

            transition:0.3s;
        }

        input:focus,
        textarea:focus{

            border-color:#243b55;

            outline:none;

            box-shadow:0 0 8px rgba(36,59,85,0.3);
        }

        textarea{

            resize:none;
        }

        button{

            width:100%;

            padding:15px;

            border:none;

            border-radius:10px;

            background:#243b55;

            color:white;

            font-size:16px;

            cursor:pointer;

            transition:0.3s;
        }

        button:hover{

            background:#0f172a;

            transform:scale(1.02);
        }

        .action-buttons{

            display:flex;

            justify-content:center;

            gap:15px;

            margin-top:20px;

            flex-wrap:wrap;
        }

        .action-buttons a{

            text-decoration:none;

            color:white;

            padding:12px 20px;

            border-radius:10px;

            font-weight:bold;

            transition:0.3s;
        }

        .view-btn{

            background:#198754;
        }

        .view-btn:hover{

            background:#146c43;
        }

        .search-btn{

            background:#0d6efd;
        }

        .search-btn:hover{

            background:#0b5ed7;
        }

        @media(max-width:600px){

            .container{

                padding:25px;
            }

            h1{

                font-size:26px;
            }

            .icon{

                font-size:45px;
            }

            .action-buttons{

                flex-direction:column;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <div class="title-section">

        <i class="fa-solid fa-user-graduate icon"></i>

        <h1>Personal Profile Form</h1>

        <p>Enter your information below</p>

    </div>

    <form action="ProfileServlet" method="POST">

        <div class="form-group">

            <label>
                <i class="fa-solid fa-user"></i>
                Full Name
            </label>

            <input type="text"
                   name="name"
                   placeholder="Enter your full name"
                   required>

        </div>

        <div class="form-group">

            <label>
                <i class="fa-solid fa-id-card"></i>
                Student ID
            </label>

            <input type="text"
                   name="studentId"
                   placeholder="Enter your student ID"
                   required>

        </div>

        <div class="form-group">

            <label>
                <i class="fa-solid fa-graduation-cap"></i>
                Program
            </label>

            <input type="text"
                   name="program"
                   placeholder="Enter your program"
                   required>

        </div>

        <div class="form-group">

            <label>
                <i class="fa-solid fa-envelope"></i>
                Email
            </label>

            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

        </div>

        <div class="form-group">

            <label>
                <i class="fa-solid fa-heart"></i>
                Hobbies
            </label>

            <input type="text"
                   name="hobbies"
                   placeholder="Enter your hobbies">

        </div>

        <div class="form-group">

            <label>
                <i class="fa-solid fa-comment"></i>
                Short Introduction
            </label>

            <textarea name="intro"
                      rows="5"
                      placeholder="Tell something about yourself"></textarea>

        </div>

        <button type="submit">

            <i class="fa-solid fa-paper-plane"></i>

            Save Profile

        </button>

    </form>

    <div class="action-buttons">

        <a href="ViewProfilesServlet"
           class="view-btn">

            <i class="fa-solid fa-table"></i>
            View All Profiles

        </a>

        <a href="searchProfile.jsp"
           class="search-btn">

            <i class="fa-solid fa-magnifying-glass"></i>
            Search Profile

        </a>

    </div>

</div>

</body>

</html>
