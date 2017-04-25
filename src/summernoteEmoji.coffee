$ ->
  if $.summernote is true
    $.extend $.summernote.options,
      sEmoji:
        icon:'<i class="note-icon-pencil"/>',
        list: ['😀','😃','😂','😊','😉','😋','😎','🙁','😡','😐','😲','😱','😴','🙄 ','😈']

    $.extend $.summernote.plugins,
      'sEmoji' : (context) =>
        ui = $.summernote.ui
        options = context.options,
        lang = options.langInfo

        context.memo 'button.sEmoji', () ->
          emojiButton = ui.buttonGroup [
            ui.dropdown
              className:'dropdown-style'
              contents: $.summernote.options.sEmoji.list
              callback: ($dropdown) ->
                # find and insert the emoji
          ]
          emojiButton.render()
          return emojiButton
