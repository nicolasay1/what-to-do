import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="distance"
export default class extends Controller {

  static targets = ["km","time"]
  static values = {
    latitude: Number,
    longitude: Number
  };



  connect() {
    if (document.cookie.split("=")[0] == "user_coordinates") {
      const coordinates_dirty = document.cookie.replace("%2C", ",")
      const coordinates = coordinates_dirty.split("=")[1].split(",")

      const user_latitude = coordinates[0]
      const user_longitude = coordinates[1]

      const activity_longitude = this.data.get("longitudeValue")
      const activity_latitude = this.data.get("latitudeValue")

      this.get_distance(user_longitude, user_latitude, activity_longitude, activity_latitude)
    }
  }


   get_distance(user_longitude, user_latitude, activity_longitude, activity_latitude) {
    const url = "https://api.mapbox.com/directions/v5/mapbox/walking/"
    const apiKey= "pk.eyJ1IjoiamFjZWtiYXN0aW45MyIsImEiOiJjbHNpeG83YzQyOTBtMmpubzk4bGU0Y2I3In0.3LU7cAxgIwWOqfEeFV2nHA"

    fetch(`${url}${user_longitude},${user_latitude};${activity_longitude},${activity_latitude}?geometries=geojson&overview=full&access_token=${apiKey}`)
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
