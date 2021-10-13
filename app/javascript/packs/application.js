// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
require("turbolinks").start()
require("channels")

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import { initMapbox } from '../plugins/init_mapbox';
import { initPriceSelected } from '../plugins/init_price_selected';
import "channels"

// Turbolinks.start()

document.addEventListener('turbolinks:load', () => {
  // Rails.start();
  initMapbox();
  initPriceSelected();
})
