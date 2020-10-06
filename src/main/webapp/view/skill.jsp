<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:page>
    <jsp:body>
        <form method="post" class="px-20">
            <input type="text" name="skill" placeholder="Compétence" required/>
            <input type="number" name="level" placeholder="Niveau de compétence" />
            <textarea name="description" placeholder="Description"></textarea>
            <input type="submit" value="Enregistrer"/>
        </form>
    </jsp:body>
</p:page>