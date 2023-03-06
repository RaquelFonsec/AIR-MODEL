import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
   }

  connect() {
    console.log("Map controller")
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v12' // style URL

    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat])
    })
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement('div')
      customMarker.innerHTML = marker.marker_html
      customMarker.style.height = "30px"
      customMarker.style.width = "30px"
      customMarker.style.backgroundSize = "contain"
      customMarker.style.borderRadius = "50%"
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        // .setPopup(popup)
        .addTo(this.map)
      })
    }
}
