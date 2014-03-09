$.fn.selectRange = (start, end) ->
  if !end
    end = start
  @each ->
    if @setSelectionRange
      @focus()
      @setSelectionRange start, end
    else if @createTextRange
      range = @createTextRange()
      range.collapse true
      range.moveEnd 'character', end
      range.moveStart 'character', start
      range.select()

$.fn.setCursorPosition = (position) ->
  @selectRange(position, position)

$.fn.focusAtEnd = ->
  @each ->
    elem = $(this)
    elem.setCursorPosition elem.val().length
