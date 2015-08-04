<%@ page import="com.ttnd.Topic; com.ttnd.User" %>
<g:each in="${topicList}" var="topic" status="i">

    <article class="tweet" style="background-color: #c4e3f3">
        <div class="row-fluid clearfix">
            <div class="col-md-3 col-lg-3 ">
                <div class="userImg">
                    <g:link controller="user" action="publicProfile" params="[userId: topic.createdBy.id]"><img class="tweetImg"
                                                                                                                src="${createLink(controller: 'user', action: 'displayLogo ', id: topic.createdBy?.id)}"/></g:link>
                </div>
            </div>
            <div class="col-md-9 col-lg-9">
                <div class="userPost" name="post1">
                    <div id="d${topic.id}">
                        <h2 name="e-${topic.id}">
                            <g:link action="show" controller="topic"
                                    id="${topic.id}">${fieldValue(bean: topic, field: "name")}</g:link></h2>


                        @${topic.createdBy.username} &nbsp;&nbsp;&nbsp; Subscriptions &nbsp;&nbsp;&nbsp; Posts
                        <p><g:if test="${session.user && !topic.createdBy.id.equals(session.user.id)&&subscribe.equals(false)}">
                            <g:link controller="topic" action="subscribe"
                                    params="[topic: topic.id]">Subscribe</g:link>
                        </g:if>
                        <g:else >
                            <g:link controller="topic" action="unsubscribe"
                                    params="[topic: topic.id, user: session.user.id]">Unsubscribe</g:link>
                        </g:else>
                        &nbsp;&nbsp;&nbsp;${topic.subscriptions.size()}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${topic.resources.size()}
                        </p>



                        <div style="float: left">
                            <g:select name="seriousness" from="${com.ttnd.Subscription.SeriousnessValue}"
                                      value="${topic.seriousness}" style="width: 76px;height: 30px"/>
                        </div>
                        <g:select name="visibility" from="${com.ttnd.Topic.VisibilityEnum}"
                                  value="${topic.visibility}" style="width: 76px;height: 30px"/>

                    </div>
                    <div id="div${topic.id}" style="display: none">
                        <g:form name="form1" controller="topic" action="updateTopic">
                            <g:hiddenField name="id" value="${topic.id}"/>
                            <g:textField name="name" id="t-${topic.id}" value="${topic.name}" ></g:textField>
                            <div style="float: left">
                                <g:submitButton name="s-${topic.id}" value="save" />
                            </div>
                            <div style="float: left">
                                <button type="reset" id="c-${topic.id}"
                                        onclick="editf('div${topic.id}','d${topic.id}')">Cancel</button>
                            </div>
                            <div class="row">
                                <g:if test="${session.user && !topic.createdBy.id.equals(session.user.id)}">
                                    <p> <g:link controller="topic" action="unsubscribe"
                                                params="[topic: topic.id, user: session.user.id]">Unsubscribe</g:link>

                                    </p>
                                </g:if>
                            </div>
                            <div style="float: left" class="row" >
                                <g:select name="seriousness" from="${com.ttnd.Subscription.SeriousnessValue}"
                                          value="${topic.seriousness}" style="width: 76px;height: 30px"/>
                            </div>
                            <div style="float: left">
                                <g:select name="visibility" from="${com.ttnd.Topic.VisibilityEnum}"
                                          value="${topic.visibility}" style="width: 76px;height: 30px"/>
                            </div>
                            <g:hiddenField name="createdById" value="${topic.createdBy.id}"/>
                        </g:form>
                    </div>






                    <g:if test="${topic.visibility.equals(Topic.VisibilityEnum.PUBLIC)}">
                        <a href="#popup2"><g:img dir="images" file="envelope54.png"
                                                 style="height: 20px;width: 20px"/></a>
                    </g:if>

                    <g:if test="${session.user && topic.createdBy.id.equals(session.user.id)}">
                        <a href="#" onclick="editf('d${topic.id}','div${topic.id}')"
                           onclick="editFunction('e-' +${topic.id}, 't-' +${topic.id}, 's-' +${topic.id}, 'c-' +${topic.id})">
                            <g:img
                                    dir="images" file="pencil124.png"
                                    style="height: 20px;width: 20px"/></a>
                        <a href="#" name="delete" onclick="deleteConfirm('${topic.id}')"><g:img dir="images" file="bin9.png"
                                                                                                style="height:20px;width: 20px"/></a>
                    </g:if>

                </div>
            </div>
        </div>
    </article>
</g:each>