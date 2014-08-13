
# todo: prevent selection on dbl.click
#function clearSelection() {
#  if(document.selection && document.selection.empty) {
#  document.selection.empty();
#} else if(window.getSelection) {
#var sel = window.getSelection();
#  sel.removeAllRanges();
#}
#}

#span.no_selection {
#    -webkit-user-select: none; /* webkit (safari, chrome) browsers */
#-moz-user-select: none; /* mozilla browsers */
#-khtml-user-select: none; /* webkit (konqueror) browsers */
#-ms-user-select: none; /* IE10+ */
#}

$.widget "anta.numberbox",
  _create: ->
    @_createUpDownButtons()

  _createUpDownButtons: ->
    $element = $(this.element).clone()
    $holder = $ "<div class=\"numberbox-holder\"/>"
    $up = $ "<i class=\"numberbox-up\"></i>"
    $down = $ "<i class=\"numberbox-down\"></i>"
    $holder.append $down
    $holder.append $element
    $holder.append $up

    $(this.element).replaceWith($holder)

    $down.bind "click", =>
      value = parseInt($element.val())
      return if value <= @options.min
      $element.val parseInt($element.val()) - 1

    $up.bind "click", =>
      value = parseInt($element.val())
      return if value >= @options.max
      $element.val value + 1
