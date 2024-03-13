import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    console.log("Autocomplete Connected")
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,

      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)
    const postCode = this.addressTarget.dataset.cookie

    const mapboxInput = document.querySelector(".mapboxgl-ctrl-geocoder--input");
    document.querySelector(".mapboxgl-ctrl-geocoder--input").value = postCode
    mapboxInput.addEventListener("change", (event) => {
      console.log("IM CHANGING")
      this.addressTarget.value = event.target.value
    })

    this.geocoder.on("clear", () => this.#clearInputValue())

  }

  disconnect() {
    this.geocoder.onRemove()

  }

  #clearInputValue() {
    this.addressTarget.value = "EC1V9EU"
  }
}
