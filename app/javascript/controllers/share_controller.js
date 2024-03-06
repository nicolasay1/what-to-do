import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["toggleSelect"]
  static values = {
    group: String,
    activity: Number,
    token: String,
  }

  connect() {
    console.log(this.tokenValue);
    this.cards = [];
  }

  select(event) {
    const clickedCard = event.currentTarget
    clickedCard.classList.toggle("selected")
    const selected = this.toggleSelectTargets.filter(card => card.classList.contains("selected"))
    this.cards = [];
    selected.forEach(element => {
      this.cards.push(element.id)
    });
  }

  send() {
    console.log("test")
    this.cards.forEach((cardId) => {
      fetch("/proposals", {
        method: 'POST',
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": this.tokenValue
        },
        body: JSON.stringify({group_id: cardId, activity_id: this.activityValue})
      }).then(resp => console.log(resp))
    })
  }
}
