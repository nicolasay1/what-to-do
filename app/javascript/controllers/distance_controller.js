import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="distance"
export default class extends Controller {

  static targets = ["km","time"]
  static values = {
    lat: Number,
    lng: Number
  };



  connect() {
    if (document.cookie.split("=")[0] == "user_lat") {
      const coordinates_dirty = document.cookie.replace("%2C", ",")
      const coordinates = coordinates_dirty.split("=")[1].split(",")

      const user_lat = coordinates[0]
      const user_lng = coordinates[1]

      const activity_lng = this.data.get("lngValue")
      const activity_lat = this.data.get("latValue")

      this.get_distance(user_lng, user_lat, activity_lng, activity_lat)
    }
  }


   get_distance(user_lng, user_lat, activity_lng, activity_lat) {
    const url = "https://api.mapbox.com/directions/v5/mapbox/walking/"
    const apiKey= "pk.eyJ1IjoiamFjZWtiYXN0aW45MyIsImEiOiJjbHNpeG83YzQyOTBtMmpubzk4bGU0Y2I3In0.3LU7cAxgIwWOqfEeFV2nHA"

    fetch(`${url}${user_lng},${user_lat};${activity_lng},${activity_lat}?geometries=geojson&overview=full&access_token=${apiKey}`)
    .then(resp => resp.json())
    .then(data => {
      let distance = (data["routes"][0]["distance"])
      let duration = (data["routes"][0]["duration"])
      this.convertSeconds(duration)
      this.kmTarget.innerText = `${Math.round(distance/1000, 2)}km`


// The distance traveled between waypoints, in meters -> We want KM or miles
// The estimated travel time between waypoints, in seconds. -> We want minutes


    })
   }

  convertSeconds(duration) {
    const hours = Math.floor(duration / 3600)
    const minutes = Math.floor((duration % 3600) / 60)

    if (hours > 0) {
      this.timeTarget.innerText = ` ${hours}h ${minutes}m walk`
    } else {
      this.timeTarget.innerText = ` ${minutes}m walk`
    }
  }

}
