import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["toggleSelect"]

  connect() {
    console.log("I am connected")
  }

  select() {
    console.log(this.toggleSelectTarget)
    this.toggleSelectTarget.classList.toggle("select")
  }
}
