<%@tag description="Page Template" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CVBuilder</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
<header class="w-full h-40">
</header>
<div id="body">
    <jsp:doBody/>
</div>
<footer>
</footer>
</body>
</html>