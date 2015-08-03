<%@ page import="com.ttnd.User" %>
<%@ page import="com.ttnd.DocumentResource" %>

<!DOCTYPE html>
<html>
<head>
    <title> Link Sharing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="layout" content="dashboard">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'font-awesome.min.css')}">
    <asset:javascript src="application.js"/>

</head>
<body>
<div class="container" >
        <div class="col-md-12 col-lg-9 col-md-push-1">
    </div><br/><br/>

    <div class="row clearfix">
        <div class="col-md-6 col-lg-6">
            <div class=" clearfix">
                <div class="panel-group">
                    <div class="panel panel-primary">
                        <div class="panel-heading"><h3 class="panel-title">Recent Share</h3></div>
                        <div class="panel-body">
                            <g:each in="${data.recentResources}" var="row" status="i">
                                <article class="boxseperation" style="background-color: #c4e3f3">
                                    <div class="row-fluid clearfix">
                                        <div class="col-md-3 col-lg-3 ">
                                            <div class="userImg">
                                                <g:link ><img class="tweetImg" src="${createLink(controller: 'user', action: 'displayLogo ', id: row.createdBy?.id)}"/></g:link>
                                            </div>
                                        </div>
                                        <div class="col-md-9 col-lg-9 ">
                                            <div class="userdecription">
                                                <div class="row">
                                                    <div class="col-md-8 col-lg-8 ">
                                                        <div class="row pull-left">
                                                            <h4>${row.createdBy.fullName}</h4>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-lg-4 ">
                                                        <div class="row pull-right"><h2>
                                                            <g:link><h4>${fieldValue(bean: row.topic, field: "name")}</h4></g:link></h2>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                        <p>${row.description}.</p>
                                                </div>
                                                <div class="row clearfix" style="font-size: 15px">
                                                    <div class="col-md-3 col-lg-3 ">
                                                        <g:link ><i class="fa fa-facebook-square"></i></g:link>
                                                        <g:link ><i class="fa fa-google-plus-square"></i></g:link>
                                                        <g:link><i class="fa fa-twitter-square"></i></g:link> </div>


                                                    <div class="col-md-3 col-lg-3 " style="font-size: 10px">
                                                        <div class="row pull-right">
                                                        <g:link  params="[resId: row.id]"><u>View Post</u></g:link></div>
                                                    </div></div></div></div></div>
                                </article>

                            </g:each>


                                </table>

                        </div></div></div></div>
        </div>

        <div class="col-md-offset-2 col-md-4 col-lg-4">
            <div class="panel-group">

                <div class="panel panel-primary">
      <div class="panel-heading"><h3 class="panel-title">Login</h3></div>
      <div class="panel-body">

            <g:form controller="login" action="login"  name="userForm">

                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <g:textField name="email" class="form-control" placeholder="Email address"/>
                </div>
                <br/>

                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <g:passwordField name="password" class="form-control" placeholder="Password"/>
                </div>



                <br/>
                <g:link title="Forgot Password" controller="login" action="index"
                        style="color: rgb(100, 102, 242); margin-right: 60px">Forgot Password</g:link>
                <g:submitButton name="Sign In" class="btn  btn-primary "
                                style="background-color: rgb(30,144,255)"/>
            </g:form>
</div></div></div>






            </br></br>
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Register</h3></div>
                    <div class="panel-body">
                        <g:uploadForm enctype="multipart/form-data" controller="login"
                          action="register"  name="registerForm">

                <g:textField name="firstName" class="form-control" placeholder="First Name"/>
                <g:textField name="lastName" class="form-control" placeholder="Last Name"/>
                <g:textField name="email" class="form-control" placeholder="Email address"/>
                <g:textField name="username" class="form-control" placeholder="Username"/>
                <g:passwordField name="password" class="form-control" placeholder="Password"/>
                <g:passwordField name="confirmPassword" class="form-control" placeholder="Confirm Password"/>
                <input type="file" class="form-control" name="photo" class="form-control" placeholder="Photo"/>

                <br/>
                <g:submitButton name="Sign Up" class="btn  btn-primary "
                                style="background-color: rgb(30,144,255);margin-left: 150px;"/>
            </g:uploadForm></div></div></div>
        </div>
    </div>

</br>
    <div class="row clearfix">
        <div class="col-md-6 col-lg-6">
            <div class=" clearfix">
                <div class="panel-group">

                    <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Top Post </h3></div>
                    <div class="panel-body">

                       %{-- <g:render template="resourceTemplate"
                          model="${[resourceList: data.topResources]}"/>
                    --}%
                    </div></div></div>

            </div>
        </div>


    </div>

</div>
<script>
    $(document).ready(function () {


        $('#registerForm').validate({
            rules: {
                username: {

                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                firstName: {
                    required: true
                },
                lastName: {
                    required: true

                },
                password: {
                    required: true
                },
                confirmPassword: {
                    required: true


                }
            },
            messages: {
                username: {
                    required: "Please enter your user name."
                },
                password: {
                    required: "Please enter your password."

                },
                firstName: {
                    required: "Please enter your firstname."
                },
                lastName: {
                    required: "Please enter your last name."

                },
                email: {
                    required: "Please enter your email."
                },
                confirmPassword: {
                    required: "Please confirm your password."

                }
            }
        });

        $("#login").click(function () {
            $('#userForm').validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        password: true

                    }

                },
                messages: {
                    email: {
                        required: "Please enter your email."
                    },
                    password: {
                        required: "Please enter your password."

                    }
                }
            });
        });
    })
</script>
<g:if test="${flash.message}">
    <script>showSuccess('${flash.message}')</script>
%{--  <g:message error="${flash.message}" class="error"/>--}%
</g:if>





</body>
</html>
%{--<g:render template="resourceTemplate"
                         model="${[resourceList: data.recentResources]}"/>--}%