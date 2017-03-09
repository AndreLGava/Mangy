ready = ->
  jQuery ->
    if $('#sortable').length > 0
      table_width = $('#sortable').width()
      cells = $('.table').find('tr')[0].cells.length
      desired_width = table_width / cells + 'px'
      $('.table td').css('width', desired_width)

      $('#sortable').sortable(
        axis: 'y'
        items: '.item'
        cursor: 'move'

        sort: (e, ui) ->
          ui.item.addClass('active-item-shadow')
        stop: (e, ui) ->
          ui.item.removeClass('active-item-shadow')
          # highlight the row on drop to indicate an update
          ui.item.children('td').effect('highlight', {}, 1000)
        update: (e, ui) ->
          item_id = ui.item.data('item-id')
          console.log(item_id)
          position = ui.item.index() # this will not work with paginated items, as the index is zero on every page
          $.ajax(
            type: 'POST'
            url: '/tests/update_row_order'
            dataType: 'json'
            data: { test: {test_id: item_id, row_order_position: position } }
          )
      )

$(document).ready(ready)
$(document).on('page:load', ready)

$(document).on 'page:receive', ->
  tinymce.remove()

$(document).on "ready page:load", ->
  tinyMCE.init
    selector: 'textarea.form-control'
    theme: 'modern'
    plugins: [
      'advlist autolink lists link image charmap print preview hr anchor pagebreak'
      'searchreplace wordcount visualblocks visualchars code fullscreen'
      'insertdatetime media nonbreaking save table contextmenu directionality'
      'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
    ]
    toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview | forecolor backcolor | codesample'
    image_advtab: true
    templates: [
      {
        title: 'Test template 1'
        content: 'Test 1'
      }
      {
        title: 'Test template 2'
        content: 'Test 2'
      }
    ]
    content_css: [
      '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i'
      '//www.tinymce.com/css/codepen.min.css'
    ]

    $(document).ready ->
      $('select').not('select[multiple]').select2
        theme: 'bootstrap'
        allowClear: true
        cache: true
        autocomplete: true
        width: '100%'
      return
      
