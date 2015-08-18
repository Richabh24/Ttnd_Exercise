<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <script>


        $(function(){
            $('.rating-select .btn').on('mouseover', function(){
                $(this).removeClass('btn-default').addClass('btn-warning');
                $(this).prevAll().removeClass('btn-default').addClass('btn-warning');
                $(this).nextAll().removeClass('btn-warning').addClass('btn-default');
            });

            $('.rating-select').on('mouseleave', function(){
                active = $(this).parent().find('.selected');
                if(active.length) {
                    active.removeClass('btn-default').addClass('btn-warning');
                    active.prevAll().removeClass('btn-default').addClass('btn-warning');
                    active.nextAll().removeClass('btn-warning').addClass('btn-default');
                } else {
                    $(this).find('.btn').removeClass('btn-warning').addClass('btn-default');
                }
            });
            $('.rating-select .btn').click(function(){
                if($(this).hasClass('selected')) {
                    var rating = $(this).index()+1
                    var resid =${data.inbox.id}
                     var user =${data.inbox.createdBy.id}
                    <g:remoteFunction controller="topic" action="saveResourceRating" params="'resid='+resid+'&rating='+rating+'&createdBy='+user"/>

                     /*$('.rating-select .selected').removeClass('selected');
                     */
                } else {
                    $('.rating-select .selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            });
        });

    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:javascript src="application.js"/>
    <g:javascript library="jquery"/>
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
    <div class="col-md-6 col-lg-6">
        <br><br>

        <div class="col-md-12 col-lg-12">

            <div class="row clearfix">

                <div class="panel-group">
                    <div class="panel panel-primary">
                        <div class="panel-heading"><h3 class="panel-title">Resources


                        </h3></div>

                        <div class="panel-body">

                            <g:render template="/layouts/resource"
                                      model="${[items: data.inbox, rating: data.topicCount]}"/>
                        <div class="rating-select" align="right">

                            <g:if test="${data.topicCount.toString() >'0' }">

                                <% def count=5 %>

                                <g:each in="${1..count}" var="c" >
                                    <g:if test="${data.topicCount.toString() >'0' && c.toString()<=data.topicCount.toString()  }">
                                        <div class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-star-empty"></span></div>
                                    </g:if>
                                    <g:else>
                                        <div class="btn btn-default btn-sm"><span class="glyphicon glyphicon-star-empty"></span></div>

                                    </g:else>
                                </g:each>

</g:if><g:else>
                                <div class="btn btn-default btn-sm" id="d1"><span class="glyphicon glyphicon-star-empty"></span></div>
                                <div class="btn btn-default btn-sm" id ="d2"><span class="glyphicon glyphicon-star-empty"></span></div>
                                <div class="btn btn-default btn-sm" id="d3"><span class="glyphicon glyphicon-star-empty"></span></div>
                                <div class="btn btn-default btn-sm" id ="d4"><span class="glyphicon glyphicon-star-empty"></span></div>
                                <div class="btn btn-default btn-sm" id ="d5"><span class="glyphicon glyphicon-star-empty"></span></div>

                            </g:else>
                        </div>


                        </div></div></div>
            </div>
        </div></div>

    <div class="col-md-6 col-lg-6">
    </br></br>
        <div class="row clearfix">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Trending Topics
                    </h3></div>

                    <div class="panel-body">



                        <g:render template="/layouts/topic" model="${[topicList: data.trendings, subscribe: false]}"/>


                    </div></div></div>

        </div></div>

    <div class=" popup-class popup-wrapper " id="linkPopUp">
        <div class="popup-container">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Share Link</h3></div>

                    <div class="panel-body">

                        <g:form controller="topic" action="createLinkResource" name="userForm">

                            <div class ="col-md-12 col-lg-12">

                              <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Title<span class="text-danger">*</span> :</label></div>
                                                      <div class="col-md-8"> <g:textField name="title"
                                                                                          class="form-control"
                                                                                          placeholder="Title*"/></div></div>
                            </br>


                            <div class="row"><div class="col-md-4"><label class="text-info"
                                                                          style="font-size: medium">Link<span
                                        class="text-danger">*</span> :</label></div>

                                <div class="col-md-8"><g:textField name="url" class="form-control"
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

    <div class=" popup-class popup-wrapper " id="documentPopUp">
        <div class="popup-container">
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 class="panel-title">Share Document</h3></div>

                    <div class="panel-body">

                        <g:uploadForm enctype="multipart/form-data" controller="topic" action="createDocResource"
                                      class="form-signin2" name="userForm">

                            <div class ="col-md-12 col-lg-12">
                              <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Title<span class="text-danger">*</span> :</label></div>
                                                      <div class="col-md-8"> <g:textField name="title"
                                                                                          class="form-control"
                                                                                          placeholder="Title*"/></div></div>
                            </br>
                            <div class="row"><div class="col-md-4"><label class="text-info"
                                                                          style="font-size: medium">Document<span
                                        class="text-danger">*</span> :</label></div>

                                <div class="col-md-8">

                                    <input type="file" name="file" class="form-control" placeholder="Document"/>

                                </div></div>
                            </br>

                            <div class="row"><div class="col-md-4"><label class="text-info"
                                                                          style="font-size: medium">Description<span
                                        class="text-danger">*</span> :</label></div>

                                <div class="col-md-8"><g:textArea name="description" class="form-control"
                                                                  placeholder="Description*"/></div></div>
                            </br>

                            <div class="row"><div class="col-md-4"><label class="text-info"
                                                                          style="font-size: medium">Topic<span
                                        class="text-danger">*</span> :</label></div>

                                <div class="col-md-8"><g:select name="topic" from="${data.subscriptions}" optionKey="id"
                                                                optionValue="name"
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
                             <div class="col-md-8"> <g:textField name="name" class="form-control"
                                                                 placeholder="Topic Name"/></div></div>
                            </br>

                            <div class="row"><div class="col-md-4"><label class="text-info"
                                                                          style="font-size: medium">Seriousness<span
                                        class="text-danger">*</span> :</label></div>

                                <div class="col-md-8"><g:select name="seriousness" class="form-control"
                                                                from="${com.ttnd.Subscription.SeriousnessValue}"/></div>
                            </div>
                            <br/>

                            <div class="row"><div class="col-md-4"><label class="text-info"
                                                                          style="font-size: medium">Visibility<span
                                        class="text-danger">*</span> :</label></div>

                                <div class="col-md-8"><g:select name="visibility" class="form-control"
                                                                from="${com.ttnd.Topic.VisibilityEnum}"/></div></div>
                            <br/>

                            <g:hiddenField name="createdById" value="${data.user.id}"/>


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

                        <g:form controller="topic" action="sendMail" name="userForm">

                            <div class ="col-md-12 col-lg-12">
                             <div class="row"  ><div class="col-md-4"><label class="text-info" style="font-size: medium" >Email<span class="text-danger">*</span> :</label></div>
                             <div class="col-md-8"> <g:textField name="receiverEmail" class="form-control"
                                                                 placeholder="Email*"/></div></div>
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
