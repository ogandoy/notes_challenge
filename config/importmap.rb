# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin '@fortawesome/fontawesome-free', to: 'https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.0.0-beta3/js/all.min.js'
pin_all_from "app/javascript/controllers", under: "controllers"
