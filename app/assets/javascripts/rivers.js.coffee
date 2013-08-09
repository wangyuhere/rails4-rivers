$ ->
  $pearls = $('#pearls')
  $pearls.imagesLoaded ->
    $('.river-pearls .loading').hide()
    $pearls.show()
    $pearls.masonry {
      gutter: 20
      itemSelector: '.pearl'
    }