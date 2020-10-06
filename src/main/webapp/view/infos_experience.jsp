<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:infos>
    <jsp:body>
        <div class="px-4 py-4 lg:p-12">
            <h1 class="text-xl text-blue-500">Études</h1>
            <hr class="border-b-4 border-blue-500 mt-2" />
            <div class="mt-8 border-gray-600 border h-40">

            </div>
            <div class="flex w-full justify-end mt-2 space-x-2">
                <div class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">+</div>
                <div class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">+</div>
                <div class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">+</div>
            </div>
            <div class="flex justify-center mt-16 space-x-4">
                <div>
                    <div class="flex justify-center mb-2">
                        <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                    </div>
                    <p>Etudes</p>
                </div>
                <div>
                    <div class="flex justify-center mb-2">
                        <div class="h-5 w-5 rounded-full bg-blue-400 border border-blue-400"></div>
                    </div>
                    <p>Etudes</p>
                </div>
                <div>
                    <div class="flex justify-center mb-2">
                        <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                    </div>
                    <p>Etudes</p>
                </div>
            </div>
            <div class="flex justify-center mt-10">
                <a href="#" class="bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold">Suivant</a>
            </div>
        </div>
    </jsp:body>
</p:infos>
