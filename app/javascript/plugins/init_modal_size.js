let sizeGuide;

const doToggle = (e) => {
  e.preventDefault();
  // sizeGuide.classList.remove('hidden');
  sizeGuide.classList.toggle('hidden')
}

const initModalSize = () => {
  sizeGuide = document.getElementById("image_guide_size");
  if (sizeGuide) {
    // (function = (event) => {
      sizeGuide.addEventListener('click', doToggle);
      // event.preventDefault();
    // }):
    // console.log('done');
  }
}

export { initModalSize }
