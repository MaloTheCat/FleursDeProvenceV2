import mapboxgl from '!mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

let map;
let markers;
let bounds;
let listMarker;
let mapMarkers = []

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const buildMarker = (listMarker) => {
  // Create a HTML element for your custom marker
  listMarker.forEach((marker) => {
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('https://res.cloudinary.com/dhj5ygysw/image/upload/v1638392415/marker.png')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '42px';
    element.style.height = '50px';
    // Pass the element as an argument to the new marker
    const marker_to_map = new mapboxgl.Marker(element);
    marker_to_map.setLngLat([marker.lng, marker.lat]);
    marker_to_map.addTo(map);
    // Fit
    bounds.extend([marker.lng, marker.lat])
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
    // Add to array
    mapMarkers.push(marker_to_map)
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  listMarker = JSON.parse(mapElement.dataset.markers);
  if (mapElement) {
    map = buildMap(mapElement);
    bounds = new mapboxgl.LngLatBounds();
    markers = buildMarker(listMarker);
  }
};

export { initMapbox };
