<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:page>
    <jsp:body>
        <div class="w-screen lg:h-screen lg:flex">
            <div class="w-full relative order-2 lg:h-full lg:w-1/2" style="background-color: #399ECC">
                <div class="flex w-full items-center justify-center lg:h-full">
                    <div class="lg:flex lg:items-center">
                        <img class="w-48 mr-6" src="${pageContext.request.contextPath}/resources/images/cv.svg" alt="CV">
                        <div class="leading-none text-white">
                            <h1 class="text-4xl font-bold lg:text-6xl">CVBuilder</h1>
                            <h2 class="text-2xl text-center lg:text-4xl">Créez vos CV facilement !</h2>
                        </div>
                    </div>
                </div>
                <div class="absolute w-full h-4 bottom-0 left-0 lg:h-full lg:w-4 lg:top-0 lg:transform lg:-translate-x-1/2" style="background-color: #132f3b;"></div>
            </div>
            <div class="w-full h-full flex items-center justify-center order-1 lg:w-1/2" style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_cv.png');">
                <div class="w-full mx-4 bg-white px-4 py-10 lg:mx-0 lg:w-3/4 lg:px-20 lg:pt-12 lg:pb-16" style="background-color: rgba(247, 247, 247, 0.94);">
                    <form method="post" class="space-y-4" style="color: #399ECC;">
                        <div>
                            <label class="text-2xl font-semibold mb-1" for="last_name">Nom :</label>
                            <input class="px-2 py-3 border-2 rounded-lg w-full text-gray-700 bg-white" type="text" id="last_name" name="last_name" style="border-color: #399ECC;"/>
                        </div>
                        <div>
                            <label class="text-2xl font-semibold mb-1" for="first_name">Prénom :</label>
                            <input class="px-2 py-3 border-2 rounded-lg w-full bg-white" type="text" id="first_name" name="first_name" style="border-color: #399ECC;">
                        </div>
                        <div>
                            <label class="text-2xl font-semibold mb-1" for="email">E-mail :</label>
                            <input class="px-2 py-3 border-2 rounded-lg w-full bg-white" type="email" id="email" name="email" style="border-color: #399ECC;">
                        </div>
                        <div>
                            <label class="text-2xl font-semibold mb-1" for="password">Mot de passe :</label>
                            <input class="px-2 py-3 border-2 rounded-lg w-full bg-white" type="password" id="password" name="password" style="border-color: #399ECC;">
                        </div>
                        <div class="flex justify-center">
                            <input class="py-3 rounded-lg text-sm cursor-pointer text-white w-1/2 font-semibold" type="submit" value="Créer un compte" style="background-color: #399ECC;"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</p:page>