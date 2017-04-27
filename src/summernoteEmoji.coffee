$.extend $.summernote.options,
  sEmoji:
    icon:'<span class="note-current-emoji">😀</span> ',
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
          contents: sEmojiOptions.icon + ui.icon options.icons.caret, 'span'
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
