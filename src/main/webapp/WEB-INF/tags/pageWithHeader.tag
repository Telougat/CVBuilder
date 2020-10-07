<%@tag description="Page Template" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CVBuilder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link href="${pageContext.request.contextPath}/resources/css/competences.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/anim.css" rel="stylesheet">

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.20.0/axios.min.js"></script>
</head>
<body>
<header class="w-full flex justify-end pb-32 pt-8 pr-6 uppercase space-x-10 text-blue-400 font-semibold" data-aos="fade-right">
    <a href="${pageContext.request.contextPath}/informations" class="${pageContext.request.servletPath == "/view/infos_experience.jsp" ? 'active' : '' }">Mes informations</a>
    <a href="${pageContext.request.contextPath}/templates">Mes CV</a>
    <a href="${pageContext.request.contextPath}/">Ma galerie</a>
    <a href="${pageContext.request.contextPath}/marketplace" class="${pageContext.request.servletPath == "/view/marketplace.jsp" ? 'active' : '' }">Boutique</a>
    <a href="${pageContext.request.contextPath}/logout">Deconnexion</a>
</header>
<div id="body">
    <jsp:doBody/>
</div>
<footer>
</footer>
</body>
</html>