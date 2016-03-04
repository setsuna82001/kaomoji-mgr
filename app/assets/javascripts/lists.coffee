$ ->
#==========================================================
  $(window).on 'click', (event)->
    target = $(event.target)
    unless target.hasClass 'zcopy'
      return
    
    offset = target.offset()
    $('<div>')
      .text('copied!')
      .attr('id', 'balloon-left')
      .css('top',  offset.top  - 2)
      .css('left', offset.left + 50)
      .appendTo('body');
# http://zxcvbnmnbvcxz.com/demonstration/pure-css3-balloons.php
    
#==========================================================
    