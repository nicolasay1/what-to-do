import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity"
export default class extends Controller {
  static values = {
    token: String,
  }

  static targets = [
    "card",
    "savebox",
    "discardbox"
  ]

  connect() {
    this.activeCardIndex = 0;
    this.startX = null;
    this.rotateValue = '';
    this.scaleValue = '';

    if (this.cardTargets.length > 0) {
      this.hideAllCards()
      this.showCard()
    }
    this.threshold = window.screen.width * 0.35
  }

  hideAllCards() {
    this.cardTargets.forEach(card => {
      card.style.display = "none"
    })
  }

  showCard() {
    this.hideAllCards()
    this.cardTargets[this.activeCardIndex].style.display = "block"
  }

  save(event) {
    const index = parseInt(event.currentTarget.closest(".card").dataset.index)
    const activityId = this.cardTargets[index].dataset.activityId;

    fetch(`/saves`, {
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
          this.activeCardIndex += 1;
          this.showCard()
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
      this.activeCardIndex += 1;
      this.showCard()
    } else {
      this.hideAllCards()
    }
  }

  handleTouchStart(event) {
    // get the shown card element
    const card = this.cardTargets[this.activeCardIndex];
    this.cardWidth = card.clientWidth;
    // get the cards x and y position (relative to the screen borders)
    const cardX = card.getBoundingClientRect().left + (this.cardWidth / 2);
    const cardY = card.getBoundingClientRect().top;
    // save the cards starting position for future comparison
    this.startX = cardX;
    this.startY = cardY;
    // find where on the card we have pressed
    this.cardPressX = event.targetTouches[0].clientX - card.getBoundingClientRect().left;
    this.cardPressY = event.targetTouches[0].clientY - cardY;
    // shift the card to be anchored to that location
    card.style.transform = `translate(-${this.cardPressX}px, -${this.cardPressY}px)`;
    card.style.left = `${event.targetTouches[0].clientX}px`;
    card.style.top = `${event.targetTouches[0].clientY}px`;
  }

  handleTouchMove(event) {
    const card = this.cardTargets[this.activeCardIndex];
    // set the cards left and right to match where the touch is
    card.style.left = `${event.targetTouches[0].clientX}px`;
    card.style.top = `${event.targetTouches[0].clientY}px`;
    card.style.transform = `translate(-${this.cardPressX}px, -${this.cardPressY}px) ${this.rotateValue} ${this.scaleValue}`;
    const xOffset = card.getBoundingClientRect().left + (this.cardWidth / 2) - this.startX;
    if (xOffset > 0) {
      if (xOffset >= (this.threshold)) {
        this.saveboxTarget.classList.add('ready-save');
      } else {
        this.saveboxTarget.classList.remove('ready-save');
      }
      const opacity = xOffset / (this.threshold);
      this.rotateValue = `rotate(${30 * opacity}deg)`;
      this.scaleValue = `scale(${1-(opacity * 0.3)})`;
      this.saveboxTarget.style.opacity = opacity;
    } else if (xOffset < 0) {
      if (xOffset <= -(this.threshold)) {
        this.discardboxTarget.classList.add('ready-discard');
      } else {
        this.discardboxTarget.classList.remove('ready-discard');
      }
      const opacity = Math.abs(xOffset) / (this.threshold);
      this.rotateValue = `rotate(-${30 * opacity}deg)`;
      this.scaleValue = `scale(${1-(opacity * 0.5)})`;
      this.discardboxTarget.style.opacity = opacity;
    }
  }

  handleTouchEnd(event) {
    const card = this.cardTargets[this.activeCardIndex];
    // check if the cards current position is greater than initial offset (moved right)
    if (card.getBoundingClientRect().left + (this.cardWidth / 2) - this.startX > 200) {
      this.save(event)
    } else if (card.getBoundingClientRect().left + (this.cardWidth / 2) - this.startX < -200) {
      this.discard(event)
    }
    // back to original position
    card.style.left = `50%`;
    card.style.top = `50%`;
    card.style.transform = 'translate(-50%, -50%)';
    this.saveboxTarget.style.opacity = 0;
    this.discardboxTarget.style.opacity = 0;
gst
  }
}
