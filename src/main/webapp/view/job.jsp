<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:page>
    <jsp:body>
        <form method="post" class="px-20">
            <input type="text" name="job" placeholder="Titre de l'emploi" required/>
            <input type="text" name="company" placeholder="Entreprise" required/>
            <input type="text" name="city" placeholder="Ville" required/>
            <input type="date" name="start" placeholder="Début" required/>
            <input type="date" name="end" placeholder="Fin"/>
            <textarea name="description" placeholder="Description"></textarea>
            <input type="submit" value="Enregistrer"/>
        </form>
    </jsp:body>
</p:page>