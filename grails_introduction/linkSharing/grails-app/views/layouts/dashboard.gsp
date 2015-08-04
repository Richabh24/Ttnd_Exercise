<!DOCTYPE html>
<head>
    <title><g:layoutTitle default="Link Sharing"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'link.png')}" type="image/x-icon">
<asset:javascript src="application.js"/>
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'dashboard-look.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'popupcss.css')}">
<style>
.multi-columns-row .col-xs-6 {
    margin-bottom: 30px;
}
</style>

<div style="background-color: rgb(30,144,255);margin-top: 5px">

<div class="nav" role="navigation">

    <g:link controller="user" action="dashboard"><g:img dir="images" file="link.png"
                                                        style="height: 70px;width: 90px;float: left"/>

        <h1 class="pull-center">Link Sharing</h1></g:link>

    <g:if test="${session.getAttribute("user")}">
        <g:render template="/layouts/menuitem"  />
        %{--<div class="top-menu" style="background-color: #c4e3f3">

            <ul class="nav navbar-nav pull-right">
                <li class="dropdown dropdown-user dropdown-dark"><div class="myMenu">
                    <a href=""><g:img dir="images" file="documentresource.jpg"
                                      style="height: 38px;width: 38px;float: right;margin-left: 10px"/></a>
                    <a href=""><g:img dir="images" file="first.png"
                                      style="height: 38px;width: 38px;float: right;margin-left: 10px"/></a>
                    <a href=""><g:img dir="images" file="message.png"
                                      style="height: 38px;width: 38px;float: right;margin-left: 10px"/></a>
                    <a href=""><g:img dir="images" file="topic.png"
                                      style="height: 38px;width: 38px;float: right;margin-left: 20px"/></a>
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
        </div>--}%
    </g:if>
</div>
</div>
<g:layoutHead/>
</head>
<body bgcolor="d3d3d3">
<div class="container">

</div>
<g:layoutBody/>
</body>
</html>
