let menuToggle = document.querySelector(".toggle");
let navogation = document.querySelector(".navigation");
menuToggle.onclick = function () {
  menuToggle.classList.toggle("active");
  navogation.classList.toggle("active");
};

// добавить активный класс в выбранный элемент списка
let list = document.querySelectorAll(".list");
for (let i = 0; i < list.length; i++) {
  list[i].onclick = function () {
    let j = 0;
    while (j < list.length) {
      list[j++].className = "List";
    }
    list[i].className = "List active";
  };
}

document.addEventListener("DOMContentLoaded", function () {
  const spans = document.querySelectorAll(".menu-list > li");
  const tablas = document.querySelectorAll(".cont-tabla");

  // Muestra la tabla inicialmente
  tablas[0].style.display = "block";

  spans.forEach((span, index) => {
    span.addEventListener("click", () => {
      // Oculta todas las tablas
      tablas.forEach((tabla) => (tabla.style.display = "none"));

      // Muestra solo la tabla correspondiente al índice del span clicado
      tablas[index].style.display = "block";
    });
  });
});
