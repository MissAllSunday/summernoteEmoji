###
 * @package summernoteEmoji.js
 * @version 1.0
 * @author Jessica González <suki@missallsunday.com>
 * @copyright Copyright (c) 2017, Jessica González
 * @license https://opensource.org/licenses/MIT MIT
###

((factory) ->
  if typeof define == 'function' and define.amd
    define [ 'jquery' ], factory
  else if typeof module is 'object' and module.exports
    module.exports = factory(require('jquery'))
  else
    factory window.jQuery
  return
) ($) ->

  $.extend $.summernote.options,
    sEmoji:
      icon: '😀'
      tooltip:'Insert Emoji'
      list:['😀','😃','😂','😊','😉','😋','😎','🙁','😡','😐','😲','😱','😴','🙄 ','😈']

  $.extend $.summernote.plugins,
    'sEmoji' : (context) ->
      ui = $.summernote.ui
      options = context.options
      sEmojiOptions = options.sEmoji

      context.memo 'button.sEmoji', () ->
        buttonIcon = if sEmojiOptions.icon then sEmojiOptions.icon else sEmojiOptions.list[0]
        emojiButton = ui.buttonGroup [
          ui.button
            className:'dropdown-toggle'
            contents: "<span class='note-current-emoji'>#{buttonIcon}</span>"
            tooltip: sEmojiOptions.tooltip,
            data:
              toggle: 'dropdown'
          ui.dropdownCheck
            className: 'dropdown-emoji'
            items: sEmojiOptions.list
            template: (item) ->
              item
            callback: ($dropdown) ->
              $dropdown.find 'a'
                .each ->
                  selfButton = $ this
                  selfButton
                    .on 'click', (e) ->
                      e.preventDefault()
                      context.invoke 'editor.restoreRange'
                      context.invoke 'editor.focus'
                      context.invoke 'editor.insertText', selfButton.text()
                      false
                return
        ]
        emojiButton.render()
