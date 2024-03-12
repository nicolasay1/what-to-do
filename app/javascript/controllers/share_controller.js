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
  }

  select(event) {
    const clickedCard = event.currentTarget
    clickedCard.classList.toggle("selected")
    this.groupCards = this.toggleSelectTargets.filter(card => card.classList.contains("selected"))
  }

  send() {
    this.groupCards.forEach((card) => {
      const chatroomId = card.dataset.chatroomId;
      console.log(chatroomId);
      fetch(`/chatrooms/${chatroomId}/messages`,{
        method: 'POST',
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": this.tokenValue
        },
        body: JSON.stringify({chatroom_id: chatroomId, message: { content: this.activityValue, activity: true} })
      })
    })
    window.history.back();
  }
}
