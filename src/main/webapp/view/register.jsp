<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:page>
    <jsp:body>
        <form method="post" class="px-20">
            <input type="text" name="last_name" placeholder="Nom"/>
            <input type="text" name="first_name" placeholder="Prénom"/>
            <input type="email" name="email" placeholder="E-mail"/>
            <input type="password" name="password" placeholder="Mot de passe">
            <input type="submit" value="S'inscrire"/>
        </form>
    </jsp:body>
</p:page>