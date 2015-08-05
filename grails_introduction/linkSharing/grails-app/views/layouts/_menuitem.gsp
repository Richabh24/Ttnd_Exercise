<div class="top-menu" style="background-color: #c4e3f3">

    <ul class="nav navbar-nav pull-right">
        <li class="dropdown dropdown-user dropdown-dark"><div class="myMenu">
            <a href="#documentPopUp"><g:img dir="images" file="documentresource.jpg"
                              style="height: 38px;width: 38px;float: right;margin-left: 10px"  title="Document Creation"/></a>
            <a href="#linkPopUp"><g:img dir="images" file="first.png"
                              style="height: 38px;width: 38px;float: right;margin-left: 10px" title="Link Creation"/></a>
            <a href="#messagePopup"><g:img dir="images" file="message.png"
                              style="height: 38px;width: 38px;float: right;margin-left: 10px" title="Invitation"/></a>
            <a href="#topicpopup"><g:img dir="images" file="topic.png"
                              style="height: 38px;width: 38px;float: right;margin-left: 20px" title="Topic Creation"/></a>
            <span class="glyphicon glyphicon-search form-control-feedback" style="font-size: 30px" ></span>
            <input type="text" class="form-control " id="inputSuccess2" placeholder="Search"
                   style="height: 38px;width: 168px;float: right"/>


        </div></li>
        <li class="dropdown  " style="margin-top: -15px; height:38px;">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
               data-close-others="true" style="height: 60px">
                <img style="background-color: #c4e3f3;width:50px;height: 50px" alt="" class="img-circle"
                     src="${createLink(controller: 'user', action: 'displayLogo', id: session.user.id)}">
                <span>${session.user.firstName}</span>
            </a><ul class="dropdown-menu dropdown-menu-default">
            <li>
                <g:link>
                    <i class="icon-user"></i> My Profile</g:link>
            </li>
            <g:if test="${session.user.admin}">

                <li>
                    <a href="test.html">
                        <i class="icon-users"></i> Users</a>
                </li>
                <li>
                    <a href="test.html">
                        <i class="icon-bag"></i> Topics</a>
                </li>

                <li>
                    <a href="test.html">
                        <i class="icon-book-open"></i> Posts</a>
                </li>

            </g:if>

            <li class="divider">
            </li>
            <li>
                <g:link controller="login" action="logout">
                    <i class="icon-key"></i> Log Out</g:link>
            </li>
        </ul>
        </li>
    </ul>

</div>
</div>