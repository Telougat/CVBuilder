<%@tag description="Background with blue opacity" pageEncoding="UTF-8" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/components" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<p:pageWithHeader>
    <jsp:body>
        <div class="w-full min-h-screen pb-12 relative">
            <component:bg_blue/>
            <div class="px-4 lg:px-0 lg:flex">
                <a href="${pageContext.request.contextPath}/" class="flex justify-center transform -translate-y-1/2 lg:translate-x-16 xl:translate-x-20">
                    <img class="w-32 lg:w-32 xl:w-40" src="${pageContext.request.contextPath}/resources/images/cv.svg" alt="CV">
                </a>
                <div class="w-full lg:w-1/2 lg:transform lg:translate-x-48 lg:-translate-y-12 xl:translate-x-56 xl:-translate-y-16">
                    <div class="w-full bg-white border border-gray-600" style="-webkit-box-shadow: 29px 27px 15px 0px rgba(0,0,0,0.16); -moz-box-shadow: 29px 27px 15px 0px rgba(0,0,0,0.16); box-shadow: 29px 27px 15px 0px rgba(0,0,0,0.16);">
                        <jsp:doBody/>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</p:pageWithHeader>