<%@ page import="com.ttnd.Topic; com.ttnd.User" %>

<%@ page import="co.TopicCO" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:javascript src="application.js"/>
    <asset:javascript src="linksharing.js"/>
    <asset:javascript src="bootstrap-dialog.js"/>


    <meta name="layout" content="dashboard">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'dashboard-look.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'popup-lookup.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap-dialog.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'font-awesome.min.css')}">

    <style>
    .multi-columns-row .col-xs-6 {
        margin-bottom: 30px;
    }
    </style>
</head>

<body>

<div class="container">
    <div class="col-md-5 col-lg-5">

        <div class="row clearfix">
            <article class="user">
                <% com.ttnd.User user = data.user
                %>
                <div class="row-fluid clearfix">
                    <div class="col-md-3 col-lg-3 ">
                        <div class="userImg">
                            <img src="${createLink(controller: 'user', action: 'displayLogo ', id: user?.id)}"/>
                        </div>
                    </div>

                    <div class="col-md-9 col-lg-9 ">
                        <div class="userPost">
                            <h4>${user.fullName} </br>@${user.username}</h4>


                        </br>  </br>

                            <table class="table" cellspacing="0" cellpadding="0"><tr><td><p>Subscriptions</p>
                            </td><td><p>Topics</p></td></tr>
                                <tr><td>${data.subscriptionCount}</td><td>${data.topicCount}</td></tr>
                            </table>

                        </div>
                    </div>

                </div>
            </article>

        </div>

        <div class="row clearfix">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Subscriptions
                        </h3></div>

                    <div class="panel-body">
                        <g:render template="/layouts/topic" model="${[topicList:data.subscriptions]}" />
                        <div class="pagination">
                        <g:paginate action="subscriptionList" total="${data.subscriptionCount}" max="3" params="[top:true,data:data]"/>
</div>

                    </div>
                </div>
            </div>
        </div>





    </br></br>

    </div>


    <div class="col-md-7 col-lg-7"></br></br>
        <div class="panel-group">
            <div class="panel panel-primary">
                <div class="panel-heading">Posts
                    <input type="text" class="form-control" id="inputSuccess2" placeholder="Search"
                           style="height: 22px;width: 154px;float: right"/></div>

                <div class="panel-body">
                    <g:render template="/layouts/resource" model="${[items:data.inbox]}" />
                </div><g:paginate action="subscriptionList" total="${data.topicCount}" max="3" params="[res:true,data:data]" />                </div></div></div>
    </div>




</div>





<g:if test="${flash.message}">
    <script>showSuccess('${flash.message}')</script>

</g:if>

</body>
</html>
