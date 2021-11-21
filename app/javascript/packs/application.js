// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("jquery")
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '../src/main'
import '../src/canvasjs.min'
import jquery from 'jquery';
import 'bootstrap'
import "@fortawesome/fontawesome-free/css/all"
import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
library.add(fas)

window.$ = window.jQuery = window.jquery = jquery;

dom.watch()
Rails.start()
ActiveStorage.start()
