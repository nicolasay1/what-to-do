import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-member"

export default class extends Controller {
  connect() {
    console.log("I am connected")
  }

  add() {
    console.log("I am about to add a member to the DB")
  }
}
