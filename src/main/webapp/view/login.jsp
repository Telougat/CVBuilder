<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:page>
    <jsp:body>
        <div class="w-screen h-screen flex">
            <div class="w-1/2 h-full relative" style="background-color: #399ECC">
                <div class="flex w-full h-full items-center justify-center">
                    <div class="flex items-center">
                        <img class="w-48 mr-6" src="${pageContext.request.contextPath}/resources/images/cv.svg" alt="CV">
                        <div class="leading-none text-white">
                            <h1 style="font-size: 6rem;" class="font-bold">CVBuilder</h1>
                            <h2 class="text-4xl text-center">Créez vos CV facilement !</h2>
                        </div>
                    </div>
                </div>
                <div class="absolute h-full w-4 right-0 top-0 transform translate-x-1/2" style="background-color: #132f3b;"></div>
            </div>
            <div class="w-1/2 h-full flex items-center justify-center" style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_cv.png');">
                <div class="w-3/4 bg-white px-20 pt-12 pb-16" style="background-color: rgba(247, 247, 247, 0.94);">
                    <form method="post" class="space-y-8" style="color: #399ECC;">
                        <div>
                            <label class="text-2xl font-semibold mb-1" for="email">E-mail :</label>
                            <input class="px-2 py-3 border-2 rounded-lg w-full text-gray-700 bg-white" type="email" id="email" name="email" style="border-color: #399ECC;"/>
                        </div>
                        <div>
                            <label class="text-2xl font-semibold mb-1" for="password">Mot de passe :</label>
                            <input class="px-2 py-3 border-2 rounded-lg w-full bg-white" type="password" id="password" name="password" style="border-color: #399ECC;">
                        </div>
                        <div class="w-full grid grid-cols-2 grid-rows-1 gap-x-10">
                            <input class="py-3 rounded-lg text-sm cursor-pointer text-white w-full font-semibold" type="submit" value="Se connecter" style="background-color: #399ECC;"/>
                            <a href="${pageContext.request.contextPath}/register">
                                <p style="border-color: #399ECC; color: #399ECC;" class="py-4 rounded-lg border-2 text-sm bg-white text-center font-semibold w-full">Créer un compte</p>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</p:page>