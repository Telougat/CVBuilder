<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:infos>
    <jsp:body>
        <div class="px-4 py-4 lg:p-12">
            <h1 class="text-xl text-blue-500">Compétences</h1>
            <hr class="border-b-4 border-blue-500 mt-2" />
            <div class="flex mt-4">
                <table class="w-full">
                    <tr class="thBold text-justify justify-between text-lg border-solid border-b border-gray-500">
                        <th class="font-medium border-solid border-l border-gray-500 pl-4 pt-2 pb-3">Nom</th>
                        <th class="font-medium border-solid border-l border-gray-500 pl-4 pt-2 pb-3">Niveau</th>
                        <th class="font-medium border-solid border-l border-gray-500 pl-4 pt-2 pb-3">Description</th>
                    </tr>

                    <tr class="border-solid border-l border-r border-b border-gray-500">
                        <td class="pt-3 pb-3 pr-3 pl-4">JavaScript</td>
                        <td class="pt-3 pb-3 pr-3 pl-4">
                            <section class="w-full">
                                <progress value="8" max="10">Javascript</progress>
                            </section>
                        </td>
                        <td class="pt-3 pb-3 pr-3 pl-4">Langue JS natif</td>
                    </tr>
                    <tr class="border-solid border-l border-r border-b border-gray-500">
                        <td class="pt-3 pb-3 pr-3 pl-4">Cobble</td>
                        <td class="pt-3 pb-3 pr-3 pl-4">
                            <section class="w-full">
                                <progress value="2" max="10">Javascript</progress>
                            </section>
                        </td>
                        <td class="pt-3 pb-3 pr-3 pl-4">Langue bas niveau</td>
                    </tr>

                </table>
            </div>

            <div class="flex justify-center mt-16 space-x-4">
                <div>
                    <div class="flex justify-center mb-2">
                        <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                    </div>
                    <p>Informations<br/>personnelles</p>
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
                        <div class="h-5 w-5 rounded-full bg-blue-400 border border-blue-400"></div>
                    </div>
                    <p class="font-semibold">Compétences</p>
                </div>
            </div>
            <div class="flex justify-center mt-10">
                <a href="#" class="bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold">Suivant</a>
            </div>
        </div>

    </jsp:body>
</p:infos>