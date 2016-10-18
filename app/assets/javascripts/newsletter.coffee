# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# JavaScript Document

$ ->
  #-- Add loaded class after delay
  setTimeout (->
    $('body').addClass 'delayloaded'
    return
  ), 2000
  #-- Show / Hide About
  $('.btn-about').on 'click', (e) ->
    e.preventDefault()
    $('body').addClass 'showabout'
    return
  $('.about .btn-close').on 'click', (e) ->
    e.preventDefault()
    $('body').removeClass 'showabout'
    return
  #-- Date picker
  if $('.btn-pickdate').length != 0
    $(this).on 'click', (e) ->
      e.preventDefault()
      return
    $('.btn-pickdate').datepicker
      orientation: 'bottom auto'
      autoclose: true
      format: 'M/dd/yyyy'
      disableTouchKeyboard: true
    $('.btn-pickdate-alt').on 'click', (e) ->
      e.preventDefault()
      $('.btn-pickdate').datepicker 'show'
      return
    #-- Scroll to the top of the page and open calendar
    $('.btn-prevdays').on 'click', (e) ->
      e.preventDefault()
      $('html, body').animate { scrollTop: 0 }, 1000, ->
        $('.btn-pickdate').datepicker 'show'
        return
      return
  #-- Newsletter btn state change

  ###
  $('.btn-newslettermore').on('click', function(e){
    $(this).toggleClass('open');
  }); 
  ###

  $('.newsletter').on 'click', (e) ->
    if $(e.target).hasClass('btn-newslettermore')
      $('.btn-newslettermore').toggleClass 'open'
      console.log 'button'
    else if $(e.target).parents('.form-newsletter').length == 0
      $('#newsletter-plus').collapse 'show'
      $('.btn-newslettermore').addClass 'open'
      console.log 'other'
    return
  #-- Newsletter subscribe Thank you message
  $('.btn-subscribe').on 'click', (e) ->
    e.preventDefault()
    $('.newsletter .twocols, .btn-newslettermore, #newsletter-plus').fadeOut ->
      $('.newsletter-thankyou').fadeIn()
      return
    return
  #-- News Blocks slider
  if $('.newslider').length != 0
    $('.newslider').owlCarousel
      singleItem: true
      mouseDrag: false
      touchDrag: true
      pagination: false
      slideSpeed: 800
      autoHeight: true
      rewindNav: false
      afterInit: ->
        @jumpTo 1
        return
    slider = $('.newslider').data('owlCarousel')
    #- Slider navigation - change dates
    $('.btn-calnext').on 'click', (e) ->
      e.preventDefault()
      if !$(this).hasClass('disabled')
        slider.next()
      return
    $('.btn-calprev').on 'click', (e) ->
      e.preventDefault()
      if !$(this).hasClass('disabled')
        slider.prev()
      return
    #-- Navigate slider with keys
    $(document).keyup (e) ->
      key = e.which
      if key == 39
        slider.next()
      if key == 37
        slider.prev()
      return
  return
