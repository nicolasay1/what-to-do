import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address",
      countries: "gb"
    })

    console.log(this.addressTargets)
    this.geocoder.addTo(this.element)
    const postCode = this.addressTarget.dataset.cookie
    console.log(postCode)
    const mapboxInput = document.querySelector(".mapboxgl-ctrl-geocoder--input");

    mapboxInput.addEventListener("change", (event) => {
      this.addressTarget.value = event.target.value
    })

  }

  disconnect() {
    this.geocoder.onRemove()

  }
}
