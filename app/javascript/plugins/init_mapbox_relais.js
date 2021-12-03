import mapboxgl from '!mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapboxRelai = () => {
  const mapElement = document.getElementById('map');
  let relai_id = document.getElementById('relai_id');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  relai_id.addEventListener('change', (event) => {
    const relais = [
      {id: 1, name: "Villa Augusta", longitude: "4.7661659", latitude: "44.3451691" },
      {id: 2, name: "Maison Buffet gourmet", longitude: "4.774910", latitude: "44.349240" }
    ];
    event.preventDefault();

    let relai = relais.find(function (element) {
      return element.id == event.target.value;
      relais.find(element => element["id"] == relai);
    });
    if (mapElement) {
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10'
      });
      const markers = JSON.parse(mapElement.dataset.markers);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('https://res.cloudinary.com/dhj5ygysw/image/upload/v1638392415/marker.png')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '42px';
      element.style.height = '50px';

      markers.forEach((marker) => {
        new mapboxgl.Marker(element)
        .setLngLat([ relai.longitude, relai.latitude ])
        .addTo(map)
      });
      fitMapToMarkers(map, markers);
    };
  });
};

export { initMapboxRelai };
