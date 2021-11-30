let sizeGuide;
let getClassHidden;
let guideDesTailles;

const doToggle = (e) => {
  e.preventDefault();
    sizeGuide.classList.toggle('hidden');
  // if (getClassHidden) {
    // sizeGuide.classList.remove('hidden');
  // } else {
    // sizeGuide.classList.add('hidden')
  // }
}

const initModalSize = () => {
  sizeGuide = document.getElementById("image_guide_size");
  getClassHidden = document.getElementsByClassName("hidden");
  guideDesTailles = document.getElementById('guide-size');

  // if (sizeGuide) {
    // (function = (event) => {
      // sizeGuide.addEventListener('click', doToggle);
    // }):
  // } else {
    guideDesTailles.addEventListener('click', doToggle);
    // or
    sizeGuide.addEventListener('click', doToggle);
  // }
}

export { initModalSize }
