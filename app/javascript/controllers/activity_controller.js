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
    "tags",
    "empty",
    "activityDate",
    'filterCont',
    "filterCount",
    "form",
    "marker",
    "slider",
    "useDistanceFilter"
  ]

  connect() {
    this.loadFilters();
    this.processSlider();

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
    this.filterContTarget.classList.toggle('open');
  }

  loadFilters() {
    const url = window.location.search;
    const startDateRegex = /startDate=([^&]+)/;
    const endDateRegex = /endDate=([^&]+)/;
    const selectedTagsRegex = /selectedTags=([^&]+)/;
    const distanceRegex = /distance=([^&]+)/;

    const startDateMatch = url.match(startDateRegex);
    const startDate = startDateMatch ? startDateMatch[1] : null;

    const endDateMatch = url.match(endDateRegex);
    const endDate = endDateMatch ? endDateMatch[1] : null;

    const selectedTagsMatch = url.match(selectedTagsRegex);
    const selectedTags = selectedTagsMatch ? selectedTagsMatch[1].split(',') : null;

    const distanceMatch = url.match(distanceRegex);
    const distance = distanceMatch ? distanceMatch[1] : null;
    console.log(document.cookie)
    let filterCount = selectedTags ? selectedTags.length : 0;
    if (distance) filterCount += 1;
    if (startDate) filterCount += 1;
    if (endDate) filterCount += 1;
    console.log(filterCount);
    this.filterCountTarget.innerText = filterCount;
    if (filterCount === 0) this.filterCountTarget.style.opacity = '0';

    this.populateFilterForm(startDate, endDate, selectedTags, distance);
  }

  populateFilterForm(startDate, endDate, selectedTags, distanceValue) {
    this.sliderTarget.value = distanceValue || null;
    this.markerTarget.innerHTML = `<p>${distanceValue || '20'}</p>`;
    if(distanceValue) this.useDistanceFilterTarget.checked = true;
    document.getElementById('start-date').value = startDate || '';
    document.getElementById('end-date').value = endDate || '';
    const selectedTagsContainer = this.tagsTarget;
    selectedTagsContainer.innerHTML = '';
    const allSelectedTags = selectedTags || [];
    const allTags = ["Sports", "Hiking", "Immersive", "Culture", "Food", "Outdoors", "Indoors", "Wellness", "Entertainment", "Exploration", "Workshop", "Learning", "Adventure", "Gaming"]
    allTags.forEach(tag => {
      const checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.name = 'selectedTag';
      checkbox.value = tag;
      checkbox.checked = this.isTagSelected(allSelectedTags, tag);
      checkbox.dataset.action = "change->activity#updateFilterCount"

      const label = document.createElement('label');
      label.textContent = tag;

      const div = document.createElement('div');
      div.appendChild(checkbox);
      div.appendChild(label);

      selectedTagsContainer.appendChild(div);
    });
  }

  toggleDistanceFilter() {
    if (this.useDistanceFilterTarget.checked) {
      this.sliderTarget.removeAttribute('disabled');
      this.sliderTarget.style.opacity = 1;
      this.markerTarget.style.opacity = 1;
    } else {
      this.sliderTarget.setAttribute('disabled', 'disabled');
      this.sliderTarget.style.opacity = 0.3;
      this.markerTarget.style.opacity = 0.3;
    }
    this.updateFilterCount()
  }

  processSlider() {
    const maxDistance = 20;
    const slider = this.sliderTarget;
    const sliderPosition = slider.value * 5; // out of 100
    const selectedDistance = Math.round(maxDistance * (sliderPosition)) / 100;
    this.distanceFilter = selectedDistance;
    this.markerTarget.style.left = `${sliderPosition}%`;
    if (selectedDistance === 20) {
      this.markerTarget.innerHTML = `<p>${selectedDistance}+</p>`;
    } else {
      this.markerTarget.innerHTML = `<p>${selectedDistance}</p>`;
    }
    this.toggleDistanceFilter()
  }

  isTagSelected(allSelectedTags, tag) {
    return allSelectedTags.includes(tag);
  }

  applyFilters(e) {
    e.preventDefault();
    const startDate = this.formTarget.querySelector("#start-date").value;
    const endDate = this.formTarget.querySelector("#end-date").value;
    const selectedTags = Array.from(this.tagsTarget.querySelectorAll("input[type='checkbox']:checked")).map(checkbox => checkbox.value).join(',');
    const useDistanceFilter = this.useDistanceFilterTarget.checked;
    const distanceValue = this.sliderTarget.value;

    let filterParams = `?startDate=${startDate}&endDate=${endDate}&selectedTags=${selectedTags}`;

    // Include distance filter parameters if it's checked
    if (useDistanceFilter) {
      filterParams += `&distance=${distanceValue}`;
    }

    window.location = `/activities${filterParams}`;
  }

  updateFilterCount() {
    const distancePresent = this.useDistanceFilterTarget.checked;
    const startDatePresent = this.formTarget.querySelector("#start-date").value !== "";
    const endDatePresent = this.formTarget.querySelector("#end-date").value !== "";
    const selectedTagsLength = Array.from(this.tagsTarget.querySelectorAll("input[type='checkbox']:checked")).length;
    let filterCount = selectedTagsLength;
    if (distancePresent) filterCount += 1;
    if (startDatePresent) filterCount += 1;
    if (endDatePresent) filterCount += 1;
    this.filterCountTarget.innerText = filterCount;
    if (filterCount > 0) {
      this.filterCountTarget.style.opacity = '1';
    } else {
      this.filterCountTarget.style.opacity = '0';
    }
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
    card.style.position = 'fixed';
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
    card.style.position = 'absolute';
    this.saveboxTarget.style.opacity = 0;
    this.discardboxTarget.style.opacity = 0;
    this.discardboxTarget.style.zIndex = 0;
    this.saveboxTarget.style.zIndex = 0;
  }
}
