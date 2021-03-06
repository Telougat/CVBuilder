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
                            <input id="last_name" name="last_name" type="text" value="${last_name}" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                        </div>
                        <div class="w-1/2">
                            <div class="w-full text-blue-400 font-semibold" for="first_name">Prénom :</div>
                            <input id="first_name" name="first_name" type="text" value="${first_name}" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                        </div>
                    </div>
                    <div class="mt-4 text-blue-400 font-semibold" for="email">E-mail :</div>
                    <input id="email" name="email" type="text" value="${email}" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-5/6 rounded-md"/>
                    <div class="mt-4 italic text-blue-400 font-semibold" for="address">Adresse (facultatif):</div>
                    <input id="address" name="address" type="text" value="${address}" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-5/6 rounded-md"/>
                    <div class="w-full flex flex-wrap mt-4">
                        <div class="w-1/2">
                            <div class="w-full italic text-blue-400 font-semibold" for="phone">Téléphone (facultatif):</div>
                            <input type="text" id="phone" name="phone" value="${phone}" maxlength="10" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                        </div>
                        <div class="w-1/2">
                            <div class="w-full italic text-blue-400 font-semibold" for="birth">Date de naissance (facultatif):</div>
                            <input type="date" id="birth" name="birth" value="${birth}" class="border-solid border-2 border-blue-300 hover:border-blue-100 focus:border-blue-100 mt-4 w-2/3 rounded-md"/>
                        </div>
                    </div>

                </div>
                <div class="flex justify-center mt-10 space-x-4 lg:w-full">
                    <div>
                        <div class="flex justify-center mb-2">
                            <div class="h-5 w-5 rounded-full border border-blue-400 bg-blue-400"></div>
                        </div>
                        <p class="font-semibold hidden lg:block">Informations<br/>personnelles</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/experience">
                        <div class="flex justify-center mb-2">
                            <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                        </div>
                        <p class="hidden lg:block">Études</p>
                    </a>
                    <a href="${pageContext.request.contextPath}/job">
                        <div class="flex justify-center mb-2">
                            <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                        </div>
                        <p class="hidden lg:block">Expériences</p>
                    </a>
                    <a href="${pageContext.request.contextPath}/competences">
                        <div class="flex justify-center mb-2">
                            <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                        </div>
                        <p class="hidden lg:block">Compétences</p>
                    </a>
                </div>
                <div class="flex justify-center mt-10">
                    <input type='submit' name="submit" value="Suivant" href="${pageContext.request.contextPath}/job" class="cursor-pointer bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold"/>
                </div>
            </form>
        </div>

        <script>
            function setInputFilter(textbox, inputFilter) {
                ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function(event) {
                    textbox.addEventListener(event, function() {
                        if (inputFilter(this.value)) {
                            this.oldValue = this.value;
                            this.oldSelectionStart = this.selectionStart;
                            this.oldSelectionEnd = this.selectionEnd;
                        } else if (this.hasOwnProperty("oldValue")) {
                            this.value = this.oldValue;
                            this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
                        } else {
                            this.value = "";
                        }
                    });
                });
            }

            setInputFilter(document.getElementById("phone"), function(value) {
                return /^\d*\.?\d*$/.test(value); // Allow digits and '.' only, using a RegExp
            });
        </script>
    </jsp:body>
</p:infos>