import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="coordinates"
export default class extends Controller {
  connect() {
    if (document.cookie.split("=")[0] == "user_coordinates") {
      document.cookie.split("=")[1]
    } else {
      this.get_user_location()
    }
  }

  get_user_location() {
    if ("geolocation" in navigator) {
      // Prompt user for permission to access their location
      navigator.geolocation.getCurrentPosition(
        // Success callback function
        (position) => {
          // Get the user's latitude and longitude coordinates
          const user_latitude = position.coords.latitude;
          const user_longitude = position.coords.longitude;
          document.cookie = `user_coordinates=${user_latitude},${user_longitude}; expires=Thu, 18 Dec 2033 12:00:00 UTC; path=/`;
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
