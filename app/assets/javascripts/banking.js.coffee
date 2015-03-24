$ ->
  $('[data-contract]').on 'change',(ev) =>
    key = $(ev.target).val()
    price = $('.futures').data('dependencies')[key]
    $('[data-price]').val(price)

  $('[data-item]').on 'change',(ev) =>
    key = $(ev.target).val()
    price = $('.insurance').data('dependencies')[key]
    $('[data-itemprice]').val(price)

