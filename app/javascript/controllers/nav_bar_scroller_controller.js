import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nav-bar-scroller"
export default class extends Controller {
  connect() {
  }
}

// function changeNavbar() {
//   // console.log(this.scrollY)
//   const navbar = document.querySelector(".navbar-not-homepage")
//   if (this.scrollY >= 40) {
//     navbar.classList.remove("navbar-transparent")
//     if (!navbar.classList.contains("navbar-scrolled")) {
//       navbar.classList.add("navbar-scrolled")
//     }
//   } else {
//     navbar.classList.remove("navbar-scrolled")
//     if (!navbar.classList.contains("navbar-transparent")) {
//       navbar.classList.add("navbar-transparent")
//     }
//   }
// }

// console.log(window.addEventListener("scroll", changeNavbar))
