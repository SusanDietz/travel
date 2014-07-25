jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

$(document).ready ->
  $(".points-list li").mouseenter ->
    $(this).find(".options").show()
    return
  $(".points-list li").mouseleave ->
    $(this).find(".options").hide()
    return

  return
