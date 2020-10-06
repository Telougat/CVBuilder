<%--
  Created by IntelliJ IDEA.
  User: juret
  Date: 05/10/2020
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p:page>
    <jsp:body>
        <div class="relative">
            <div class="flex flex-wrap justify-between items-center p-12 border-solid border-b-8 border-blue-600 lg:hidden">
                <a href="#" class="flex flex-wrap w-1/6 lg:w-1/12">
                    <img class="w-full" src="${pageContext.request.contextPath}/resources/images/cv.svg" alt="CV">
                </a>
                <div class="flex h-full">
                    <a href="${pageContext.request.contextPath}/logout" class="pl-4 pr-5 pt-2 pb-2 border-solid border-4 border-blue-400 text-blue-400 text-3xl lg:text-xl">Déconnexion</a>
                </div>
            </div>
            <div class="flex flex-wrap h-full relative">
                <div class="hidden lg:block absolute top-0 right-0 pt-8">
                    <a href="${pageContext.request.contextPath}/logout" class="pl-4 pr-5 pt-2 pb-2 border-solid border-4 border-blue-200 hover:bg-white hover:text-blue-200 hover:border-blue-200 hover:shadow-lg text-blue-200 text-md mt-4 mr-4">Déconnexion</a>
                </div>


                <a href="${pageContext.request.contextPath}/informations" class="animHome cursor-pointer flex flex-wrap w-full lg:w-1/2 bg-blue-300 text-6xl lg:text-3xl p-16 font-semibold text-center">
                    <div class="w-full">
                        <svg class="informations fill-current text-blue-200 w-1/4 ml-auto mr-auto" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"><g><g><g><path d="M256.002,182.774c-12.718,0-21.761,5.37-21.761,13.283V303.73c0,6.782,9.044,13.565,21.761,13.565
                                            c12.152,0,22.043-6.783,22.043-13.565V196.057C278.045,188.144,268.154,182.774,256.002,182.774z"/><path d="M256.002,116.361c-13,0-23.174,9.326-23.174,20.065c0,10.739,10.174,20.348,23.174,20.348
                                            c12.718,0,22.892-9.609,22.892-20.348C278.894,125.688,268.719,116.361,256.002,116.361z"/><path d="M256,0C134.398,0,36,98.348,36,219.873c0,99.231,65.333,181.626,153.417,209.609l50.032,73.747
                                            C243.171,508.715,249.37,512,256,512s12.829-3.285,16.551-8.771l50.032-73.747C410.706,401.486,476,319.061,476,219.873
                                            C476,98.271,377.523,0,256,0z M304.645,393.099c-4.555,1.274-8.51,4.12-11.165,8.033L256,456.376l-37.479-55.243
                                            c-2.656-3.913-6.611-6.76-11.166-8.033C132.377,372.135,76,303.181,76,219.873C76,120.69,156.748,40,256,40
                                            s180,80.69,180,179.873C436,303.264,379.54,372.158,304.645,393.099z"/></g></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g>
                        </svg>
                    </div>
                    <div class="w-full text-blue-200">
                        <p>MES INFORMATIONS</p>
                    </div>
                </a>


                <a href="${pageContext.request.contextPath}/template" class="animHome flex flex-wrap cursor-pointer w-full lg:w-1/2 bg-blue-400 text-6xl lg:text-3xl p-16 font-semibold text-center">
                    <div class="w-full">
                        <svg class="createCV fill-current text-blue-200 w-1/4 ml-auto mr-auto" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"><g><g><path d="M414.007,148.75c5.522,0,10-4.477,10-10V30c0-16.542-13.458-30-30-30h-364c-16.542,0-30,13.458-30,30v452
                c0,16.542,13.458,30,30,30h364c16.542,0,30-13.458,30-30v-73.672c0-5.523-4.478-10-10-10c-5.522,0-10,4.477-10,10V482
                c0,5.514-4.486,10-10,10h-364c-5.514,0-10-4.486-10-10V30c0-5.514,4.486-10,10-10h364c5.514,0,10,4.486,10,10v108.75
                C404.007,144.273,408.485,148.75,414.007,148.75z"/></g></g><g><g><path d="M212.007,54c-50.729,0-92,41.271-92,92c0,26.317,11.11,50.085,28.882,66.869c0.333,0.356,0.687,0.693,1.074,1
                c16.371,14.979,38.158,24.13,62.043,24.13c23.885,0,45.672-9.152,62.043-24.13c0.387-0.307,0.741-0.645,1.074-1
                c17.774-16.784,28.884-40.552,28.884-66.869C304.007,95.271,262.736,54,212.007,54z M212.007,218
                c-16.329,0-31.399-5.472-43.491-14.668c8.789-15.585,25.19-25.332,43.491-25.332c18.301,0,34.702,9.747,43.491,25.332
                C243.405,212.528,228.336,218,212.007,218z M196.007,142v-6.5c0-8.822,7.178-16,16-16s16,7.178,16,16v6.5c0,8.822-7.178,16-16,16
                S196.007,150.822,196.007,142z M269.947,188.683c-7.375-10.938-17.596-19.445-29.463-24.697c4.71-6.087,7.523-13.712,7.523-21.986
                v-6.5c0-19.851-16.149-36-36-36s-36,16.149-36,36v6.5c0,8.274,2.813,15.899,7.523,21.986
                c-11.867,5.252-22.088,13.759-29.463,24.697c-8.829-11.953-14.06-26.716-14.06-42.683c0-39.701,32.299-72,72-72s72,32.299,72,72
                C284.007,161.967,278.776,176.73,269.947,188.683z"/></g></g><g><g><path d="M266.007,438h-54c-5.522,0-10,4.477-10,10s4.478,10,10,10h54c5.522,0,10-4.477,10-10S271.529,438,266.007,438z"/></g></g><g><g><path d="M266.007,382h-142c-5.522,0-10,4.477-10,10s4.478,10,10,10h142c5.522,0,10-4.477,10-10S271.529,382,266.007,382z"/></g></g><g><g><path d="M266.007,326h-142c-5.522,0-10,4.477-10,10s4.478,10,10,10h142c5.522,0,10-4.477,10-10S271.529,326,266.007,326z"/></g></g><g><g><path d="M88.366,272.93c-1.859-1.86-4.439-2.93-7.079-2.93c-2.631,0-5.211,1.07-7.07,2.93c-1.86,1.86-2.93,4.44-2.93,7.07
                s1.069,5.21,2.93,7.07c1.87,1.86,4.439,2.93,7.07,2.93c2.64,0,5.21-1.07,7.079-2.93c1.86-1.86,2.931-4.44,2.931-7.07
                S90.227,274.79,88.366,272.93z"/></g></g><g><g><path d="M88.366,328.93c-1.869-1.86-4.439-2.93-7.079-2.93c-2.631,0-5.2,1.07-7.07,2.93c-1.86,1.86-2.93,4.44-2.93,7.07
                s1.069,5.21,2.93,7.07c1.87,1.86,4.439,2.93,7.07,2.93c2.64,0,5.21-1.07,7.079-2.93c1.86-1.86,2.931-4.44,2.931-7.07
                S90.227,330.79,88.366,328.93z"/></g></g><g><g><path d="M88.366,384.93c-1.869-1.86-4.439-2.93-7.079-2.93c-2.631,0-5.2,1.07-7.07,2.93c-1.86,1.86-2.93,4.44-2.93,7.07
                s1.069,5.21,2.93,7.07c1.859,1.86,4.439,2.93,7.07,2.93c2.64,0,5.22-1.07,7.079-2.93c1.86-1.86,2.931-4.44,2.931-7.07
                S90.227,386.79,88.366,384.93z"/></g></g><g><g><path d="M266.007,270h-142c-5.522,0-10,4.477-10,10s4.478,10,10,10h142c5.522,0,10-4.477,10-10S271.529,270,266.007,270z"/></g></g><g><g><path d="M491.002,130.32c-9.715-5.609-21.033-7.099-31.871-4.196c-10.836,2.904-19.894,9.854-25.502,19.569L307.787,363.656
                c-0.689,1.195-1.125,2.52-1.278,3.891l-8.858,79.344c-0.44,3.948,1.498,7.783,4.938,9.77c1.553,0.896,3.278,1.34,4.999,1.34
                c2.092,0,4.176-0.655,5.931-1.948l64.284-47.344c1.111-0.818,2.041-1.857,2.73-3.052l125.841-217.963
                C517.954,167.638,511.058,141.9,491.002,130.32z M320.063,426.394l4.626-41.432l28.942,16.71L320.063,426.394z M368.213,386.996
                l-38.105-22l100.985-174.91l38.105,22L368.213,386.996z M489.054,177.693l-9.857,17.073l-38.105-22l9.857-17.073
                c2.938-5.089,7.682-8.729,13.358-10.25c5.678-1.522,11.606-0.74,16.694,2.198c5.089,2.938,8.729,7.682,10.25,13.358
                C492.772,166.675,491.992,172.604,489.054,177.693z"/></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g>
                        </svg>
                    </div>
                    <div class="w-full -ml-5 text-blue-200">
                        <p>CRÉER UN CV</p>
                    </div>
                </a>


                <a href="#" class="animHome flex flex-wrap cursor-pointer w-full lg:w-1/2 bg-blue-200 text-6xl lg:text-3xl p-16 font-semibold text-center">
                    <div class="w-full">
                        <svg class="gallery fill-current text-blue-300 w-1/4 ml-auto mr-auto" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             viewBox="0 0 430.23 430.23" style="enable-background:new 0 0 430.23 430.23;" xml:space="preserve">
                                            <g>
                                                <g>
                                                    <g>
                                                        <path d="M217.875,159.668c-24.237,0-43.886,19.648-43.886,43.886c0,24.237,19.648,43.886,43.886,43.886
                                                            c24.237,0,43.886-19.648,43.886-43.886C261.761,179.316,242.113,159.668,217.875,159.668z M217.875,226.541
                                                            c-12.696,0-22.988-10.292-22.988-22.988c0-12.696,10.292-22.988,22.988-22.988h0c12.696,0,22.988,10.292,22.988,22.988
                                                            C240.863,216.249,230.571,226.541,217.875,226.541z"/>
                                                        <path d="M392.896,59.357L107.639,26.966c-11.071-1.574-22.288,1.658-30.824,8.882c-8.535,6.618-14.006,16.428-15.151,27.167
                                                            l-5.224,42.841H40.243c-22.988,0-40.229,20.375-40.229,43.363V362.9c-0.579,21.921,16.722,40.162,38.644,40.741
                                                            c0.528,0.014,1.057,0.017,1.585,0.01h286.824c22.988,0,43.886-17.763,43.886-40.751v-8.359
                                                            c7.127-1.377,13.888-4.224,19.853-8.359c8.465-7.127,13.885-17.22,15.151-28.212l24.033-212.114
                                                            C432.44,82.815,415.905,62.088,392.896,59.357z M350.055,362.9c0,11.494-11.494,19.853-22.988,19.853H40.243
                                                            c-10.383,0.305-19.047-7.865-19.352-18.248c-0.016-0.535-0.009-1.07,0.021-1.605v-38.661l80.98-59.559
                                                            c9.728-7.469,23.43-6.805,32.392,1.567l56.947,50.155c8.648,7.261,19.534,11.32,30.825,11.494
                                                            c8.828,0.108,17.511-2.243,25.078-6.792l102.922-59.559V362.9z M350.055,236.99l-113.894,66.351
                                                            c-9.78,5.794-22.159,4.745-30.825-2.612l-57.469-50.678c-16.471-14.153-40.545-15.021-57.992-2.09l-68.963,50.155V149.219
                                                            c0-11.494,7.837-22.465,19.331-22.465h286.824c12.28,0.509,22.197,10.201,22.988,22.465V236.99z M409.112,103.035
                                                            c-0.007,0.069-0.013,0.139-0.021,0.208l-24.555,212.114c0.042,5.5-2.466,10.709-6.792,14.106c-2.09,2.09-6.792,3.135-6.792,4.18
                                                            V149.219c-0.825-23.801-20.077-42.824-43.886-43.363H77.337l4.702-40.751c1.02-5.277,3.779-10.059,7.837-13.584
                                                            c4.582-3.168,10.122-4.645,15.674-4.18l284.735,32.914C401.773,81.346,410.203,91.545,409.112,103.035z"/>
                                                    </g>
                                                </g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g><g></g><g></g><g></g>
                        </svg>
                    </div>
                    <div class="w-full text-blue-300">
                        <p>GALERIE</p>
                    </div>
                </a>


                <a href="#" class="animHome flex flex-wrap cursor-pointer w-full lg:w-1/2 bg-blue-100 text-6xl lg:text-3xl p-16 font-semibold text-center">
                    <div class="w-full">
                        <svg class="shop fill-current text-blue-300 w-1/4 ml-auto mr-auto" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             viewBox="0 0 424.449 424.449" style="enable-background:new 0 0 424.449 424.449;" xml:space="preserve"><g><g><g><circle cx="170.241" cy="374.273" r="50.176"/>
                            <path d="M316.673,324.098L316.673,324.098c-27.711,0-50.176,22.465-50.176,50.176s22.465,50.176,50.176,50.176
                                c27.711,0,50.176-22.465,50.176-50.176S344.384,324.098,316.673,324.098z"/>
                            <path d="M402.177,272.897H140.545l-5.12-29.696h215.04c6.326,0.019,12.017-3.843,14.336-9.728l51.2-129.024
                                c3.111-7.892-0.766-16.812-8.658-19.922c-1.808-0.713-3.735-1.076-5.678-1.07H108.801L96.513,12.801
                                c-1.262-7.471-7.784-12.906-15.36-12.8h-58.88c-8.483,0-15.36,6.877-15.36,15.36s6.877,15.36,15.36,15.36h46.08l44.032,260.096
                                c1.262,7.471,7.784,12.906,15.36,12.8h274.432c8.483,0,15.36-6.877,15.36-15.36C417.537,279.774,410.66,272.897,402.177,272.897z
                                "/></g></g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g>
                        </svg>

                    </div>
                    <div class="w-full ml-6 text-blue-300">
                        <p>BOUTIQUE</p>
                    </div>
                </a>
            </div>
        </div>
    </jsp:body>
</p:page>
