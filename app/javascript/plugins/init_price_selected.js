const initPriceSelected = () => {
// -----------------
// WORKS FINE
  // let size = document.getElementById('size');
  // size.addEventListener('change', (event) => {
  //   console.log(event.target.value);
  //   if (event.target.value == "M") {
  //     console.log("it's a 'M' value");
  //   } else if (event.target.value == "L") {
  //     console.log("it's a 'L' value");
  //   } else {
  //     console.log("It's a 'S' value");
  //   }
  // });
// -------------------
  // PERFECT OK

  let size = document.getElementById('size');
  size.addEventListener('change', (event) => {
    document.getElementById("price").innerText = `${event.target.value}`;
  });
};
export { initPriceSelected };
