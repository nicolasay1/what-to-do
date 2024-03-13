import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="current-location-on-click"
export default class extends Controller {

  static targets = ["address"]

  request() {
    console.log("I was clicked")
      if ("geolocation" in navigator) {
        // Prompt user for permission to access their location
        navigator.geolocation.getCurrentPosition(
          // Success callback function
          (position) => {
            // Get the user's latitude and longitude coordinates
            const user_latitude = position.coords.latitude;
            const user_longitude = position.coords.longitude;
            document.cookie = `user_coordinates=${user_latitude},${user_longitude}; expires=Thu, 18 Dec 2033 12:00:00 UTC; path=/`;

            document.querySelector(".mapboxgl-ctrl-geocoder--input").value = this.addressTarget.dataset.cookie
            window.alert("Location Updated");
            window.location.reload();

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
  }
