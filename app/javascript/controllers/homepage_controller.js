import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="homepage"
export default class extends Controller {
  connect() {
  }
}
function scrollDown () {
  const tutorialDisplay = document.querySelector(".tutorial-container");
  tutorialDisplay.scrollIntoView();
}

function displayTutorial () {
  const tutorialContainer = document.querySelector(".tutorial-container")
  tutorialContainer.classList.add('active')
}
function displayTest(navItem) {
  console.log(navItem)
}
function togglePic (element) {
  const pictures = document.querySelectorAll(".nav-link-photo")
  console.log(pictures)
  console.log(element.target.parentElement.children[0].classList)
  console.log(pictures[0])
  pictures.forEach(picture => {
    picture.classList.remove('active')
  })
  element.target.parentElement.children[0].classList.add('active')
}

function helloTest () {
  console.log('Hello')
}

const parentNavItems = document.querySelectorAll(".scroll-on-click")
const navItems = document.querySelectorAll(".scroll-on-click")
navItems.forEach(navItem => {
  navItem.addEventListener("click", displayTutorial)
  navItem.addEventListener("click", scrollDown)
  navItem.addEventListener("click", togglePic)
})

window.addEventListener("click", helloTest)
