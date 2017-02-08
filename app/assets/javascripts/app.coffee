


$(document).on "turbolinks:load", ->
  navBounding = ''
  nav = document.querySelectorAll('header.nav')
  $nav = $('nav.navbar')
  $(window).scroll ->
    navBounding = nav[0].getBoundingClientRect()
    if navBounding.top <= 0
      $nav.addClass 'navbar-fixed-top'
    else
      $nav.removeClass 'navbar-fixed-top'
    return