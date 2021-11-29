// const initPriceSelected = () => {

//   let selectedSize = document.querySelector('input[name="radio"]:checked').value; // Renvoie une taille
//   const basePrice = document.getElementById("price").innerText;   // Renvoie le "prix" sur la photo
//   const parsedBasePrice = parseInt(basePrice);                    // Renvoie le prix sur la photo
//   const radioBtns = document.getElementById('radioBtns');

//   radioBtns.addEventListener("change", function(size){
//     switch (size.target.value) {      // Renvoie la size
//       case 'S':
//         document.getElementById("price").innerText = parsedBasePrice;
//         break;
//       case 'M':
//         document.getElementById("price").innerText = (parsedBasePrice + 10);
//         break;
//       case 'L':
//         document.getElementById("price").innerText = (parsedBasePrice + 20);
//         break;
//       default:
//       console.log('Erreur');
//     }
//   });
// };
// export { initPriceSelected };
