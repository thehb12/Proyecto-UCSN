document.addEventListener("DOMContentLoaded", function () {
  // const toggleUsuario = document.getElementById("dropdown-toggle-usuario");
  const menuUsuario = document.getElementById("dropdown-menu-usuario");
  const toggleCertificados = document.getElementById(
    "dropdown-toggle-certificados"
  );
  const menuCertificados = document.getElementById(
    "dropdown-menu-certificados"
  );

  // // Toggle para el menú del usuario
  // toggleUsuario.addEventListener("click", function (e) {
  //   e.preventDefault();
  //   menuUsuario.style.display =
  //     menuUsuario.style.display === "block" ? "none" : "block";
  // });

  // Toggle para el menú de certificados
  toggleCertificados.addEventListener("click", function (e) {
    e.preventDefault();
    menuCertificados.style.display =
      menuCertificados.style.display === "block" ? "none" : "block";
  });

  // Cerrar ambos menús cuando se haga clic fuera de ellos
  document.addEventListener("click", function (e) {
    // if (!toggleUsuario.contains(e.target) && !menuUsuario.contains(e.target)) {
    //   menuUsuario.style.display = "none";
    // }
    if (
      !toggleCertificados.contains(e.target) &&
      !menuCertificados.contains(e.target)
    ) {
      menuCertificados.style.display = "none";
    }
  });
});
