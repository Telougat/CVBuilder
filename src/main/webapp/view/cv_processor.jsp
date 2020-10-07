<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:cv>
    <jsp:body>
        <div id="data-to-process" class="hidden">
            <div class="skills">
                <c:forEach items="${skills}" var="skill">
                    <div class="skill">
                        <p class="name">${skill.getSkill()}</p>
                        <p class="level">${skill.getLevel()}</p>
                        <p class="description">${skill.getDescription}</p>
                    </div>
                </c:forEach>
            </div>
            <div class="jobs">
                <c:forEach items="${jobs}" var="job">
                    <div class="job">
                        <p class="name">${job.getJob()}</p>
                        <p class="company">${job.getCompany()}</p>
                        <p class="city">${job.getCity()}</p>
                        <p class="start">${job.getStart()}</p>
                        <p class="end">${job.getEnd()}</p>
                        <p class="description">${job.getDescription()}</p>
                    </div>
                </c:forEach>
            </div>
            <div class="experiences">
                <c:forEach items="${experiences}" var="experience">
                    <div class="experience">
                        <p class="name">${experience.getExperience()}</p>
                        <p class="organization">${experience.getOrganization()}</p>
                        <p class="city">${experience.getCity()}</p>
                        <p class="start">${experience.getStart()}</p>
                        <p class="end">${experience.getEnd()}</p>
                        <p class="description">${experience.getDescription()}</p>
                    </div>
                </c:forEach>
            </div>
            <div class="user">
                <p class="lastname">${user.getLast_name()}</p>
                <p class="firstname">${user.getFirst_name()}</p>
                <p class="email">${user.getEmail()}</p>
                <p class="birth">${user.getBirth()}</p>
                <p class="address">${user.getAddress()}</p>
                <p class="phone">${user.getPhone()}</p>
            </div>
        </div>
        <c:out value="${code}" escapeXml="false"/>
        <script>
            $(function () {

                let $dataToProcess = $("#data-to-process");
                let $Gskills = $dataToProcess.find(".skills").children();
                let $Gjobs = $dataToProcess.find(".jobs").children();
                let $Gexperiences = $dataToProcess.find(".experiences").children();
                let $Guser = $dataToProcess.find(".user");


                function processExperiences() {
                    let $experiences = $("experiences");
                    let $experience = $("experience");
                    let $clone = $experience.clone();
                    $experience.remove();
                    $Gexperiences.each(function() {
                        let clone = $clone.clone();
                        clone.appendTo($experiences);
                        initField(clone, $(this), "name", "p");
                        initField(clone, $(this), "organization", "p");
                        initField(clone, $(this), "city", "p");
                        initField(clone, $(this), "start", "p");
                        initField(clone, $(this), "end", "p");
                        initField(clone, $(this), "description", "p");
                        replaceTag(clone, "div");
                    });
                    replaceTag($experiences, "div");
                }

                function processJobs() {
                    let $jobs = $("jobs");
                    let $job = $("job");
                    let $clone = $job.clone();
                    $job.remove();
                    $Gjobs.each(function() {
                        let clone = $clone.clone();
                        clone.appendTo($jobs);
                        initField(clone, $(this), "name", "p");
                        initField(clone, $(this), "company", "p");
                        initField(clone, $(this), "city", "p");
                        initField(clone, $(this), "start", "p");
                        initField(clone, $(this), "end", "p");
                        initField(clone, $(this), "description", "p");
                        replaceTag(clone, "div");
                    });
                    replaceTag($jobs, "div");
                }

                function processSkills() {
                    let $skills = $("skills");
                    let $skill = $("skill");
                    let $clone = $skill.clone();
                    $skill.remove();
                    $Gskills.each(function() {
                       let clone = $clone.clone();
                       clone.appendTo($skills);
                       initField(clone, $(this), "name", "p");
                       initField(clone, $(this), "level", "p");
                       initField(clone, $(this), "description", "p");
                       replaceTag(clone, "div");
                    });
                }

                function processUserData() {
                    let $profile = $("profile");
                    initField($profile, $Guser, "firstname", "p");
                    initField($profile, $Guser, "lastname", "p");
                    initField($profile, $Guser, "email", "p");
                    initField($profile, $Guser, "birth", "p");
                    initField($profile, $Guser, "address", "p");
                    initField($profile, $Guser, "phone", "p");
                    replaceTag($profile, "div");
                }

                processUserData();
                processExperiences();
                processJobs();
                processSkills();
            });

            function initField($to, $from, tag, tagToReplace) {
                $to.find(tag).html($from.find("." + tag).html());
                replaceTag($to.find(tag), tagToReplace);
            }

            function replaceTag($element, tag, classes) {
                let $classes = $element.attr("class");
                let $html = $element.html();
                let $newElement;
                if (typeof $classes != "undefined" && typeof classes != "undefined")
                    $newElement = $element.replaceWith("<" + tag + " class='" + $classes + " " + classes + "'>" + $html + "</" + tag + ">");
                else if(typeof classes != "undefined")
                    $newElement = $element.replaceWith("<" + tag + " class='" + classes + "'>" + $html + "</" + tag + ">");
                else if (typeof $classes != "undefined")
                    $newElement = $element.replaceWith("<" + tag + " class='" + $classes + "'>" + $html + "</" + tag + ">");
                else
                    $newElement = $element.replaceWith("<" + tag + ">" + $html + "</" + tag + ">");
                return $newElement;
            }
        </script>
    </jsp:body>
</p:cv>
