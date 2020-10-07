<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:pageWithHeader>
    <jsp:body>
        <div class="w-full min-h-full bg-svg bg-blue-500 flex justify-center items-center py-12">
            <div class="p-4 bg-white h-full lg:w-1/2">
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
                        <div id="edit" class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">+</div>
                        <div id="add" class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">+</div>
                        <div id="remove" class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">-</div>
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
</p:pageWithHeader>