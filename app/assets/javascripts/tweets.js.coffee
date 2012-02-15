# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

this.updateCharsRemaining = () ->
  chars_remaining = document.getElementById('chars_remaining')
  chars_remaining.innerHTML = 140 - document.tweetform.tweet.value.length

