<%@tag description="Page Template" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CVBuilder</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.20.0/axios.min.js"></script>
</head>
<body>
<header class="w-full flex justify-end pb-32 pt-8 pr-6 uppercase space-x-10 text-blue-400 font-semibold">
    <a href="#" class="${pageContext.request.servletPath == "/view/infos_experience.jsp" ? 'active' : '' }">Mes informations</a>
    <a href="#">Créer un cv</a>
    <a href="#">Ma galerie</a>
    <a href="#" class="${pageContext.request.servletPath == "/view/marketplace.jsp" ? 'active' : '' }">Boutique</a>
    <a href="#">Deconnexion</a>
</header>
<div id="body">
    <jsp:doBody/>
</div>
<footer>
</footer>
</body>
</html>