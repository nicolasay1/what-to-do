import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity"
export default class extends Controller {
  connect() {
    console.log("We're in")
  }

  save() {
    console.log("Interested")
  }

  discard() {
    console.log("discarded")
  }
}
