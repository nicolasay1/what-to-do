import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="likes"
export default class extends Controller {

  static values = {
    proposal: String,
    token: String
  }

  connect() {
  }

  vote(event) {
    event.preventDefault()
    const response = event.currentTarget.innerHTML
    let liked = null
    if (response === "Interested") {
      liked = true
    } else {
      liked = false
    }
    console.log(liked)

    fetch(`/proposals/${this.proposalValue}/likes`, {
      method: 'POST',
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": this.tokenValue
      },
      body: JSON.stringify({proposal_id: this.proposalValue, liked: liked})
    }).then(resp => console.log(resp))

  }
}
