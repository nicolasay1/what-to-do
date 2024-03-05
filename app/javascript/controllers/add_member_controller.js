import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["id"]

  connect() {
    console.log("I am connected")

  }

  add() {
  }

}
