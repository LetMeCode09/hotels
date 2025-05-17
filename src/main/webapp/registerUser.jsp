<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>


<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow-sm fondo-rosita">
                <div class="card-header text-center bg-rosa-fuerte text-white">
                    <h4 class="mb-0 text-dark" >Registro de Usuario</h4>
                </div>
                <div class="card-body">
                    <form action="RegisterServlet" method="post" class="row g-3">

                        <div class="col-12">
                            <label for="inputEmail" class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="inputEmail" required>
                        </div>

                        <div class="col-md-6">
                            <label for="inputNombre" class="form-label">Nombre</label>
                            <input type="text" name="nombre" class="form-control" id="inputNombre" required>
                        </div>

                        <div class="col-md-6">
                            <label for="inputApellidos" class="form-label">Apellidos</label>
                            <input type="text" name="apellidos" class="form-control" id="inputApellidos" required>
                        </div>

                        <div class="col-md-6">
                            <label for="inputUsername" class="form-label">Nombre de usuario</label>
                            <input type="text" name="username" class="form-control" id="inputUsername" required>
                        </div>

                        <div class="col-md-6">
                            <label for="inputPassword" class="form-label">Contraseña</label>
                            <input type="password" name="password" class="form-control" id="inputPassword" required>
                        </div>

                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="termsCheck" required>
                                <label class="form-check-label" for="termsCheck">
                                    Acepto los términos y condiciones
                                </label>
                            </div>
                        </div>

                        <div class="col-12">
                            <button type="submit" class="btn btn-rosa w-100">Comenzar</button>
                        </div>

                        <div id="result" class="alert alert-danger mt-2 text-center" role="alert" style="display: none">
                            ¡No se ha podido crear el usuario!
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>
