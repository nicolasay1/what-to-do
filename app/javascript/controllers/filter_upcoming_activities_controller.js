import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-upcoming-activities"
export default class extends Controller {
  connect() {
    console.log("Filtering connected!")
  }
}
