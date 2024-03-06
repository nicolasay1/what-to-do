import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"];
  static values = {
    feedbackText: String
  }

  copy(event) {
    navigator.clipboard.writeText(this.inputTarget.value);
    event.target.innerText = 'Copied!';
  }
}
