import mapboxgl from '!mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapboxRelai = () => {
  const mapElement = document.getElementById('map');
  // --------- Get the selected Relai from collection_select ----------------------
  let relai_id = document.getElementById('relai_id');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  relai_id.addEventListener('change', (event) => {
    // --------- Get All Relais ---------------------
    const relais = [
      {id: 1, name: "Villa Augusta", longitude: "4.7661659", latitude: "44.3451691" },
      {id: 2, name: "Maison Buffet gourmet", longitude: "4.76574", latitude: "44.34909" }
    ];
    // ----------------------------------------------
    event.preventDefault();

    let relai = relais.find(function (element) {
      // console.log(event.target.value); // => l'id du Relai selectionné
      return element.id == event.target.value;
      relais.find(element => element["id"] == relai);
    })
    console.log(relai.name);
    console.log(relai.longitude);
    console.log(relai.latitude);
    if (mapElement) {
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10'
      });
      const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        // marker.remove()
        new mapboxgl.Marker()
        .setLngLat([ relai.longitude, relai.latitude ])
        .addTo(map)
      });
      fitMapToMarkers(map, markers);
    };
  });

//       const markers = JSON.parse(mapElement.dataset.markers);
//       // markers.forEach((marker) => {
//         // mapMarkers.forEach((marker) => marker.remove())
//         // mapMarkers = []
//         new mapboxgl.Marker()
//         .setLngLat([ relai.longitude, relai.latitude ])
//         .addTo(map);
//       // });
//       fitMapToMarkers(map, markers);

//       mapMarkers.forEach((marker) => marker.remove())
//       mapMarkers = []
//       new mapboxgl.Marker()
//       .setLngLat([ relai.longitude, relai.latitude ])
//       .addTo(map);
//     }
};

export { initMapboxRelai };


///////////////// --------------- V2 ------------- //////////////////////////////


// import mapboxgl from '!mapbox-gl';
// import 'mapbox-gl/dist/mapbox-gl.css';


//     // 0. Elements d'initialisation
//     // 1. Fonction principale : InitMapbox
//       // => Si map, afficher initMap avec les markers
//     // 2. Créer map : initMap
//     // 3. Récupérer le relai sélectionné et envoyé à la Map
//     // 4. Créer marker avec relai et l'afficher sur map

// // 0. --------------
// const mapElement = document.getElementById('map');
// let map;
// let markers;
// let mapMarkers = [];
// let bounds;
// let relai_id = document.getElementById('relai_id');

// // 2. --------------
// const initMap = (mapElement) => {
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     return new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10'
//     });
// };

// // 5. --------------
// const addRelaiMarkerToMap = (relai) => {
//   // const activity_marker = markers.find(item => item["id"] == activityId);
//   // const popup = new mapboxgl.Popup().setHTML(relais.infoWindow);

//   // Create a HTML element for your custom marker
//   const element = document.createElement('div');
//   element.className = 'marker';
//   // element.style.backgroundImage = `url('${activity_marker.image_url}')`;
//   element.style.backgroundSize = 'contain';
//   element.style.width = '25px';
//   element.style.height = '25px';

//   // Pass the element as an argument to the new marker
//   const map_marker = new mapboxgl.Marker(element);
//   map_marker.setLngLat([relai.longitude, relai.latitude]);
//   // map_marker.setPopup(popup)
//   map_marker.addTo(map);

//   // Fit
//   bounds.extend([relai.longitude, relai.latitude]);
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15 });

//   // Add to array
//   mapMarkers.push(map_marker);
// };

// // 3. --------------
// const selectedRelai = (relai) => {
//   const relais = [
//     {id: 1, name: "Villa Augusta", longitude: "44.34531", latitude: "4.766563" },
//     {id: 2, name: "Maison Buffet gourmet", longitude: "44.349240", latitude: "4.774910" }
//   ];
//   mapMarkers.forEach((marker) => marker.remove())
//   mapMarkers = []

//   relai_id.addEventListener('change', (event) => {
//     let relai = relais.find(function (element) {
//       // console.log(event.target.value); // => l'id du Relai selectionné
//       return element.id == event.target.value;
//       relais.find(element => element["id"] == relai);
//       console.log(relai);
//     });
//     // addRelaiMarkerToMap(relai);
//   });
// };

// // 1. --------------
// const initMapboxRelai = () => {
//   const mapElement = document.getElementById('map');
//   if (mapElement) {
//     map = initMap(mapElement);
//     markers = JSON.parse(mapElement.dataset.markers);
//     bounds = new mapboxgl.LngLatBounds();
//   }
// };

// export { initMapboxRelai, selectedRelai };


///////////////// --------------- V3 ------------- //////////////////////////////


// import mapboxgl from '!mapbox-gl';
// import 'mapbox-gl/dist/mapbox-gl.css';

// const initMapboxRelai = () => {
//   const mapElement = document.getElementById('map');

//   const fitMapToMarkers = (map, markers) => {
//     const bounds = new mapboxgl.LngLatBounds();
//     markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//     map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
//   };

//     // relai_id.addEventListener('change', (event) => {
//     //   const relais = [
//     //     {id: 1, name: "Villa Augusta", longitude: "44.34531", latitude: "4.766563" },
//     //     {id: 2, name: "Maison Buffet gourmet", longitude: "44.349240", latitude: "4.774910" }
//     //   ];
//     //   event.preventDefault();
//     //   let relai = relais.find(function (element) {
//     //     // console.log(event.target.value); // => l'id du Relai selectionné
//     //     return element.id == event.target.value;
//     //     relais.find(element => element["id"] == relai);
//     //     console.log(relai.name);
//     //   });
//     // });

//   if (mapElement) {
//     mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//     const map = new mapboxgl.Map({
//       container: 'map',
//       style: 'mapbox://styles/mapbox/streets-v10'
//     });


//     const markers = JSON.parse(mapElement.dataset.markers);
//     markers.forEach((marker) => {
//     // marker.remove()
//     // markers = []
//     new mapboxgl.Marker()
//     .setLngLat([ marker.lng, marker.lat ])
//     .addTo(map);
//     });
//     fitMapToMarkers(map, markers);
//   };
// };

// export { initMapboxRelai };
