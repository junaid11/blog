# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(() ->
  token = $('meta[name="csrf-token"]').attr('content')
  $("#wysiwyg").froalaEditor({
    inlineMode: false
    imageUploadURL: '/upload_image'
    imageUploadMethod: 'POST'
    #imageUploadParams: {
     # header: {
     #   token: token
     # }
     # token: token
      #Token: token
    #}
    #imageUpload:
     # 'X-Requested-With': "XMLHttpRequest"
      #'X-CSRF-Token': token
    #'Content-Type': 'application/json'
    #'Accept': 'application/json'
    credentials: 'same-origin'
    heightMin: '300px'
    toolbarButtons: [
      'bold'
      'italic'
      'underline'
      'fontFamily'
      'fontSize'
      'paragraphFormat'
      'align'
      'formatOL'
      'formatUL'
      'insertLink'
      'insertImage'
    ]
   }
  )
  $(".selection").mouseup(() ->
    txt = undefined
    txt = ''
    if window.getSelection
      txt = window.getSelection()
    else if document.getSelection
      txt = document.getSelection()
    else if document.selection
      txt = document.selection.createRange().text
    if !txt.isCollapsed
      $('.show-toggle').show 'slow'
      $('#selected-data').val txt
  )
)
