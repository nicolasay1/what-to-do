import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity"
export default class extends Controller {
  static values = {
    token: String,
  }

  static targets = [
    "card",
    "container",
    "savebox",
    "discardbox",
    "form",
    "tags",
    "empty",
    "activityDate"
  ]

  connect() {
    this.loadFilters();

    this.activeCardIndex = 0;
    this.allCards = this.cardTargets;
    this.activeCards = this.cardTargets;
    this.showCard(0);

    this.startX = null;
    this.rotateValue = '';
    this.scaleValue = '';
    this.threshold = window.screen.width * 0.35;
  }

  toggleFilterForm() {
    const startDate = this.formTarget.style.display = this.formTarget.style.display === "none" ? "block" : "none";
  }

  loadFilters() {
    const url = window.location.search;
    const startDateRegex = /startDate=([^&]*)/;
    const endDateRegex = /endDate=([^&]*)/;
    const selectedTagsRegex = /selectedTags=([^&]*)/;

    const startDateMatch = url.match(startDateRegex);
    const startDate = startDateMatch ? startDateMatch[1] : null;

    const endDateMatch = url.match(endDateRegex);
    const endDate = endDateMatch ? endDateMatch[1] : null;

    const selectedTagsMatch = url.match(selectedTagsRegex);
    const selectedTags = selectedTagsMatch ? selectedTagsMatch[1].split(',') : null;

    console.log("Start Date: ", startDate);
    console.log("End Date: ", endDate);
    console.log("Selected Tags: ", selectedTags);

    this.populateFilterForm(startDate, endDate, selectedTags);
  }

  populateFilterForm(startDate, endDate, selectedTags) {
    document.getElementById('start-date').value = startDate || '';
    document.getElementById('end-date').value = endDate || '';
    const selectedTagsContainer = this.tagsTarget;
    selectedTagsContainer.innerHTML = '';
    const allSelectedTags = selectedTags || [];
    const allTags = ["Sports", "Walk", "Immersive", "History", "Food", "Weekend"]
    allTags.forEach(tag => {
      const checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.name = 'selectedTag';
      checkbox.value = tag;
      checkbox.checked = this.isTagSelected(allSelectedTags, tag);

      const label = document.createElement('label');
      label.textContent = tag;

      const div = document.createElement('div');
      div.appendChild(checkbox);
      div.appendChild(label);

      selectedTagsContainer.appendChild(div);
    });
  }

  isTagSelected(allSelectedTags, tag) {
    return allSelectedTags.includes(tag);
  }

  applyFilters(e) {
    e.preventDefault();
    const startDate = this.formTarget.querySelector("#start-date").value;
    const endDate = this.formTarget.querySelector("#end-date").value;
    const selectedTags = Array.from(this.tagsTarget.querySelectorAll("input[type='checkbox']:checked")).map(checkbox => checkbox.value).join(',');
    // this.activeCards = this.allCards.filter((card) => {
    //   const tags = card.dataset.tags.split(', ');
    //   const eventDate = Date(document.querySelector(".fa-calendar-days").nextSibling.nodeValue);
    //   // console.log(Date(this.activityDateTarget.nextSibling.nodeValue + "Z"))
    //   // console.log(eventDate)
    //   // console.log(startDate)
    //   let datesMatch = true
    //   if (startDate && endDate) {
    //     datesMatch = eventDate >= startDate && eventDate <= endDate;
    //     console.log("passed startend")
    //   } else if (startDate) {
    //     datesMatch = eventDate >= startDate;
    //     console.log("passed start")
    //   } else if (endDate) {
    //     datesMatch = eventDate <= endDate;
    //     console.log("passed end")
    //   }
    //   console.log(datesMatch)
    //   for (let i = 0; i < tags.length; i++) {
    //     const tagsMatch = selectedTags.length === 0 || selectedTags.includes(tags[i]);
    //     if (tagsMatch && datesMatch) {
    //       return true;
    //     }
    //   }
    //   return false;
    // });
    window.location = `/activities?startDate=${startDate}&endDate=${endDate}&selectedTags=${selectedTags}`
  }

  showCard(index) {
    this.allCards.forEach(card => {
      card.style.display = "none"
    })
    if (index < this.activeCards.length - 1) {
      this.emptyTarget.classList.remove('visible');
      this.activeCards[index].style.display = "block"
    } else {
      this.emptyTarget.classList.add('visible');
    }
  }

  share() {
    const activityId = this.activeCards[this.activeCardIndex].dataset.activityId;
    window.location = `/activities/${activityId}/share`
  }

  save(event) {
    const activityId = this.activeCards[this.activeCardIndex].dataset.activityId;

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
        this.activeCardIndex += 1;
        this.showCard(this.activeCardIndex)
      } else {
        throw new Error('Failed to save activity')
      }
    })
    .catch(error => console.error(error))
  }

  discard(event) {
    this.activeCardIndex += 1
    this.showCard(this.activeCardIndex)
  }

  handleTouchStart(event) {
    // get the shown card element
    const card = this.activeCards[this.activeCardIndex];
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
    this.discardboxTarget.style.zIndex = 20;
    this.saveboxTarget.style.zIndex = 20;
  }

  handleTouchMove(event) {
    const card = this.activeCards[this.activeCardIndex];
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
    const card = this.activeCards[this.activeCardIndex];
    // check if the cards current position is greater than initial offset (moved right)
    const xOffset = card.getBoundingClientRect().left + (this.cardWidth / 2) - this.startX;
    if (xOffset >= (this.threshold)) {
      this.save(event)
    } else if (xOffset <= -(this.threshold)) {
      this.discard(event)
    }
    // back to original position
    card.style.left = `50%`;
    card.style.top = `50%`;
    card.style.transform = 'translate(-50%, -50%)';
    this.saveboxTarget.style.opacity = 0;
    this.discardboxTarget.style.opacity = 0;
    this.discardboxTarget.style.zIndex = 0;
    this.saveboxTarget.style.zIndex = 0;
  }
}
