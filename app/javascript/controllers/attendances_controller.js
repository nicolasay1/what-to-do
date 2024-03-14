import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="attendances"
export default class extends Controller {
  static targets = ["response"]
  static values = {
    event: String,
    token: String
  }

  connect() {
  }

  in(event) {
    event.preventDefault()
    const response = event.currentTarget.innerHTML
    let attending = null
    if (response === "Attending") {
      attending = true
    } else {
      attending = false
    }
    console.log(attending)

    fetch(`/events/${this.eventValue}/attendances`, {
      method: 'POST',
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": this.tokenValue
      },
      body: JSON.stringify({event_id: this.eventValue, attendance: attending})
    }).then(window.location.reload(true))
  }
}
