<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Utilisateur--%>
<%--  Date: 05/10/2020--%>
<%--  Time: 10:55--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Boutique</title>--%>
<%--    <link rel="stylesheet" href=".\resources\css\style.css">--%>
<%--    <style>--%>
<%--        .shadowmax{--%>
<%--            -webkit-box-shadow: 21px 21px 5px 0px rgba(0,0,0,0.49);--%>
<%--            -moz-box-shadow: 21px 21px 5px 0px rgba(0,0,0,0.49);--%>
<%--            box-shadow: 21px 21px 5px 0px rgba(0,0,0,0.49);--%>
<%--        }--%>
<%--        input:checked + svg {--%>
<%--            display: block;--%>
<%--        }--%>
<%--        .content:hover+div{--%>
<%--            transition: 2s;--%>
<%--            opacity:100%;--%>
<%--        }--%>
<%--        .lookup:hover>div:first-child {--%>
<%--            transition: 1s;--%>
<%--            opacity: 0%;--%>
<%--        }--%>
<%--        .content+div{--%>
<%--            transition: 1s;--%>
<%--            opacity: 0%;--%>
<%--        }--%>
<%--        .lookup>div:first-child {--%>
<%--            transition: 2s;--%>
<%--            opacity: 100%;--%>
<%--        }--%>
<%--        .lookup:hover{--%>
<%--            transition: 2s;--%>
<%--            background-color: #2b6cb0;--%>
<%--        }--%>
<%--        .lookup{--%>
<%--            transition: 2s;--%>
<%--            background-color: white;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@tag description="Background with blue opacity" pageEncoding="UTF-8" %>--%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/components" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<p:pageHeaderWithoutPadding>
    <jsp:body>
        <style>
            .shadowmax{
                -webkit-box-shadow: 21px 21px 5px 0px rgba(0,0,0,0.49);
                -moz-box-shadow: 21px 21px 5px 0px rgba(0,0,0,0.49);
                box-shadow: 21px 21px 5px 0px rgba(0,0,0,0.49);
            }
            input:checked + svg {
                display: block;
            }
            .content:hover+div{
                transition: 2s;
                opacity:100%;
            }
            .lookup:hover>div:first-child {
                transition: 1s;
                opacity: 0%;
            }
            .content+div{
                transition: 1s;
                opacity: 0%;
            }
            .lookup>div:first-child {
                transition: 1s;
                opacity: 100%;
            }
            .lookup:hover{
                transition: 1s;
                background-color: #2b6cb0;
            }
            .lookup{
                transition: 1s;
                background-color: white;
            }
        </style>
<!--HEADER-->
<div class="flex flex-col md:flex-row w-full">
    <!--  Logout logo-->
<%--    <div class="p-2 md:hidden">--%>
<%--        <svg height="35" fill="#388CB2" version="1.1" id="" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 489.888 489.888" style="enable-background:new 0 0 489.888 489.888;" xml:space="preserve"><g><g><path d="M25.383,290.5c-7.2-77.5,25.9-147.7,80.8-192.3c21.4-17.4,53.4-2.5,53.4,25l0,0c0,10.1-4.8,19.4-12.6,25.7 c-38.9,31.7-62.3,81.7-56.6,136.9c7.4,71.9,65,130.1,136.8,138.1c93.7,10.5,173.3-62.9,173.3-154.5c0-48.6-22.5-92.1-57.6-120.6 c-7.8-6.3-12.5-15.6-12.5-25.6l0,0c0-27.2,31.5-42.6,52.7-25.6c50.2,40.5,82.4,102.4,82.4,171.8c0,126.9-107.8,229.2-236.7,219.9C122.183,481.8,35.283,396.9,25.383,290.5z M244.883,0c-18,0-32.5,14.6-32.5,32.5v149.7c0,18,14.6,32.5,32.5,32.5 s32.5-14.6,32.5-32.5V32.5C277.383,14.6,262.883,0,244.883,0z"/></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>--%>
<%--    </div>--%>
    <!--  CV logo-->
<%--    <div class="flex justify-center md:justify-start p-2">--%>
<%--        <svg height="100" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512.003 512.003" style="enable-background:new 0 0 512.003 512.003;" xml:space="preserve"><rect x="103.126" y="89.013" transform="matrix(-0.1071 0.9942 -0.9942 -0.1071 602.0192 -40.5702)" style="fill:#132F3B;" width="432.202" height="322.06"/><rect x="24.281" y="10.773" transform="matrix(-0.9975 0.0701 -0.0701 -0.9975 386.0391 440.1602)" style="fill:#388CB2;" width="322.03" height="432.162"/><polygon style="fill:#265D77;" points="255.732,438.527 361.1,431.118 330.783,0 255.732,5.278 "/><path style="fill:#B7E4F8;" d="M98.869,512h292.025V85.037H98.869V512z"/><rect x="255.732" y="85.037" style="fill:#6FC8F1;" width="135.164" height="426.966"/><g><rect x="146.987" y="299.878" style="fill:#265D77;" width="195.796" height="30.021"/><rect x="146.987" y="353.275" style="fill:#265D77;" width="195.796" height="30.021"/><rect x="146.987" y="406.672" style="fill:#265D77;" width="195.796" height="30.021"/></g><g><rect x="255.732" y="299.878" style="fill:#132F3B;" width="87.047" height="30.021"/><rect x="255.732" y="406.672" style="fill:#132F3B;" width="87.047" height="30.021"/><rect x="255.732" y="353.275" style="fill:#132F3B;" width="87.047" height="30.021"/></g><g><path style="fill:#265D77;" d="M143.957,213.427c0-29.044,22.289-49.442,52.684-49.442c18.508,0,33.097,6.755,42.418,18.912 l-20.128,17.966c-5.539-7.025-12.157-11.078-20.668-11.078c-13.238,0-22.154,9.186-22.154,23.64s8.916,23.64,22.154,23.64 c8.511,0,15.13-4.053,20.668-11.078l20.128,17.966c-9.321,12.157-23.911,18.912-42.418,18.912 C166.246,262.869,143.957,242.471,143.957,213.427z"/><path style="fill:#265D77;" d="M349.293,166.146l-39.986,94.562h-31.341l-39.987-94.562h34.312l22.56,55.251l23.101-55.251H349.293 z"/></g><polygon style="fill:#132F3B;" points="317.953,166.146 294.853,221.398 272.293,166.146 255.732,166.146 255.732,208.127 277.967,260.708 309.308,260.708 349.293,166.146 "/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g>--%>
<%--        </g></svg>--%>
<%--    </div>--%>

    <div class="md:pl-10 flex flex-col justify-center w-full p-1">
        <!--   Logout button-->
<%--        <nav class="flex md:flex justify-center hidden md:justify-end p-4">--%>
<%--            <a class="uppercase tracking-widest px-4 py-2 md:text-sm text- font-bold bg-transparent md:mt-0 md:ml-4 border border-4 border-solid border-blue-400 hover:bg-blue-400 hover:text-white text-blue-400" href="#">Déconnexion</a>--%>
<%--        </nav>--%>
        <!--   Page title-->
        <div class=" flex justify-center pb-3 md: pt-4 pt-2">
           <span class="md:w-4/12 border-solid border-b-4 flex justify-center border-blue-400 ">
               <h1 class="flex uppercase tracking-widest text-sm font-bold md:text-2xl text-2xl text-blue-400">BOUTIQUE</h1>
           </span>
        </div>
        <div class="flex md:flex-row flex-col flex-wrap justify-center">
            <!--   Search bar-->
            <form action="POST" class="inline"></form>
                <div class="md:w-3/12 flex flex-row border-2 my-2 pl-2 pr-2 py-1 border-blue-400 rounded-full  place-self-center md:place-self-stretch">
                    <div class="flex w-11/12"><input id="searchfield" type="search"  placeholder="Recherche..." autofocus="autofocus" class="text-gray-600"></div>
                    <div class="w-1/12 place-self-center"><svg fill="#399ECC" height="15" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"viewBox="0 0 512.005 512.005" style="enable-background:new 0 0 512.005 512.005;" xml:space="preserve"><g><g><path d="M505.749,475.587l-145.6-145.6c28.203-34.837,45.184-79.104,45.184-127.317c0-111.744-90.923-202.667-202.667-202.667S0,90.925,0,202.669s90.923,202.667,202.667,202.667c48.213,0,92.48-16.981,127.317-45.184l145.6,145.6c4.16,4.16,9.621,6.251,15.083,6.251s10.923-2.091,15.083-6.251C514.091,497.411,514.091,483.928,505.749,475.587zM202.667,362.669c-88.235,0-160-71.765-160-160s71.765-160,160-160s160,71.765,160,160S290.901,362.669,202.667,362.669z"/></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg></div>
                </div>
            </form>
            <!--    "Free" case to check-->
<%--            <label class="flex p-3 w-full md:w-3/12 justify-center  items-start">--%>
<%--                <div class="bg-white border-2 rounded border-blue-400 w-6 h-6 flex flex-shrink-0 justify-center items-center mr-2 focus-within:border-blue-500">--%>
<%--                    <input type="checkbox" class="opacity-0 absolute">--%>
<%--                    <svg fill="#388CB2" class="fill-current hidden w-4 h-4 text-blue-400 pointer-events-none" viewBox="0 0 20 20"><path d="M0 11l2-2 5 5L18 3l2 2L7 18z"/></svg>--%>
<%--                </div>--%>
<%--                <div class="select-none text-blue-400 font-bold">Gratuit</div>--%>
<%--            </label>--%>
        </div>
    </div>
</div>
<!--------------------------------------- CV CARD----------------------------------------------------->
<div class="flex w-full flex-wrap justify-center my-3">
    <!-- Loop on the template-->
    <c:forEach items="${templates}" var="templates">
        <div class="relative lookup flex flex-wrap w-10/12 md:w-1/12 shadowmax  border-2 border-blue-400 rounded md:m-4 m-2  py-5 px-3 justify-center">
            <div class="w-full content">
                <div class=" flex justify-center w-full py-2"><svg id="" fill="#388CB2" enable-background="new 0 0 512.353 512.353" height="50" viewBox="0 0 512.353 512.353" width="512" xmlns="http://www.w3.org/2000/svg"><g><g><path d="m293.237 53.048c-3.257-2.563-7.972-1.996-10.531 1.26l-21.376 27.186-10.99-12.547c-2.729-3.116-7.466-3.428-10.583-.7-3.116 2.729-3.43 7.468-.7 10.583l13.902 15.872c2.193 2.504 5.285 3.924 8.521 3.924.099 0 .197-.002.295-.004 3.355-.09 6.503-1.697 8.635-4.409l24.087-30.634c2.56-3.256 1.996-7.972-1.26-10.531z"/><path d="m449.269 51.443h-127.974c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h127.974c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5z"/><path d="m449.269 83.625h-127.974c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h127.974c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5z"/><path d="m293.237 143.576c-3.257-2.563-7.972-1.996-10.531 1.26l-21.376 27.187-10.99-12.547c-2.729-3.116-7.466-3.429-10.583-.7-3.116 2.729-3.43 7.468-.7 10.583l13.902 15.872c2.193 2.504 5.285 3.924 8.521 3.924.099 0 .197-.002.295-.004 3.355-.09 6.503-1.697 8.635-4.409l24.087-30.634c2.56-3.256 1.996-7.972-1.26-10.532z"/><path d="m449.269 141.972h-127.974c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h127.974c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5z"/><path d="m449.269 174.153h-127.974c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h127.974c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5z"/><path d="m293.237 234.104c-3.257-2.563-7.972-1.997-10.531 1.26l-21.376 27.186-10.99-12.546c-2.729-3.117-7.468-3.43-10.583-.7-3.116 2.729-3.43 7.468-.7 10.583l13.901 15.87c2.192 2.505 5.285 3.925 8.522 3.925.098 0 .195-.001.292-.004 3.355-.088 6.504-1.694 8.638-4.408l24.087-30.634c2.56-3.256 1.996-7.972-1.26-10.532z"/><path d="m449.269 232.5h-127.974c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h127.974c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5z"/><path d="m449.269 264.682h-127.974c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h127.974c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5z"/><path d="m293.237 324.633c-3.257-2.563-7.972-1.997-10.531 1.26l-21.376 27.186-10.99-12.546c-2.729-3.117-7.468-3.43-10.583-.7-3.116 2.729-3.43 7.468-.7 10.583l13.901 15.87c2.192 2.505 5.285 3.925 8.522 3.925.098 0 .195-.001.292-.004 3.355-.088 6.504-1.694 8.638-4.408l24.087-30.634c2.56-3.257 1.996-7.973-1.26-10.532z"/><path d="m449.269 323.028h-127.974c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h127.974c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5z"/><path d="m456.769 362.71c0-4.143-3.357-7.5-7.5-7.5h-127.974c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h127.974c4.143 0 7.5-3.357 7.5-7.5z"/><path d="m293.237 415.161c-3.257-2.563-7.972-1.997-10.531 1.26l-21.376 27.186-10.99-12.546c-2.729-3.117-7.468-3.431-10.583-.7-3.116 2.729-3.43 7.468-.7 10.583l13.901 15.87c2.192 2.505 5.285 3.925 8.522 3.925.098 0 .195-.001.292-.004 3.355-.088 6.504-1.694 8.638-4.408l24.087-30.634c2.56-3.256 1.996-7.972-1.26-10.532z"/><path d="m372.34 413.557h-51.045c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h51.045c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5z"/><path d="m372.34 445.738h-51.045c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h51.045c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5z"/><path d="m478.509 0h-45.333c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h45.333c1.379 0 2.5 1.121 2.5 2.5v409.091h-48.986c-13.479 0-24.446 10.966-24.446 24.445v46.146h-240.624c3.23-5.043 5.113-11.029 5.113-17.449v-125.895c3.919 2.029 8.375 3.183 13.103 3.183 15.322 0 27.788-12.466 27.788-27.789v-72.558c0-21.566-6.854-42.037-19.821-59.201-12.539-16.598-30.364-29.015-50.191-34.964-.885-.266-1.503-1.126-1.503-2.092v-5.769c24.772-10.897 42.12-35.661 42.12-64.414 0-29.286-17.994-54.439-43.503-65.009v-7.725c0-1.379 1.121-2.5 2.5-2.5h255.868c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5h-255.869c-9.649 0-17.5 7.851-17.5 17.5v3.409c-3.852-.656-7.804-1.016-11.84-1.016-38.787 0-70.343 31.556-70.343 70.343 0 29.848 18.695 55.396 44.983 65.595v4.587c0 .966-.618 1.826-1.503 2.092-10.454 3.138-20.261 7.977-29.147 14.384-3.36 2.423-4.12 7.11-1.698 10.471 2.423 3.36 7.11 4.118 10.471 1.697 7.529-5.429 15.835-9.528 24.685-12.185 7.18-2.152 12.193-8.921 12.193-16.459v-.608c3.382.501 6.84.769 10.359.769 4.521 0 8.937-.445 13.223-1.264v1.103c0 7.538 5.015 14.307 12.193 16.459 16.795 5.04 31.9 15.566 42.532 29.639 10.984 14.539 16.79 31.883 16.79 50.159v72.558c0 7.052-5.736 12.789-12.788 12.789-6.576 0-12.203-4.92-13.103-11.076v-83.726c0-4.143-3.357-7.5-7.5-7.5s-7.5 3.357-7.5 7.5v232.513c0 9.621-7.828 17.449-17.449 17.449s-17.449-7.828-17.449-17.449v-135.31c0-4.142-3.357-7.499-7.499-7.5-.001 0 0 0-.001 0-4.141 0-7.499 3.356-7.5 7.498l-.034 135.312c0 9.621-7.828 17.449-17.449 17.449s-17.449-7.828-17.449-17.449v-233.79c0-4.143-3.357-7.5-7.5-7.5s-7.5 3.357-7.5 7.5l-.059 82.62c0 7.169-6.096 13.458-13.044 13.458-7.052 0-12.789-5.737-12.789-12.789v-72.558c0-15.673 4.374-30.939 12.649-44.149 2.198-3.511 1.136-8.139-2.375-10.338-3.511-2.195-8.139-1.136-10.338 2.375-9.771 15.6-14.937 33.62-14.937 52.112v72.558c0 15.323 12.466 27.789 27.789 27.789 4.696 0 9.166-1.247 13.103-3.421v126.132c0 17.893 14.557 32.449 32.449 32.449 10.028 0 19.01-4.573 24.967-11.743 5.957 7.17 14.937 11.743 24.966 11.743h265.105c5.65 0 11.421 1.165 16.072-2.585 2.184-1.761 4.141-3.926 6.175-5.854 8.547-8.103 53.011-50.262 66.701-63.236 1.494-1.416 2.34-3.384 2.34-5.442v-417.564c0-9.649-7.85-17.5-17.5-17.5zm-365.291 145.579c-30.516 0-55.343-24.827-55.343-55.344 0-30.516 24.827-55.343 55.343-55.343s55.343 24.827 55.343 55.343c0 30.517-24.827 55.344-55.343 55.344zm309.359 341.489v-36.032c0-5.208 4.237-9.445 9.446-9.445h37.862z"/><path d="m126.022 118.652c-3.298-2.507-8.002-1.865-10.51 1.432-.156.206-.508.551-1.107.551-.601 0-.954-.349-1.111-.557-2.495-3.307-7.197-3.963-10.504-1.469-3.307 2.495-3.964 7.198-1.469 10.504 3.081 4.084 7.973 6.521 13.084 6.521 5.165 0 9.921-2.359 13.049-6.473 2.506-3.296 1.866-8.002-1.432-10.509z"/></g></g></svg></div>
                <div class=" flex justify-center text-center w-full tracking-widest text-xs font-bold text-blue-400"><c:out value="${templates.getLabel()}" /></div> <!-- CV name -->
                <div class=" flex justify-center w-full "><p class="font-semibold text-blue-300 text-xs"><c:out value="${templates.getPrice()}"/>$</p></div> <!-- price -->
            </div>
            <div class="absolute place-self-center opacity-0 hover:opacity-100">
                <div class="border border-solid border-2 border-white py-1 px-3 tracking-widest font-bold text-white">
                    <a href="${pageContext.request.contextPath}/templateview?id=${templates.getId()}">Voir</a>
                </div>
            </div>
        </div>
    </c:forEach>
    <!--endloop -->
</div>
</jsp:body>
</p:pageHeaderWithoutPadding>
<!--FOOTER-->
</html>
