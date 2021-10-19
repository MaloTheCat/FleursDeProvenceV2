const initPriceSelected = () => {
  // let size = document.getElementById('size');
  // size.addEventListener('change', (event) => {
  //   document.getElementById("price").innerText = `${event.target.value}`;
  // });

  const displayElementS = document.getElementById('price-id-s');
  const displayElementM = document.getElementById('price-id-m');
  const displayElementL = document.getElementById('price-id-l');
  let size = document.getElementById('size');

  size.addEventListener('change', (event) => {
    let innerPrice = document.getElementById("price").innerText = `${event.target.value}`;
    if (size.options[size.selectedIndex].innerText == "M") {
      displayElementS.style.display = 'none';
      displayElementM.style.display = 'block';
      displayElementL.style.display = 'none';
    } else if (size.options[size.selectedIndex].innerText == "L") {
      displayElementS.style.display = 'none';
      displayElementM.style.display = 'none';
      displayElementL.style.display = 'block';
    } else {
      displayElementS.style.display = 'block';
      displayElementM.style.display = 'none';
      displayElementL.style.display = 'none';
    }
  });
};
export { initPriceSelected };
