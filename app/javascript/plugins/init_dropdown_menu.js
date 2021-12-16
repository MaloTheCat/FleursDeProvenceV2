let burgerBtn;
let getClassHidden;
let navList;

const doToggle = (e) => {
  e.preventDefault();
  navList.classList.toggle('hidden');
}

const initDropdownMenu = () => {
  burgerBtn = document.getElementById('burger-leaf');
  getClassHidden = document.getElementsByClassName("hidden");
  navList = document.getElementById('mobile-nav-list');
  burgerBtn.addEventListener('click', doToggle);
}

export { initDropdownMenu };
