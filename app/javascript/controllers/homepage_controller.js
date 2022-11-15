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

function helloTest () {
  console.log('Hello')
}
const navItems = document.querySelectorAll(".scroll-on-click")
navItems.forEach(navItem => {
  navItem.addEventListener("click", displayTutorial)
  navItem.addEventListener("click", scrollDown)
})

window.addEventListener("click", helloTest)
