<%@ page import="com.ttnd.Topic; com.ttnd.User" %>

<%@ page import="co.TopicCO" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:javascript src="application.js"/>
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
                <% com.ttnd.User user = session.user
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
                        <g:link style="float: right" controller="topic"
                                action="subscriptionList">view all</g:link></h3></div>

                    <div class="panel-body">
                        <g:render template="/layouts/topic"
                                  model="${[topicList: data.subscriptions]}"/>

                    </div>
                </div></div>


        </br></br>
            <div class="row clearfix">
                <div class="panel-group">
                    <div class="panel panel-primary">
                        <div class="panel-heading"><h3 class="panel-title">Trending Topics
                            <g:link style="float: right" controller="topic"
                                    action="subscriptionList">view all</g:link></h3></div>

                        <div class="panel-body">
                            <g:render template="/layouts/topic"
                                      model="${[topicList: data.trendings, subscribe: false]}"/>

                        </div></div></div>
            </div>



        </br></br>

        </div>
    </div>


    <div class="col-md-7 col-lg-7"></br></br>
        <div class="panel-group">
            <div class="panel panel-primary">
                <div class="panel-heading">Inbox
                    <input type="text" class="form-control" id="inputSuccess2" placeholder="Search"
                           style="height: 22px;width: 154px;float: right"/></div>

                <div class="panel-body">
                    <g:render template="/layouts/resource" model="${[items: data.inbox]}"/>
                </div></div></div>
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
                                                      <div class="col-md-8"> <g:textField name="url" class="form-control" placeholder="Link*"/></div></div>
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
    <div class=" popup-class popup-wrapper " id="documentPopUp">
        <div class="popup-container">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Share Document</h3></div>

                    <div class="panel-body">

                        <g:uploadForm enctype="multipart/form-data" controller="topic" action="createDocResource"
                                      class="form-signin2" name="userForm">


                            <div class ="col-md-12 col-lg-12">
                                                    <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Document<span class="text-danger">*</span> :</label></div>
                                                    <div class="col-md-8">

                                                    <input type="file"  name="file" class="form-control" placeholder="Document"/>



                                                    </div></div>
                            </br>

                              <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Description<span class="text-danger">*</span> :</label></div>
                                                    <div class="col-md-8">  <g:textArea name="description" class="form-control" placeholder="Description*"/></div></div>
                            </br>

                            <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Topic<span class="text-danger">*</span> :</label></div>
                                <div class="col-md-8"> <g:select name="topic" from="${data.subscriptions}" optionKey="id" optionValue="name"
                                                                 title="Select a Topic" class="form-control"/>
                                </div></div>



                            </br>

                        <div align="center">
                                <g:submitButton name="Share" class="btn" type="submit"
                                                style="background-color:#46b8da">Share</g:submitButton>
                                <button name="Cancel" class="btn " value="Cancel"
                                        style="background-color:#46b8da">Cancel</button></div></div>
                        </g:uploadForm></div></div></div>
            <a class="popup-close" href="#closed">X</a>
        </div>
    </div>
    <div class=" popup-class popup-wrapper " id="topicpopup">
        <div class="popup-container">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Create Topic</h3></div>

                    <div class="panel-body">

                        <g:form controller="topic" action="createTopic" class="form-signin2popup" name="userForm">
                            <div class="myHeading2">
                                <h2>Create Topic</h2>
                            </div>
                            <br/>

                            <div class ="col-md-12 col-lg-12">
                             <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Topic Name <span class="text-danger">*</span> :</label></div>
                             <div class="col-md-8"> <g:textField name="name" class="form-control" placeholder="Topic Name"/></div></div>
                            </br>

                            <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Seriousness<span class="text-danger">*</span> :</label></div>
                                <div class="col-md-8"> <g:select name="seriousness" class="form-control"
                                                                 from="${com.ttnd.Subscription.SeriousnessValue}"/></div></div>
                            <br/>
                            <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Visibility<span class="text-danger">*</span> :</label></div>
                                <div class="col-md-8"> <g:select name="visibility" class="form-control"
                                                                 from="${com.ttnd.Topic.VisibilityEnum}"/></div></div>
                            <br/>



                            <g:hiddenField name="createdById" value="${session.user.id}"/>

                                               </br>
                            <div align="center">
                                <g:submitButton name="Save" class="btn" type="submit"
                                                style="background-color:#46b8da">Save</g:submitButton>
                                <button name="Cancel" class="btn " value="Cancel"
                                        style="background-color:#46b8da">Cancel</button></div></div>
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
                             <div class="col-md-8"> <g:textField name="url" class="form-control" placeholder="Link*"/></div></div>
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




<script type="text/javascript">

</script>
<g:if test="${flash.message}">
    <script>showSuccess('${flash.message}')</script>

</g:if>

</body>
</html>
