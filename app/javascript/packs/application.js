// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


require("bootstrap")
import "../stylesheets/application";
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "./modernizr-3.5.0.min"
import "./popper.min"
import "./jquery.slicknav.min"
import "./owl.carousel.min"
import "./slick.min"
import "./wow.min"
import "./animated.headline"
import "./jquery.magnific-popup"
import "./jquery.scrollUp.min"
import "./jquery.nice-select.min"
import "./jquery.sticky"
import "./contact"
import "./jquery.form"
import "./jquery.validate.min"
import "./mail-script"
import "./jquery.ajaxchimp.min"
import "./plugins"
import "./main"
