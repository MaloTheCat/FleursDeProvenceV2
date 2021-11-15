const initPriceSelected = () => {

  // --- VERSION AVEC collection_select ---
  // const displayElementS = document.getElementById('price-id-s');
  // const displayElementM = document.getElementById('price-id-m');
  // const displayElementL = document.getElementById('price-id-l');
  // let size = document.getElementById('size');

  // size.addEventListener('change', (event) => {
  //   let innerPrice = document.getElementById("price").innerText = `${event.target.value}`;
  //   if (size.options[size.selectedIndex].innerText == "M") {
  //     displayElementS.style.display = 'none';
  //     displayElementM.style.display = 'flex';
  //     displayElementL.style.display = 'none';
  //   } else if (size.options[size.selectedIndex].innerText == "L") {
  //     displayElementS.style.display = 'none';
  //     displayElementM.style.display = 'none';
  //     displayElementL.style.display = 'flex';
  //   } else {
  //     displayElementS.style.display = 'flex';
  //     displayElementM.style.display = 'none';
  //     displayElementL.style.display = 'none';
  //   }
  // });

  // --- VERSION AVEC collection_radio_button ---

  // let price = document.getElementById('price');
  // if (document.querySelector('input[name="composition[size]"]')) {
    // let size = document.querySelectorAll('input[name="composition[size]"]');
  //   size.forEach((element) => {
  //     element.addEventListener("change", function(event) {
  //       price.innerText = event.target.value
  //     });
  //   });
  // };

  // const radioBtn = document.getElementsByClassName('size');
  // let selectedSize = document.getElementsByClassName('size').radio.value;
  // let checkedBtn = document.querySelector('input[name="radio"]:checked').value;

  // checkedBtn.addEventListener("change", (event) =>  {
  //   console.log(event);
  //   console.log(checkedBtn);
  // });

  // --- VERSION FINALE ---

  let selectedSize = document.querySelector('input[name="radio"]:checked').value; // Renvoie une taille
  const basePrice = document.getElementById("price").innerText;   // Renvoie le "prix" sur la photo
  const parsedBasePrice = parseInt(basePrice);                    // Renvoie le prix sur la photo
  const radioBtns = document.getElementById('radioBtns');

  radioBtns.addEventListener("change", function(size){
    switch (size.target.value) {      // Renvoie la size
      case 'S':
        document.getElementById("price").innerText = parsedBasePrice;
        break;
      case 'M':
        document.getElementById("price").innerText = (parsedBasePrice + 10);
        break;
      case 'L':
        document.getElementById("price").innerText = (parsedBasePrice + 20);
        break;
      default:
      console.log('Erreur');
    }
  });
};
export { initPriceSelected };
