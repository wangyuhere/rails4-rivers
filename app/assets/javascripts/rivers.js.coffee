$ ->

  $pearls = $('#pearls')
  $pearls.imagesLoaded ->
    $('.river-pearls .loading').hide()
    $pearls.show()
    $pearls.masonry {
      gutter: 20
      itemSelector: '.pearl'
    }

  riverID = $pearls.data('id')

  fetchPearls = ->
    lastPearlID = $('.pearl').first().data('id')
    $.ajax(
      url: "/rivers/#{riverID}/fetch?last_pearl_id=#{lastPearlID}"
    ).done (data) ->
      return if data.pearls.length == 0
      return if data.error

      # prepend all new pearls and relayout
      html = $ (p.html for p in data.pearls).join('')
      $pearls.prepend(html).masonry 'reloadItems'

    setTimeout fetchPearls, 20000

  if $pearls.length > 0
    setTimeout fetchPearls, 20000

  # test the effect of prepend pearl
  $('.js-add').click ->
    el = $('.pearl').first().clone()
    $pearls.prepend(el).masonry('prepended', el)
