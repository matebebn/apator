<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Mateusz
  Date: 28.07.2021
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Panel apator </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/heroes/">
</head>
<body>

<main>

    <div class="px-4 py-5 my-5 text-center">
        <div style="margin-top: 2%;margin-left: 85%" >
            <a href="/" type="button"  class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
            </svg> Home</a>
        </div>
        <h1 class="display-5 fw-bold">Panel apator</h1>


        <div class="col-lg-6 mx-auto">
            <p class="lead mb-4">Lets start quickly. </p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">

<form:form id="registerUser"  action="registerUserForm" class="form-horizontal"   method="POST">
    <div class="shadow-lg p-3 mb-5 bg-body rounded">

    <div class="mb-3">
        <label for="pseudonym" class="form-label">Pseudonym</label>
        <input type="text" class="form-control" id="pseudonym" name="pseudonym" placeholder="">
    </div>
        <div class="mb-3">

            <input type="radio" class="btn-check" name="options-register" value="normal" id="normal" autocomplete="off" checked>
            <label class="btn btn-outline-primary" for="normal">Normal</label>

            <input type="radio" class="btn-check" name="options-register" value="vip" id="vip" autocomplete="off">
            <label class="btn btn-outline-success" for="vip">Vip</label>

            <input type="radio" class="btn-check" name="options-register" id="instant" value="instant" autocomplete="off">
            <label class="btn btn-outline-danger" for="instant">Instant</label>
    </div>
                <button  type="button" id="checkTypeOfUser" class="btn btn-outline-info btn-lg px-4 me-sm-3 fw-bold">Confirm your registration</button>
            </div>
            </div>

            </form:form>
        </div>


        <img class="d-block mx-auto mb-4" src="https://icon-library.com/images/icon-for-users/icon-for-users-17.jpg" alt="" width="400" height="400">
    </div>

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
</main>
<c:if test="${isUserAddSuccess == true}">
    <script type="text/babel">
        Swal.fire({
            icon: 'success',
            html:
                'Registration was successful. Your pseudonym : <b> "${user_pseudonym}" </b>and unique number : <b>"${unique_number}" </b><br></br> ' +
                '<a class="btn btn-success" href="queue">View queue</a>',
            backdrop: `rgba(56, 50, 50, 0.8)`,
            showConfirmButton: false,
            showCloseButton: true,
        })

    </script>
</c:if>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/babel">

        $("#checkTypeOfUser").click(async function () {
            var userType = $("input[name='options-register']:checked").val()
            var pseudonym = $("#pseudonym").val();

            if(pseudonym!="") {
                if (userType != "normal") {
                    const {value: pin} = await Swal.fire({
                        title: 'Enter your pin',
                        input: 'password',
                        backdrop: `rgba(56, 50, 50, 0.8)`,
                        inputPlaceholder: 'Enter your pin',
                        inputAttributes: {
                            maxlength: 10,
                            autocapitalize: 'off',
                            autocorrect: 'off'
                        }
                    })

                    if (pin != "") {
                        if (userType == "vip" && pin == "8888") {
                            $("#registerUser").submit();
                        } else if (userType == "instant" && pin == "0000") {
                            $("#registerUser").submit();
                        } else {
                            Swal.fire({
                                icon: 'error',
                                text: 'Wrong pin: ' + pin + '',
                                backdrop: `rgba(56, 50, 50, 0.8)`,
                            })
                        }

                    } else {
                        Swal.fire({
                            icon: 'error',
                            text: 'Empty pincode!',
                            backdrop: `rgba(56, 50, 50, 0.8)`,
                        })
                    }


                } else {
                    $("#registerUser").submit();
                }
            }else
            {
                Swal.fire({
                    icon: 'error',
                    text: 'Empty pseudonym!',
                    backdrop: `rgba(56, 50, 50, 0.8)`,
                })
            }
        });


</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.21.1/babel.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</body>
</html>
