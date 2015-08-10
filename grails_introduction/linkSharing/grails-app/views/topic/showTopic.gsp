
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:javascript src="application.js"/>
    <meta name="layout" content="dashboard">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'dashboard-look.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'popup-lookup.css')}">
    <style>
    .multi-columns-row .col-xs-6 {
        margin-bottom: 30px;
    }
    </style>
</head>

<body>
<div class="container">
    <div class="row clearfix">
    <div class="col-md-5 col-lg-5">
        <div class="sharetweets subscriptions">
            <div class="myheading" >
                <h2>Topic:${data.topic.name}</h2>
            </div></br>
            <g:render template="/layouts/topic" model="${[topicList:data.topic]}" />
        </div>
        <br/>
      %{--  <div class="sharetweets subscriptions">
            <div class="myheading">
                <h2>Users:${data.topic.name}</h2>
            </div></br>
            <g:render template="/layouts/userTemplate" model="${[userList:data.users]}" />
        </div>--}%
        </div>
    <div class="col-md-offset-1 col-md-6 col-lg-6">
        <div class="sharetweets">
            <div class="myheading">
                <h2>Posts:${data.topic.name}</h2>
            </div>
     <br/>
            <g:render template="/layouts/resource" model="${[resourceList: data.resources]}" />
        </div>
    </div>
        </div>


    <div class=" popup-class popup-wrapper " id="linkPopUp">
        <div class="popup-container">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Share Link</h3></div>

                    <div class="panel-body">

                        <g:form controller="topic" action="createLinkResource" name="userForm">

                            <div class ="col-md-12 col-lg-12">
                                                      <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Link<span class="text-danger">*</span> :</label></div>
                                                      <div class="col-md-8"> <g:textField name="url"
                                                                                          class="form-control"
                                                                                          placeholder="Link*"/></div></div>
                            </br>
                            <div class="row"><div class="col-md-4"><label class="text-info"
                                                                          style="font-size: medium">Description<span
                                        class="text-danger">*</span> :</label></div>

                                <div class="col-md-8"><g:textArea name="description" class="form-control"
                                                                  placeholder="Description*"/></div></div>
                            </br>

                            <div class="row"><div class="col-md-4"><label class="text-info"
                                                                          style="font-size: medium">Topic <span
                                        class="text-danger">*</span> :</label></div>

                                <div class="col-md-8"><g:select name="topic"
                                                                from="${data.subscriptions}"
                                                                optionValue="name"
                                                                optionKey="id" title="Select a Topic"
                                                                class="form-control"/></div></div>

                            </div>

                                                        </br>
                            <div align="center">
                                <g:submitButton name="Share" class="btn" type="submit"
                                                style="background-color:#46b8da">Share</g:submitButton>
                                <button name="Cancel" class="btn " value="Cancel"
                                        style="background-color:#46b8da">Cancel</button></div>
                        </g:form></div></div></div>
            <a class="popup-close" href="#closed">X</a>
        </div>
    </div>

    <div class=" popup-class popup-wrapper " id="messagePopup">
        <div class="popup-container">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Send Invitation</h3></div>

                    <div class="panel-body">

                        <g:form controller="topic" action="createLinkResource" name="userForm">

                            <div class ="col-md-12 col-lg-12">
                             <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Email<span class="text-danger">*</span> :</label></div>
                             <div class="col-md-8"> <g:textField name="url" class="form-control"
                                                                 placeholder="Link*"/></div></div>
                            </br>

                            <div class="row"><div class="col-md-4"><label class="text-info"
                                                                          style="font-size: medium">Topic <span
                                        class="text-danger">*</span> :</label></div>

                                <div class="col-md-8"><g:select name="topic"
                                                                from="${data.subscriptions}"
                                                                optionValue="name"
                                                                optionKey="id" title="Select a Topic"
                                                                class="form-control"/></div></div>

                            </div>

                                                        </br>
                            <div align="center">
                                <g:submitButton name="Invite" class="btn" type="submit"
                                                style="background-color:#46b8da">Invite</g:submitButton>
                                <button name="Cancel" class="btn " value="Cancel"
                                        style="background-color:#46b8da">Cancel</button></div>
                        </g:form></div></div></div>
            <a class="popup-close" href="#closed">X</a>
        </div>
    </div>


</div>


</body>
</html>