import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  connect() {
  }
}

function changeSearchbarDisplay() {
  const searchbarContainer = document.querySelector(".searchbar-container")
  searchbarContainer.classList.toggle("underlined")
}
const searchbarQuery = document.querySelector(".form-control-searchbar")

searchbarQuery.addEventListener("focus", changeSearchbarDisplay)
searchbarQuery.addEventListener("focusout", changeSearchbarDisplay)
