$.extend $.summernote.options,
  sEmoji:
    tooltip:'Insert Emoji',
    list:['😀','😃','😂','😊','😉','😋','😎','🙁','😡','😐','😲','😱','😴','🙄 ','😈']

$.extend $.summernote.plugins,
  'sEmoji' : (context) ->
    ui = $.summernote.ui
    options = context.options
    sEmojiOptions = options.sEmoji

    context.memo 'button.sEmoji', () ->
      emojiButton = ui.buttonGroup [
        ui.button
          className:'dropdown-toggle'
          contents: "<span class='note-current-emoji'>#{sEmojiOptions.list[0]}</span> " + ui.icon options.icons.caret, 'span'
          tooltip: sEmojiOptions.tooltip,
            data:
              toggle: 'dropdown'
        ui.dropdownCheck
          className: 'dropdown-emoji'
          items: sEmojiOptions.list
          template: (item) ->
            item
          callback: ($dropdown) ->
            $dropdown.find('a').each ->
              $(this).on 'click', (e) ->
                e.preventDefault()
                context.invoke 'editor.restoreRange'
                context.invoke 'editor.focus'
                context.invoke 'editor.insertText', @textContent
                false
              return
      ]
      emojiButton.render()
