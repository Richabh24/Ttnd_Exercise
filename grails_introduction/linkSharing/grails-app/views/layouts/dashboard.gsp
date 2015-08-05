<!DOCTYPE html>
<head>
    <title><g:layoutTitle default="Link Sharing"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'link.png')}" type="image/x-icon">
<asset:javascript src="application.js"/>
<asset:javascript src="filestyle.js"/>

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'bootstrap.min.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'dashboard-look.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'popup-lookup.css')}">
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
