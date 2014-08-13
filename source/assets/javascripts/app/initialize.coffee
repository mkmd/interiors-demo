#if ($.isFunction(obj.getAttribute)) {
#  prop = obj.getAttribute(str);
#}

# todo: patch: line 1534
# todo: use solution: http://jquery.malsup.com/cycle2/demo/pager.php
# todo: use for carousel sliding: https://github.com/malsup/cycle2/issues/106
# todo: refactor: use scheme with triggering event "dom.changed"

$ ->
  initializePhotoCarousel = ->
    $owner = $(this).parent().parent()
    $(this).cycle
      log:              false
      pagerEvent:       "click.cycle mouseover"
      fx:               "fade"
      speed:            100,
      timeout:          0
#      manualSpeed: 500
      pauseOnHover:     true
      paused:           true
      pager:            $owner.find(".photo-pagination")
      pagerTemplate:    "<li class='photo-preview'><img src='{{src}}' /></li>"
      pagerActiveClass: "-active"
      slides:           ".photo-slide"
      slideClass:       "photo-slide"
      slideActiveClass: "-active"

  initializeCarousel = ->
    # todo: use "overlay"-feature
    $owner = $(this).parent()
    $(this).cycle
      log:              false
      pagerEvent:       "click.cycle mouseover"
      fx:               "fade"
      speed:            500
      timeout:          5000
      manualSpeed:      500
      pauseOnHover:     true
      pager:            $owner.find(".carousel-pagination")
      pagerTemplate:    "<li class='carousel-pagination-item'></li>"
      pagerActiveClass: "-active"
      prev:             $owner.find(".carousel-prev")
      next:             $owner.find(".carousel-next")
      slides:           ".carousel-slide"
      slideClass:       "carousel-slide"
      slideActiveClass: "-active"

  initializeSliderCarousel = ->
    $owner = $(this).parent()
    $(this).cycle
      log:              false
#      pagerEvent: "click.cycle"
      fx:               "scrollHorz"
      speed:            500
      timeout:          0
      manualSpeed:      500
      pauseOnHover:     true
      paused:           true
#      pager: $owner.find(".carousel-pagination")
#      pagerTemplate: "<li class='carousel-pagination-item'></li>"
      prev:             $owner.find(".pagination .prev")
      next:             $owner.find(".pagination .next")
      slides:           ".slider-slide"
      slideClass:       "slider-slide"
      slideActiveClass: "-active"

  initializeProductPreview = ($list) ->

    #  $(".product-item .product-preview").click (event) ->
#    event.preventDefault()
#    $.fancybox.open [],

#    class="fancybox.ajax"
#    data-fancybox-type="ajax" data-fancybox-href="/product-preview/"
#    data-fancybox-group="product-list" rel="product-list"

#    $(this).fancybox

    group = $list.map (index, item) ->
      href: $(item).data("url")

    executeDialog = ->
      $.fancybox.open group,
        type: "ajax"
  #      href:       $(this).data("url")
  #      content: "content"
        ajax:       {dataType: "html", headers: "X-fancyBox": true}
        live: true
        padding:    30
  #      maxWidth:  960
  #      maxHeight: 700
  #      minWidth:   640
  #      minHeight: 580
  #      width:     '70%'
  #      height:    "95%"
        minWidth:  640
        maxWidth:  640
        minHeight:   580
        width:  640
#        height:   580
        arrows: true
        loop: true
      #    fitToView: true
        autoSize:   true
        autoResize: true
        autoCenter: true
        margin      : [20, 60, 20, 60]
      #  closeBtn: false
      #    modal: true
        closeClick: false
        openEffect:  'fade'
        closeEffect: 'elastic'
        nextEffect  : 'none'
        prevEffect  : 'none'
        afterLoad:  (upcoming, current) ->
  #        console.log upcoming, current
  #        console.log $(this.content).find(".product-preview-cart").length
  #        console.log $(this.content).find(".product-photo").length
  #        console.log this.content

          setTimeout ->
            $(".product-preview-cart .photo-carousel").each ->
              initializePhotoCarousel.call this

            $(".product-preview-cart .slider-carousel").each ->
              initializeSliderCarousel.call this
          , 200

          true

    $list.bind "click", executeDialog

  $('.selectbox').select2
    minimumResultsForSearch: -1

  #  $(document).on "cycle-bootstrap", (event, opts, API) ->
  #    console.log arguments

  $(".photo-carousel").each ->
    initializePhotoCarousel.call this

  $(".carousel").each ->
    initializeCarousel.call this

  $(".slider-carousel").each ->
    initializeSliderCarousel.call this

  $list = $(".product-item .product-preview")
  # todo: remove: only for demo goals
  $list.each -> $(this).attr("data-fancybox-group", "product-list").attr("rel", "product-list")

  initializeProductPreview $list

  $(".numberbox").numberbox(min: 1, max: 99)
  $(".numberbox").inputmask(mask: "99", greedy: false, placeholder: "")

  if $("#sign-in-popup").length
    $("#sign-in").fancybox
#      href: "#sign-in-popup"
#      content: $("#sign-in-popup").html()
      width:  400
      minWidth:  400
      maxWidth:  400
      height:   380 # 400
      minHeight:   380
      maxHeight:   380
      autoSize:   true
      autoResize: true
      autoCenter: true
      closeClick: false
      openEffect:  "fade"
      closeEffect: "elastic"
#      afterLoad: ->
#        @content = $("#sign-in-popup").html()