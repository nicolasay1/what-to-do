import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="distance"
export default class extends Controller {

  static targets = []

  connect() {
    console.log("I'm connected")
    this.get_user_location()
    this.get_distance()
  }

  get_user_location() {
    if ("geolocation" in navigator) {
      // Prompt user for permission to access their location
      navigator.geolocation.getCurrentPosition(
        // Success callback function
        (position) => {
          // Get the user's latitude and longitude coordinates
          const user_lat = position.coords.latitude;
          const user_lng = position.coords.longitude;

          // Do something with the location data, e.g. display on a map
          console.log(`Latitude: ${user_lat}, longitude: ${user_lng}`);
          this.get_distance(user_lng, user_lat)
        },
        // Error callback function
        (error) => {
          // Handle errors, e.g. user denied location sharing permissions
          console.error("Error getting user location:", error);
        }
      );
    } else {
      // Geolocation is not supported by the browser
      console.error("Geolocation is not supported by this browser.");
    }
   }

   get_distance(user_lng, user_lat) {
    const url = "https://api.mapbox.com/directions/v5/mapbox/walking/"
    const apiKey= "pk.eyJ1IjoiamFjZWtiYXN0aW45MyIsImEiOiJjbHNpeG83YzQyOTBtMmpubzk4bGU0Y2I3In0.3LU7cAxgIwWOqfEeFV2nHA"

    fetch(`${url}${user_lng},${user_lat};-0.098341,51.513245?geometries=geojson&overview=full&access_token=${apiKey}`)
    .then(resp => resp.json())
    .then(data => {
      let distance = (data["routes"][0]["distance"])
      let duration = (data["routes"][0]["duration"])

      console.log(distance/1000)
      console.log(duration/60)

// The distance traveled between waypoints, in meters -> We want KM or miles
// The estimated travel time between waypoints, in seconds. -> We want minutes


    })
   }

}
