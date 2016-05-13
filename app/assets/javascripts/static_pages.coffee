# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

$('#reservation_party_size_1').click ->
  $('.invitee').show()
  $('.companion').hide()
  $('.reached-at').text 'I can be reached at'
  return
$('#reservation_party_size_2').click ->
  $('.invitee').show()
  $('.companion').show()
  $('.reached-at').text 'We can be reached at'
  return
$(window).load ->
  $('.invitee').hide()
  $('.companion').hide()
  return