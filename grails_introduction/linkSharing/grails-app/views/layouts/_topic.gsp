<%@ page import="com.ttnd.Topic; com.ttnd.User" %>
<div id="greetingBox">
        </div>
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
                        <div id="c1${topic.id}">

                        <h2 name="e-${topic.id}">
                            <g:link action="show" controller="topic"
                                    id="${topic.id}">${fieldValue(bean: topic, field: "name")}</g:link></h2>
</div>
                        <div id="c2${topic.id}" style="display: none">

                            <h2 name="h-${topic.id}">
                                 <input style="width:150px;" type="text" name="name" id="tempname" value="${fieldValue(bean: topic, field: "name")}" onchange="ChangeTopicValues('${topic.seriousness}',${topic.id},'${topic.visibility}',this.value,${session.user.id})"/>
                                <button onclick="ChangeTopicValues('${topic.seriousness}',${topic.id},'${topic.visibility}',tempName(),${session.user.id});location.reload();">Save</button>
                                <button onclick="editTopic('c2${topic.id}','c1${topic.id}'); location.reload(); ">Cancel</button>
                            </h2>

                        </div>


                        @${topic.createdBy.username} &nbsp;&nbsp;&nbsp; Subscriptions &nbsp;&nbsp;&nbsp; Posts
</br>
                   <p style="margin-left: 90px">&nbsp;&nbsp;&nbsp;${topic.subscriptions.size()}  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${topic.resources.size()}
                       </p> <g:if test="${session.user && topic.createdBy.id.equals(session.user.id)&& subscribe.equals(true)}">
                            <p><g:link controller="topic" action="unsubscribe"
                                       params="[topic: topic.id, user: session.user.id]">Unsubscribe</g:link>
                            </p>
                        </g:if>
                        <g:elseif test="${session.user &&topic.isSubscribed.equals(true)}">


                                <p><g:link controller="topic" action="unsubscribe"
                                       params="[topic: topic.id,user: session.user.id]">Unsubscribe</g:link></p>
                        </g:elseif>

                        <g:elseif test="${session.user && topic.isSubscribed.equals(false)}">

                                <p><g:link controller="topic" action="subscribe"
                                           params="[topic: topic.id,user: session.user.id]">subscribe</g:link>
                                </p>
                            </g:elseif>




                        <div style="float: left">
                            <g:select name="seriousness" from="${com.ttnd.Subscription.SeriousnessValue}"
                                      value="${topic.seriousness}" style="width: 76px;height: 30px" id ="seriousnessiD" onchange="ChangeTopicValues(this.value,${topic.id},'${topic.visibility}','${topic.name}',${session.user.id})"/>
                        </div>
                        <g:select name="visibility" from="${com.ttnd.Topic.VisibilityEnum}"
                                  value="${topic.visibility}" style="width: 76px;height: 30px" id ="visibilityid" onchange="ChangeTopicValues('${topic.seriousness}',${topic.id},this.value,'${topic.name}',${session.user.id})"/>

                    </div>
                    <g:if test="${topic.visibility.equals(Topic.VisibilityEnum.PUBLIC)}">
                        <a href="#messagePopup"><g:img dir="images" file="envelope54.png"
                                                 style="height: 20px;width: 20px"/></a>
                    </g:if>

                    <g:if test="${session.user && topic.createdBy.id.equals(session.user.id)}">
                        <a href="#" onclick="editTopic('c1${topic.id}','c2${topic.id}')">
                            <g:img
                                    dir="images" file="pencil124.png"
                                    style="height: 20px;width: 20px"/></a>







                        <g:link controller="topic" action="deleteTopic" params="[id: topic.id]" onclick="return confirm('Are You sure want to delete ??')"><g:img dir="images" file="bin9.png"
                                                                                                                      style="height:20px;width: 20px"/></g:link>
                      </g:if>

                </div>
            </div>
        </div>
    </article>
</g:each>
<script>


    function ChangeTopicValues( seriousness,id,visible,name,user){
       // alert("topic--->"+id +"  seriousnes ->  "+seriousness+"  visibility=="+visible+"  name-->"+name +"   user=="+user);
        <g:remoteFunction controller="topic" action="updateTopicProperty" update= "greetingBox" params="'id='+id+'&name='+name+'&seriousness='+seriousness+'&visibility='+visible+'&createdById='+user"/>

       

    }
function tempName(){
    var myInput = document.getElementById('tempname').value;
return myInput;
}

</script>
