<%@ page import="com.ttnd.DocumentResource" %>
<%@ page import="com.ttnd.LinkResource" %>

<g:each in="${items}" var="row" status="i">
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

    <g:if test="${session.user }">

                        <div class="row clearfix" style="font-size: 10px">
                            <g:if test="${session.user && row.createdBy.id.equals(session.user.id)}">
                                <div class="col-md-3 col-lg-3">
                                    <g:link controller="topic" action=""
                                            params="[resId: row.id]">Edit</g:link>
                                </div>

                                <div class="col-md-3 col-lg-3">
                                    <g:link controller="topic" action=""
                                            params="[resId: row.id]">Delete</g:link>
                                </div>
                            </g:if>
                            <div class="col-md-3 col-lg-3">
                                <g:if test="${row.instanceOf(com.ttnd.DocumentResource)}">
                                    <g:link controller="topic" action="downloadFile" params="[resId: row.id]">Download</g:link>
                                </g:if>
                                <g:else>


                                    <a href="${row.url}" target="_blank">View Full Site</a>
                                </g:else>
                            </div>

                            <div class="col-md-3 col-lg-3 ">
                                <g:link controller="topic" action="markAsRead"
                                        params="[uId: row.createdBy.id, resId: row.id]">Mark As Read</g:link>
                            </div>

                            <div class="col-md-3 col-lg-3 ">
                                <g:link controller="topic" action="showPost" params="[resId: row.id]">View Post</g:link>
                            </div>
                        </div></g:if>
                    </div>
                </div>
            </div>
        </div>
    </article>





</g:each>
