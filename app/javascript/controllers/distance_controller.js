import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="distance"
export default class extends Controller {

  static targets = ["km","time"]
  static values = {
    lat: Number,
    lng: Number
  };



  connect() {
    console.log("I'm connected")
    this.get_user_location()
    // this.get_distance()
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
          console.log(`User Coordinates: latitude: ${user_lat}, longitude: ${user_lng}`);

          // Get Activity lat and long
          const activity_lng = this.data.get("lngValue")
          const activity_lat = this.data.get("latValue")
          console.log(`Activity Coordinates: latitude: ${activity_lat}, longitude: ${activity_lng}`);



          // Call function to get distance
          this.get_distance(user_lng, user_lat, activity_lng, activity_lat)
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

   get_distance(user_lng, user_lat, activity_lng, activity_lat) {
    const url = "https://api.mapbox.com/directions/v5/mapbox/walking/"
    const apiKey= "pk.eyJ1IjoiamFjZWtiYXN0aW45MyIsImEiOiJjbHNpeG83YzQyOTBtMmpubzk4bGU0Y2I3In0.3LU7cAxgIwWOqfEeFV2nHA"

    fetch(`${url}${user_lng},${user_lat};${activity_lng},${activity_lat}?geometries=geojson&overview=full&access_token=${apiKey}`)
    .then(resp => resp.json())
    .then(data => {
      let distance = (data["routes"][0]["distance"])
      let duration = (data["routes"][0]["duration"])
      this.convertSeconds(duration)
      this.kmTarget.innerText = ` ${Math.round(distance/1000, 2)} KM`


// The distance traveled between waypoints, in meters -> We want KM or miles
// The estimated travel time between waypoints, in seconds. -> We want minutes


    })
   }

  convertSeconds(duration) {
    const hours = Math.floor(duration / 3600)
    const minutes = Math.floor((duration % 3600) / 60)

    if (hours > 0) {
      this.timeTarget.innerText = ` ${hours} hours : ${minutes} minutes away`
    } else {
      this.timeTarget.innerText = ` ${minutes} minutes (Walking Distance)`
    }
  }

}
