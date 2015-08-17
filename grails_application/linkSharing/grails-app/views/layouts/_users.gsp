<%@ page import="com.ttnd.User" %>

<g:each in="${userList}" var="user" status="i">
    <article class="tweet" style="background-color: #c4e3f3">
        <div class="row-fluid clearfix">
            <div class="col-md-3 col-lg-3 ">
                <div class="userImg">
                    <g:link controller="user" action="publicProfile" params="[userId: user.id]">
                        <img class="tweetImg" src="${createLink(controller: 'user', action: 'displayLogo ', id: user.id)}"/></g:link>
                </div>
</div>
                <div class="userPost" >
                    <h2>${user.fullName} @${user.username}</h2>
                    <p>Subscriptions (  %{--${user.subcriptionCount}  --}%  )     Topics  ( ${user.topics.size()} )</p>

                </div>

        </div>
    </article>
</g:each>







