<%@tag description="Page Template" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CVBuilder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link href="${pageContext.request.contextPath}/resources/css/competences.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/anim.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.20.0/axios.min.js"></script>
</head>
<body class="relative">
<a href="${pageContext.request.contextPath}/">
    <img class="absolute left-0 top-0 hidden lg:block lg:mt-6 lg:ml-10 lg:w-24 xl:w-32" src="${pageContext.request.contextPath}/resources/images/cv.svg" alt="CV" id="logoAppli">
</a>
<header class="w-full space-y-5 lg:space-y-0 lg:flex justify-end pb-32 pt-8 pr-6 uppercase space-x-10 text-blue-400 font-semibold">
    <div class="ml-10" data-aos="fade-down">
        <a href="${pageContext.request.contextPath}/informations" class="w-full ${pageContext.request.servletPath == "/view/informations.jsp" || pageContext.request.servletPath == "/view/competences.jsp" || pageContext.request.servletPath == "/view/infos_experience.jsp" || pageContext.request.servletPath == "/view/infos_job.jsp" ? 'active' : '' }">Mes informations</a>
    </div>
    <div data-aos="fade-down" data-aos-delay="100">
        <a href="${pageContext.request.contextPath}/templates" class="w-full ${pageContext.request.servletPath == "/view/template.jsp" ? 'active' : '' }">Mes CV</a>
    </div>
    <div data-aos="fade-down" data-aos-delay="200">
        <a href="${pageContext.request.contextPath}/marketplace" class="w-full ${pageContext.request.servletPath == "/view/marketplace.jsp" ? 'active' : '' }">Boutique</a>
    </div>
    <div data-aos="fade-down" data-aos-delay="300">
        <a href="${pageContext.request.contextPath}/logout">Deconnexion</a>
    </div>
</header>
<div id="body">
    <jsp:doBody/>
</div>
<footer>
</footer>
</body>
<script>
    AOS.init();
</script>
</html>

