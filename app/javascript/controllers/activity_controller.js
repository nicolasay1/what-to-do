import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity"
export default class extends Controller {
  static values = {
    token: String,
  }

  static targets = [
    "card"
  ]

  connect() {
    if (this.cardTargets.length > 0) {
      this.hideAllCards()
      this.showCard(0)
    }
  }

  hideAllCards() {
    this.cardTargets.forEach(card => {
      card.style.display = "none"
    })
  }

  showCard(index) {
    this.hideAllCards()
    this.cardTargets[index].style.display = "block"
  }

  save(event) {
    const index = parseInt(event.currentTarget.closest(".card").dataset.index)
    const activityId = this.cardTargets[index].dataset.activityId;

    fetch(`/activities/${activityId}/saves`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": this.tokenValue,
      },
      body: JSON.stringify({ activity_id: activityId })
    })
    .then(response => {
      if (response.status === 201) {
        console.log(`Saved activity at index ${index}`)
        if (index < this.cardTargets.length - 1) {
          this.showCard(index + 1)
        } else {
          this.hideAllCards()
        }
      } else {
        throw new Error('Failed to save activity')
      }
    })
    .catch(error => console.error(error))
  }

  discard(event) {
    const index = parseInt(event.currentTarget.closest(".card").dataset.index)
    console.log(`Discarded activity at index ${index}`)
    if (index < this.cardTargets.length - 1) {
      this.showCard(index + 1)
    } else {
      this.hideAllCards()
    }
  }
}
