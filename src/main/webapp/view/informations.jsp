<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 05/10/2020
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:infos>
    <jsp:body>
        <div class="px-4 py-4 lg:p-12">
            <form method="post">
                <h1 class="text-xl text-blue-500">Informations personnelles</h1>
                <hr class="border-b-4 border-blue-500 mt-2" />
                <div class="mt-4 ml-4">
                    <div class="w-full flex flex-wrap">
                        <div class="w-1/2">
                            <div class="w-full text-blue-400 font-semibold"  for="last_name">Nom :</div>
                            <input id="last_name" name="last_name" type="text" value="${nom}" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                        </div>
                        <div class="w-1/2">
                            <div class="w-full text-blue-400 font-semibold" for="first_name">Prénom :</div>
                            <input id="first_name" name="first_name" type="text" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                        </div>
                    </div>
                    <div class="mt-4 text-blue-400 font-semibold" for="email">E-mail :</div>
                    <input id="email" name="email" type="text" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-5/6 rounded-md"/>
                    <div class="mt-4 italic text-blue-400 font-semibold" for="address">Adresse (facultatif):</div>
                    <input id="address" name="address" type="text" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-5/6 rounded-md"/>
                    <div class="w-full flex flex-wrap mt-4">
                        <div class="w-1/2">
                            <div class="w-full italic text-blue-400 font-semibold" for="phone">Téléphone (facultatif):</div>
                            <input type="text" id="phone" name="phone" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                        </div>
                        <div class="w-1/2">
                            <div class="w-full italic text-blue-400 font-semibold" for="birth">Date de naissance (facultatif):</div>
                            <input type="date" id="birth" name="birth" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                        </div>
                    </div>

                </div>
                <div class="flex justify-center mt-16 space-x-4">
                    <div>
                        <div class="flex justify-center mb-2">
                            <div class="h-5 w-5 rounded-full bg-blue-400 border border-blue-400"></div>
                        </div>
                        <p class="font-semibold">Informations<br/>personnelles</p>
                    </div>
                    <div>
                        <div class="flex justify-center mb-2">
                            <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                        </div>
                        <p>Études</p>
                    </div>
                    <div>
                        <div class="flex justify-center mb-2">
                            <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                        </div>
                        <p>Expériences</p>
                    </div>
                    <div>
                        <div class="flex justify-center mb-2">
                            <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                        </div>
                        <p>Compétences</p>
                    </div>
                </div>
                <div class="flex justify-center mt-10">
                    <input type='submit' name="submit" value="Suivant" href="${pageContext.request.contextPath}/job" class="bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold"/>
                </div>
            </form>
        </div>

    </jsp:body>
</p:infos>