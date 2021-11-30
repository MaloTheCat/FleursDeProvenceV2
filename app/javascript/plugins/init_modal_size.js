let sizeGuide;
let getClassHidden;
let guideDesTailles;

const doToggle = (e) => {
  e.preventDefault();
  sizeGuide.classList.toggle('hidden');
}

const initModalSize = () => {
  sizeGuide = document.getElementById("image_guide_size");
  getClassHidden = document.getElementsByClassName("hidden");
  guideDesTailles = document.getElementById('guide-size');
  guideDesTailles.addEventListener('click', doToggle);
  sizeGuide.addEventListener('click', doToggle);
}

export { initModalSize }
