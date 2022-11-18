import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="homepage"
export default class extends Controller {
  connect() {
  }
}
function scrollDown (element) {
  let targetElement = element.target.classList[1]
  console.log(targetElement)
  const tutorialDisplay = document.querySelectorAll(`.tutorial-phases-container`);
  if (element.target.classList[1] == "editor") {
    tutorialDisplay[0].scrollIntoView();
  } else {
    tutorialDisplay[1].scrollIntoView();
  }
}

function displayTutorial () {
  const tutorialContainer = document.querySelector(".tutorial-container")
  tutorialContainer.classList.add('active')
}

function togglePic (element) {
  const pictures = document.querySelectorAll(".nav-link-photo")
  pictures.forEach(picture => {
    picture.classList.remove('active')
  })
  element.target.parentElement.children[0].classList.add('active')
}

function helloTest () {
  console.log('Hello')
}

const navItems = document.querySelectorAll(".scroll-on-click")
navItems.forEach(navItem => {
  navItem.addEventListener("click", displayTutorial)
  navItem.addEventListener("click", scrollDown)
  navItem.addEventListener("click", togglePic)
})

function changeLogoSource () {
  const navbarLogo = document.querySelector(".navbar-brand img")
  // console.log(navbarLogo.src)
  this.scrollY > 680 ? navbarLogo.src = "http://localhost:3000/assets/rights-logo-eecac45108f425f009587b4ca0a9f46cf541ae41d4034a870baa914f87838d33.png" : navbarLogo.src = "http://localhost:3000/assets/rights-logo-white-95ca7fabe1012c1e99130768a44dd135b4ee1523b5730bd832bb886905ff0cbf.png"
}
window.addEventListener("scroll", changeLogoSource)
