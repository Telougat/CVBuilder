<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:infos>
    <jsp:body>
        <div class="px-4 py-4 lg:p-12">
            <h1 class="text-xl text-blue-500">Compétences</h1>
            <hr class="border-b-4 border-blue-500 mt-2" />
            <div id="list" class="flex mt-4">
                <table class="w-full">
                    <tr class="thBold text-justify justify-between text-lg border-solid border-b border-gray-500">
                        <th class="font-medium border-solid border-l border-gray-500 pl-4 pt-2 pb-3">Nom</th>
                        <th class="font-medium border-solid border-l border-gray-500 pl-4 pt-2 pb-3">Niveau</th>
                        <th class="font-medium border-solid border-l border-gray-500 pl-4 pt-2 pb-3">Description</th>
                    </tr>
                    <c:forEach items="${skills}" var="skill">
                    <tr id="skill-${skill.getId()}" class="item border-solid border-l border-r border-b border-gray-500">
                        <td class="skill pt-3 pb-3 pr-3 pl-4">${skill.getSkill()}</td>
                        <td class="pt-3 pb-3 pr-3 pl-4">
                            <section class="w-full">
                                <progress value="${skill.getLevel()}" max="10">${skill.getSkill()}</progress>
                            </section>
                        </td>
                        <td class="description pt-3 pb-3 pr-3 pl-4">${skill.getDescription()}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>

            <div id="buttonEdit" class="flex w-full justify-end mt-2 space-x-2">
                <div id="edit" class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">+</div>
                <div id="add" class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">+</div>
                <div id="remove" class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">-</div>
            </div>

            <div id="create" class="hidden">
                <form method="post" accept-charset="utf-8">

                    <input type="hidden" id="update" name="update" value="false">

                    <div class="mt-5">
                        <label for="skill" class="text-xl text-blue-500">Titre :</label>
                        <input class="w-full py-1 px-2 border border-gray-600 mt-3" type="text" id="skill" name="skill" required/>
                    </div>

                    <div class="mt-5">
                        <label for="level" class="text-xl text-blue-500">Niveau sur 10 (optionnel):</label>
                        <input class="w-1/12 py-1 px-2 border border-gray-600 mt-3" type="text" id="level" name="level"/>
                    </div>

                    <div class="mt-5">
                        <label for="description" class="text-xl text-blue-500">Description (optionnel):</label>
                        <textarea class="w-full py-1 px-2 border border-gray-600 mt-3 h-20 resize-none" type="text" id="description" name="description"></textarea>
                    </div>
                    <div class="flex w-full justify-end mt-3">
                        <input class="bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold cursor-pointer" type="submit" value="Enregistrer"/>
                    </div>
                </form>
            </div>

            <div class="flex justify-center mt-16 space-x-4">
                <a href="${pageContext.request.contextPath}/informations">
                    <div class="flex justify-center mb-2">
                        <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                    </div>
                    <p>Informations<br/>personnelles</p>
                </a>
                <a href="${pageContext.request.contextPath}/experience">
                    <div class="flex justify-center mb-2">
                        <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                    </div>
                    <p>Études</p>
                </a>
                <a href="${pageContext.request.contextPath}/job">
                    <div class="flex justify-center mb-2">
                        <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                    </div>
                    <p>Expériences</p>
                </a>
                <div>
                    <div class="flex justify-center mb-2">
                        <div class="h-5 w-5 rounded-full bg-blue-400 border border-blue-400"></div>
                    </div>
                    <p class="font-semibold">Compétences</p>
                </div>
            </div>
            <div class="flex justify-center mt-10">
                <a href="${pageContext.request.contextPath}/" class="bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold">Terminer</a>
            </div>
        </div>

        <script>
            $(() => {
                let $list = $('#list');
                let $buttonsEdit = $('#buttonEdit');
                let $createForm = $("#create")
                let $items = $(".item");

                let $buttonAdd = $("#add");
                let $buttonEdit = $("#edit");
                let $buttonRemove = $("#remove");

                $buttonEdit.click(function() {
                    if ($(".item.active").length <= 0) {
                        alert("Veuillez choisir un élement !");
                    } else {
                        let skill = $(".item.active td.skill").text();
                        let level = $(".item.active progress").val();
                        let description = $(".item.active td.description").text();

                        let $inputs = $("form input");

                        $inputs.eq(0).val($(".item.active").attr('id').split('-')[1]);
                        $inputs.eq(1).val(skill);
                        $inputs.eq(2).val(level);
                        $("form textarea").text(description);

                        $buttonAdd.click();
                    }
                });

                $buttonRemove.click(function() {
                    if ($(".item.active").length <= 0) {
                        alert("Veuillez choisir un élement !");
                    } else {
                        let formData = new FormData();
                        let $id = $(".item.active").attr('id').split('-')[1];
                        formData.append("id", $id);
                        console.log($id);
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
                    }
                });

                $items.click(function() {
                    if ($(this).hasClass("active")) {
                        $(this).removeClass("active");
                    } else {
                        $items.removeClass("active");
                        $(this).addClass("active");
                    }
                });

                $buttonAdd.on("click", () => {
                    $list.addClass("hidden");
                    $buttonsEdit.addClass("hidden");
                    $createForm.removeClass("hidden");
                });
            });
        </script>

    </jsp:body>
</p:infos>