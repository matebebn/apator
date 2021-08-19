
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Mateusz
  Date: 28.07.2021
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Panel apator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/heroes/">






</head>
<body>

<main>
    <div class="px-4 py-5 my-5 text-center">
        <div style="margin-top: 2%;margin-left: 65%" >
            <a href="/" type="button"  class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
            </svg> Home</a>
        </div>
        <h1 class="display-5 fw-bold">System apator</h1>

        <div class="container">
            <div class="row">
                <div class="col">
                    <div>
                        <table id="example" class="table table-hover">
                            <thead>
                            <tr>
                                <th>Priority</th>
                                <th>User pseudonym</th>
                                <th>User unique number</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${users}" var="emp">
                                <tr>

                                    <td>
                                        <c:if test = "${emp.type_user=='0'}"><span class="badge bg-danger">INSTANT</span></c:if>
                                        <c:if test = "${emp.type_user=='1'}"><span class="badge bg-success">VIP</span></c:if>
                                        <c:if test = "${emp.type_user=='2'}"><span class="badge bg-primary">NORMAL</span></c:if>
                                    </td>
                                    <td>${emp.user_pseudonym}</td>
                                    <td>${emp.user_unique_number}</td>
                                </tr>
                            </c:forEach>

                            </tbody>


                        </table>
                        <br>
                        <nav style="float: right" aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/viewQueueUsersPage" ><c:param name="page" value="${actualPage-1}"/>${actualPage}</c:url>" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <c:forEach begin="${startpage}" end="${endpage}" var="p">

                                    <li class="page-item">
                                        <c:if test = "${p<=maxPage}">
                                            <a class="page-link" href="<c:url value="/viewQueueUsersPage" ><c:param name="page" value="${p-1}"/>${p}</c:url>">${p}</a>
                                        </c:if>
                                    </li>

                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="<c:url value="/viewQueueUsersPage" ><c:param name="page" value="${actualPage+1}"/>${actualPage}</c:url>" aria-label="Next">

                                        <span class="sr-only">Next</span>
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-lg-6 mx-auto">
            <p class="lead mb-4">Start quickly and find yourself. </p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">

                <form:form id="submitCheckPostionAndTimeUser"  action="checkPostionAndTimeUser" class="form-horizontal"   method="POST">
                <div class="shadow-lg p-3 mb-5 bg-body rounded">
                    <div class="mb-3">
                        <label for="key" class="form-label">Pseudonym or Unique number</label>
                        <input type="text" class="form-control" id="key" name="key" placeholder="Type necessary information ">
                    </div>
                    <button  type="button" id="checkIfTypeKey" class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold">Check</button>
                </div>
            </div>

            </form:form>
        </div>

    </div>


    <img class="d-block mx-auto mb-4" src="https://icon-library.com/images/icon-for-users/icon-for-users-17.jpg" alt="" width="300" height="300">






    <div class="b-example-divider"></div>


    <div class="bg-dark text-secondary px-4 py-5 text-center">
        <div class="py-5">
            <h1 class="display-5 fw-bold text-white">Dark mode hero</h1>
            <div class="col-lg-6 mx-auto">
                <p class="fs-5 mb-4">Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit, featuring Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful JavaScript plugins.</p>
                <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">

                </div>
            </div>
        </div>
    </div>


    <c:set var="billableTime"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${waitingTime}" /></c:set>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<c:if test="${information == true}">
    <script type="text/babel">
        Swal.fire({
            icon: 'success',
            html:
                'Checking  was successful. Your position in queue : <b> "${position}" </b>and time waiting : <b>"${billableTime} minutes" </b><br></br>',
            backdrop: `rgba(56, 50, 50, 0.8)`,
            showConfirmButton: false,
            showCloseButton: true,
        })

    </script>
</c:if>
<c:if test="${information == false}">
    <script type="text/babel">
        Swal.fire({
            icon: 'error',
            text: 'User cannot be found, check the user information provided',
            backdrop: `rgba(56, 50, 50, 0.8)`,
        })

    </script>
</c:if>

<script type="text/babel">

    $("#checkIfTypeKey").click(function () {

        var key = $("#key").val();
        if(key!="")
        {
            $("#submitCheckPostionAndTimeUser").submit();
        }else{
            Swal.fire({
                icon: 'error',
                text: 'Please type necessary information!',
                backdrop: `rgba(56, 50, 50, 0.8)`,
            })
        }
    });


</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.21.1/babel.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>
</html>
