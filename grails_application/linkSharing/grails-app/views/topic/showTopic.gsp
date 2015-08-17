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
</br></br>
        <div class="row clearfix">

            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Topic :     ${data.topic.name}</h3></div>
                    <div class="panel-body">
                        <g:render template="/layouts/topic" model="${[topicList:data.topic]}" /></div></div></div>


        </div>
    </br></br>

        <div class="row clearfix">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Users
                    </h3></div>

                    <div class="panel-body">
                        <g:render template="/layouts/users" model="${[userList:data.users]}" />

                    </div></div></div>

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
                    <g:render template="/layouts/resource" model="${[items: data.resources]}" />

                    </div>
                <g:paginate action="show" total="${data.resourceCount}" max="5" params="[res:true,data:data,id:data.topic.id]" />


                </div></div></div>


</div>





<g:if test="${flash.message}">
    <script>showSuccess('${flash.message}')</script>

</g:if>

</body>
</html>
