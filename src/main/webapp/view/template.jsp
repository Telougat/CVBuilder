<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:pageWithHeaderWithLogo>
    <jsp:body>
        <div class="w-full min-h-full bg-svg bg-blue-500 flex justify-center items-center py-12 px-4 lg:px-0">
            <div class="p-4 bg-white h-full w-full lg:w-1/2">
                <h1 class="text-xl text-blue-500">Template</h1>
                <hr class="border-b-4 border-blue-500 mt-2" />
                <div id="list" class="lg:w-full">
                    <div class="mt-8 border-gray-600 border overflow-y-auto overflow-x-hidden lg:w-full" style="height: 14rem; max-height: 14rem;">
                        <c:forEach items="${templates}" var="template">
                            <div id="template-${template.getId()}" class="item cursor-pointer text-sm py-2 px-4">
                                <p class="w-full font-semibold text-blue-500 label">${template.getLabel()}</p>
                                <div class="hidden code"><c:out value="${template.getCode()}"/></div>
                                <p class="hidden price">${template.getPrice()}</p>
                                <p class="hidden isPublic">${template.isPublic()}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="flex w-full justify-end mt-2 space-x-2">
                        <div id="edit" class="hover:bg-blue-500 duration-300 w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">
                            <svg class="text-blue-600 w-full h-full fill-current hover:text-white p-1 duration-300" viewBox="-15 -15 484.00019 484" xmlns="http://www.w3.org/2000/svg"><path d="m401.648438 18.234375c-24.394532-24.351563-63.898438-24.351563-88.292969 0l-22.101563 22.222656-235.269531 235.144531-.5.503907c-.121094.121093-.121094.25-.25.25-.25.375-.625.746093-.871094 1.121093 0 .125-.128906.125-.128906.25-.25.375-.371094.625-.625 1-.121094.125-.121094.246094-.246094.375-.125.375-.25.625-.378906 1 0 .121094-.121094.121094-.121094.25l-52.199219 156.96875c-1.53125 4.46875-.367187 9.417969 2.996094 12.734376 2.363282 2.332031 5.550782 3.636718 8.867188 3.625 1.355468-.023438 2.699218-.234376 3.996094-.625l156.847656-52.324219c.121094 0 .121094 0 .25-.121094.394531-.117187.773437-.285156 1.121094-.503906.097656-.011719.183593-.054688.253906-.121094.371094-.25.871094-.503906 1.246094-.753906.371093-.246094.75-.621094 1.125-.871094.125-.128906.246093-.128906.246093-.25.128907-.125.378907-.246094.503907-.5l257.371093-257.371094c24.351563-24.394531 24.351563-63.898437 0-88.289062zm-232.273438 353.148437-86.914062-86.910156 217.535156-217.535156 86.914062 86.910156zm-99.15625-63.808593 75.929688 75.925781-114.015626 37.960938zm347.664062-184.820313-13.238281 13.363282-86.917969-86.917969 13.367188-13.359375c14.621094-14.609375 38.320312-14.609375 52.945312 0l33.964844 33.964844c14.511719 14.6875 14.457032 38.332031-.121094 52.949218zm0 0"/></svg>
                        </div>
                        <div id="add" class="hover:bg-blue-500 duration-300 hover:text-white text-blue-600 text-3xl w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer"><p class="leading-none -mt-1">+</p></div>
                        <div id="remove" class="hover:bg-blue-500 duration-300 hover:text-white text-blue-600 text-3xl w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer"><p class="leading-none -mt-1">-</p></div>
                    </div>
                    <div id="generate" class="flex justify-end mt-10">
                        <p class="bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold cursor-pointer">Générer le CV</p>
                    </div>
                </div>
                <form id="create" method="post" class="hidden">

                    <input id="update" type="hidden" name="update" value="false">

                    <div class="mt-4">
                        <label for="label" class="text-xl text-blue-500">Titre :</label>
                        <input class="w-full py-1 px-2 border border-gray-600 mt-3" type="text" id="label" name="label" required/>
                    </div>

                    <div class="mt-4">
                        <label class="text-xl text-blue-500">Code :</label>
                        <textarea name="code" id="code" cols="50" rows="20" class="w-full border border-gray-600 mt-3 required"></textarea>
                    </div>

                    <div class="mt-4">
                        <label for="price" class="text-xl text-blue-500">Prix (Optionnel) :</label>
                        <input class="w-full py-1 px-2 border border-gray-600 mt-3" type="number" step="0.01" id="price" name="price"/>
                    </div>

                    <div class="mt-4">
                        <label for="isPublic" class="text-xl text-blue-500">Publique :</label>
                        <input class="py-1 px-2 border border-gray-600 ml-5 mt-1" type="checkbox" id="isPublic" name="isPublic"/>
                    </div>

                    <div class="flex justify-end mt-3">
                        <input class="bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold cursor-pointer" type="submit" value="Enregistrer"/>
                    </div>


                </form>
            </div>
        </div>
        <script>
            $(function() {
                let $list = $("#list");
                let $create = $("#create");
                let $items = $(".item");

                let $buttonAdd = $("#add");
                let $buttonEdit = $("#edit");
                let $buttonRemove = $("#remove");
                let $buttonGenerate = $("#generate");

                $buttonGenerate.click(function() {
                    if ($(".item.active").length <= 0) {
                        alert("Veuillez choisir un élement !");
                        return false;
                    }

                    let id = $(".item.active").attr('id').split('-')[1];
                    window.open('${pageContext.request.contextPath}/cvgeneration?id=' + id, '_blank');
                });

                $items.click(function() {
                    if ($(this).hasClass("active")) {
                        $(this).removeClass("active");
                    } else {
                        $items.removeClass("active");
                        $(this).addClass("active");
                    }
                });

                $buttonEdit.click(function() {
                    if ($(".item.active").length <= 0) {
                        alert("Veuillez choisir un élement !");
                        return false;
                    }

                    let $this = $(".item.active");

                    $create.find("#update").val($(".item.active").attr('id').split('-')[1]);
                    $create.find("#label").val($this.find(".label").text());
                    $create.find("#code").val($this.find(".code").text());
                    $create.find("#price").val($this.find(".price").text());
                    if ($this.find(".isPublic").text() === "true")
                        $create.find("#isPublic").attr("checked", "");

                    $buttonAdd.click();
                })

                $buttonRemove.click(function() {
                    if ($(".item.active").length <= 0) {
                        alert("Veuillez choisir un élement !");
                        return false;
                    }

                    let $id = $(".item.active").attr('id').split('-')[1];
                    axios({
                        method: 'delete',
                        url: window.location.href + '?id=' + $id,
                        withCredentials: true,
                    })
                        .then(function (response) {
                            document.location.reload();
                        })
                        .catch(function (err) {
                            alert("Un problème est survenue ...");
                        });
                })

                $buttonAdd.click(function() {
                    $list.addClass("hidden");
                    $create.removeClass("hidden");
                });

            })
        </script>
    </jsp:body>
</p:pageWithHeaderWithLogo>