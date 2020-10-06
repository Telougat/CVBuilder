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
            <h1 class="text-xl text-blue-500">Informations personnels</h1>
            <hr class="border-b-4 border-blue-500 mt-2" />
            <div class="mt-4 ml-4">

                <div class="w-full flex flex-wrap">
                    <div class="w-1/2">
                        <div class="w-full text-blue-400 font-semibold">Nom :</div>
                        <input type="text" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                    </div>
                    <div class="w-1/2">
                        <div class="w-full text-blue-400 font-semibold">Prénom :</div>
                        <input type="text" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                    </div>
                </div>
                <div class="mt-4 text-blue-400 font-semibold">E-mail :</div>
                <input type="text" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-5/6 rounded-md"/>
                <div class="mt-4 italic text-blue-400 font-semibold">Adresse (facultatif):</div>
                <input type="text" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-5/6 rounded-md"/>
                <div class="w-full flex flex-wrap mt-4">
                    <div class="w-1/2">
                        <div class="w-full italic text-blue-400 font-semibold">Téléphone (facultatif):</div>
                        <input type="text" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                    </div>
                    <div class="w-1/2">
                        <div class="w-full italic text-blue-400 font-semibold">Date de naissance (facultatif):</div>
                        <input type="date" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
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
                <a href="#" class="bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold">Suivant</a>
            </div>
        </div>

    </jsp:body>
</p:infos>