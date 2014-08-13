
#  {log, sin, cos, tan} = Math
#  result = while i > 0

#jQuery.fn.clickoutside = function(callback) {
#var outside = 1, self = $(this);
#self.cb = callback;
#this.click(function() {
#outside = 0;
#});
#$(document).click(function() {
#  outside && self.cb();
#  outside = 1;
#});
#return $(this);
#}

$.widget "anta.productFilter",
  _create: ->
    @_initialize()
    @_disable()

    $(window).load =>
      @_enable()
      @_makeOperable()

  _initialize: ->
    @.ui =
      sections: @element.find ".filter-section"
      submit: @element.find(".filter-actions .do-apply")


  _makeOperable: ->
#      todo: automatic show ".all" if total count of items more then (grid) options visible items count
#      todo: (+ use overflow options height)
#      todo: assembly the filter on-the-fly

#      @this = @
#      that

    @_gridSelectorOnline()
    @ui.submit.bind "click", =>
      return true unless @options.submitHook
      @options.submitHook @

  _gridSelectorOnline: ->
    @ui.sections.each ->
#        todo: extract to "this.ui"
#        todo: polyfill is needed: $selector.find(":before")
#        - @.options.selectorArrowWidth / 2

      $trigger = $(this).find ".all"
      $selector = $(this).find ".grid-selector"

      return unless $trigger.length
      return $trigger.hide() unless $selector.length

      _close = (event) ->
        $selector.removeClass("-visible").hide()
#        $selector.unbind("clickoutside")

      $selector.css
        top: $trigger.offset().top - $selector.outerHeight() / 2 + $trigger.height() / 2 + "px"
        left: $trigger.offset().left + $trigger.width() + 40 + "px"

#      setTimeout ->
#        $selector.bind("clickoutside", _close)
#      , 100

      $selector.bind("clickoutside", _close)

      $selector.find(".box-close").bind "click", _close

      $trigger.bind "click", ->
        $selector.addClass("-visible").toggle()
        false

  _disable: (strict=false) ->
    this.element.find("input").prop("disabled", true)
    this.element.find(".filter-section .all").css(visibility: "hidden")
    this.element.find(".filter-actions .do-apply").hide()


  _enable: (strict=false) ->
    this.element.find("input").prop("disabled", false)
    this.element.find(".filter-section .all").css(visibility: "visible")
    this.element.find(".filter-actions .do-apply").show()

  value: (event) ->
    @element.find("input:checked")

