<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 24/7/15
  Time: 3:13 PM
--%>
<%@ page import="com.ttnd.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Link Sharing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="layout" content="main">
%{--
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}">
--}%
%{--
    <link rel="shortcut icon" href="${assetPath(src: 'link.png')}" type="image/x-icon">
--}%
    <asset:javascript src="application.js"/>
    <style>
    .multi-columns-row .col-xs-6 {
        margin-bottom: 30px;
    }
    </style>
</head>

<body>
<div class="container">

    <div class="col-md-12 col-lg-9 col-md-push-1">
    </div><br/><br/>

    <div class="row clearfix">
        <div class="col-md-6 col-lg-6">
            <div class="sharetweets clearfix">
                <div class="myHeading clearfix">
                </div>

            </div>
        </div>

        <div class="col-md-offset-2 col-md-4 col-lg-4">
            <g:form controller="login" action="login" class="form-signin2" name="userForm">
                <div class="myHeading clearfix">
                    <h2>Login</h2>
                </div>
                <br/>

                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                  UserName  <g:textField name="email" class="form-control" placeholder="Email address"/>
                </div>
                <br/>

                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                  Password  <g:passwordField name="password" class="form-control" placeholder="Password"/>
                </div>

                <br/>
                <g:submitButton name="login" class="btn btn-lg btn-primary btn-block"
                                style="background-color: rgb(300, 880, 315)"/>
            </g:form>
            <g:uploadForm enctype="multipart/form-data" controller="login"
                          action="register" class="form-signin3" name="registerForm">
                <div class="myHeading clearfix panel">
                    <h2>Register</h2>
                </div></br>
                <g:textField name="firstName" class="form-control" placeholder="First Name"/>
                <g:textField name="lastName" class="form-control" placeholder="Last Name"/>
                <g:textField name="email" class="form-control" placeholder="Email address"/>
                <g:textField name="username" class="form-control" placeholder="Username"/>
                <g:passwordField name="password" class="form-control" placeholder="Password"/>
                <g:passwordField name="confirmPassword" class="form-control" placeholder="Confirm Password"/>
                <input type="file" class="form-control" name="photo" class="form-control" placeholder="Photo"/>

                <br/>
                <g:submitButton name="Register" class="btn btn-lg btn-primary btn-block"
                                style="background-color: rgb(300, 162, 242)"/>
                </fieldset>
            </g:uploadForm>
            </div></div></div></body></html>


