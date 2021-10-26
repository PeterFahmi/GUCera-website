﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="availableCourses.aspx.cs" Inherits="GUCera.availableCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Courses</title>
    <link rel="shortcut icon" href="/favicon.ico"/>
    <style>
        html, body {
           
            height: 100%;
            width:100%;
            background-color:#878f99;
        }
         .topPanel{
            display:flex;
            flex-direction:row;
            position:absolute;
            z-index:100;
            height:80px;
            left:-10px;
            right:-3px;
            top:-10px;
            background-color:#074f44;
            
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 1);
        }
           .logo{
            
            margin:10px;
            margin-left:7%;
            margin-top:20px;
            width:50px;
            height:50px;
        }
           #GUCera{
           margin:10px; 
           margin-left:1%;
           color:#eeeeee;
           font-size:50px;
           font-family:cursive
       }
           #fname{
           margin:35px; 
           margin-left:3%;
           color:#aaaaaa;
           font-size:30px;
           font-family:sans-serif;
       }
        #form1{
            display:flex;
            flex-direction:row;
            margin-top:50px;
        }
        #baseDiv{
            
            margin:0 auto;
            padding:25px 25px;
            width:75%;
            min-height:100vh;
            background-color:#ffffff;
          
        }
        #courses{
            margin:30px 0;
            display:flex;
            flex-direction:row;
            flex-wrap:wrap;
            
        }
         #leftPanel{

            padding-top:30px;
            width:15%;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 1);
        }
        #home{
            width:100%;
            height:60px;
            font-size:30px;
            font-family: Circular, Helvetica, Arial, sans-serif;
            background-color:#878f99;
            border:none;
            border-bottom:thin groove #ffffff;
            border-top:thin groove #ffffff;
            color:#eeeeee;

        }
        #home:hover{
            background-color:#92a9ac;
        }
         .CourseContainer{
            margin:10px;
            margin-right:23px;
            display:flex;
            flex-direction:column;
            background-color:#82999c;
            border:2px solid #82999c;
            border-radius:5px;
            width:30%;
            min-height:400px;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.7);
            transition: transform .3s;
        }
         .CourseContainer img{
             height:320px;
         }
         .CourseContainer:hover{
             transform: scale(1.07);
         }
        .subCourseContainer{
            overflow:hidden;
            text-align:center;
            color:#ffffff;
            margin:auto;
            padding:10px 20px;
            font-size:55px;
            font-family: Circular, Helvetica, Arial, sans-serif; 
            width:80%;
            display:flex;
            flex-direction:column;
            
        }
        .subCourseContainer input{
            display:block;
            background-color:#eeeeee;
            margin: auto;
            height:80px;
            border-radius:50px;
            border:3.5px solid #eeeeee;
            width:100%;
            color:#505050;
            font-size:25px;
            font-family: Circular, Helvetica, Arial, sans-serif;    
        }
        .subCourseContainer input:hover{
            background-color:rgb(29, 166, 77);
            border:1px solid rgb(29, 166, 77);
            color:#eeeeee
        }
          #msg{
            color:#eeeeee;
            width:70%;
            height:15px;
            
        }
        #msg span{
            color:red;
            height:10px;
            width:70%;
            font-size:25px;
        }
    </style>
</head>
<body>
    <div class="topPanel">
        <img src="images//logo.png"/ class="logo"/>
        <asp:Label ID="GUCera" Text="GUCera" runat="server"></asp:Label>
        <asp:Label ID="fname" runat="server"></asp:Label>
    </div>
    <form id="form1" runat="server">
        <div id="leftPanel">
            <asp:Button ID="home" runat="server" Text="Home" OnClick="home_Click" />
        </div>
        <div id="baseDiv" runat="server">
            <div id="msg" runat="server"></div>
            <div id="courses" runat="server"></div>
        </div>
    </form>
</body>
</html>
