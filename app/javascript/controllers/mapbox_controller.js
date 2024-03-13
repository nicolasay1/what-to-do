import { Controller } from "@hotwired/stimulus"

import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/navigation-night-v1",
      interactive: false,
      zoom: 19.1,
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()
    this.map.addControl(new mapboxgl.NavigationControl());

  }

  #addMarkerToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.longitude, marker.latitude ])
        .addTo(this.map)
    })
  }

  #fitMapToMarker() {
  const bounds = new mapboxgl.LngLatBounds()
  this.markersValue.forEach(marker => bounds.extend([ marker.longitude, marker.latitude ]))
  this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
