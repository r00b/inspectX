#= require jquery-2.1.3.min
#= require jquery_ujs
#= require bootstrap
#= require bootstrap-sprockets
#= require select2
#= require_tree .

$ ->
  ## Include Select2
  $('.select-picker').select2
    theme: 'bootstrap'