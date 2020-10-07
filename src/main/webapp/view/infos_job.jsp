<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:infos>
    <jsp:body>
        <div class="px-4 py-4 lg:p-12">
            <h1 class="text-xl text-blue-500">Expériences</h1>
            <hr class="border-b-4 border-blue-500 mt-2" />
            <div id="list">
                <div class="mt-8 border-gray-600 border p-4 space-y-2 overflow-y-auto overflow-x-hidden" style="height: 14rem; max-height: 14rem;">
                    <c:forEach items="${jobs}" var="job">
                        <div id="exp-${job.getId()}" class="item cursor-pointer text-sm">
                            <div class="flex space-x-2">
                                <p class="start">${job.getStart()}</p>
                                <c:if test="${job.getEnd() != null}">
                                    <p> - </p>
                                    <p class="end">${job.getEnd()}</p>
                                </c:if>
                                <p class="job">${job.getJob()}</p>
                            </div>
                            <div class="flex space-x-2">
                                <p class="company">${job.getCompany()}</p>
                                <p class="city">${job.getCity()}</p>
                            </div>
                            <p class="hidden description">${job.getDescription()}</p>
                        </div>
                    </c:forEach>
                </div>
                <div class="flex w-full justify-end mt-2 space-x-2">
                    <div id="edit" class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">+</div>
                    <div id="add" class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">+</div>
                    <div id="remove" class="w-8 h-8 border border-gray-600 flex items-center justify-center cursor-pointer">-</div>
                </div>
                <div class="lg:flex lg:justify-end">
                    <div class="flex justify-center mt-10 space-x-4 lg:w-full">
                        <a href="${pageContext.request.contextPath}/informations">
                            <div class="flex justify-center mb-2">
                                <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                            </div>
                            <p class="hidden lg:block">Informations<br/>personnelles</p>
                        </a>
                        <a href="${pageContext.request.contextPath}/experience">
                            <div class="flex justify-center mb-2">
                                <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                            </div>
                            <p class="hidden lg:block">Études</p>
                        </a>
                        <div>
                            <div class="flex justify-center mb-2">
                                <div class="h-5 w-5 rounded-full bg-blue-400 border border-blue-400"></div>
                            </div>
                            <p class="font-semibold hidden lg:block">Expériences</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/competences">
                            <div class="flex justify-center mb-2">
                                <div class="h-5 w-5 rounded-full border border-blue-400"></div>
                            </div>
                            <p class="hidden lg:block">Compétences</p>
                        </a>
                    </div>
                    <div>
                        <div class="flex justify-center mt-10">
                            <a href="${pageContext.request.contextPath}/competences" class="bg-blue-400 text-sm px-8 py-2 text-white rounded-lg font-semibold">Suivant</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="create" class="hidden">
                <form method="post">

                    <input type="hidden" id="update" name="update" value="false">

                    <div class="mt-5">
                        <label for="job" class="text-xl text-blue-500">Intitulé :</label>
                        <input class="w-full py-1 px-2 border border-gray-600 mt-3" type="text" id="job" name="job" required/>
                    </div>

                    <div class="mt-5">
                        <label class="text-xl text-blue-500">Période :</label>
                        <div class="w-full lg:flex justify-center space-y-2 lg:space-y-0 lg:space-x-6 mt-2">
                            <div class="w-full lg:w-1/3">
                                <p class="text-center text-blue-500">Début</p>
                                <input class="w-full border text-blue-500 border-gray-600 py-1 px-2 text-center" type="date" id="start" name="start" required/>
                            </div>
                            <div class="w-full lg:w-1/3">
                                <p class="text-center text-blue-500">Fin (optionnel)</p>
                                <input class="w-full border text-blue-500 border-gray-600 py-1 px-2 text-center" type="date" id="end" name="end"/>
                            </div>
                        </div>
                    </div>

                    <div class="mt-5">
                        <label for="company" class="text-xl text-blue-500">Entreprise :</label>
                        <input class="w-full py-1 px-2 border border-gray-600 mt-3" type="text" id="company" name="company" required/>
                    </div>

                    <div class="mt-5">
                        <label for="city" class="text-xl text-blue-500">Lieu :</label>
                        <input class="w-full py-1 px-2 border border-gray-600 mt-3" type="text" id="city" name="city" required/>
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
        </div>
        <script>
            $(() => {
                let $list = $('#list');
                let $createForm = $("#create")
                let $items = $(".item");

                let $buttonAdd = $("#add");
                let $buttonEdit = $("#edit");
                let $buttonRemove = $("#remove");

                $buttonEdit.click(function() {
                    if ($(".item.active").length <= 0) {
                        alert("Veuillez choisir un élement !");
                    } else {
                        let job = $(".item.active p.job").text();
                        let start = $(".item.active p.start").text();
                        let end = $(".item.active p.end").text();
                        let company = $(".item.active p.company").text();
                        let city = $(".item.active p.city").text();
                        let description = $(".item.active p.description").text();

                        let $inputs = $("form input");

                        $inputs.eq(0).val($(".item.active").attr('id').split('-')[1]);
                        $inputs.eq(1).val(job);
                        $inputs.eq(2).val(start);
                        if (end.length > 0)
                            $inputs.eq(3).val(end);
                        $inputs.eq(4).val(company);
                        $inputs.eq(5).val(city);
                        if (description > 0)
                            $("form textarea").val(description);

                        $buttonAdd.click();
                    }
                });

                $buttonRemove.click(function() {
                   if ($(".item.active").length <= 0) {
                       alert("Veuillez choisir un élement !");
                   } else {
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
                    $createForm.removeClass("hidden");
                });
            });
        </script>
    </jsp:body>
</p:infos>
