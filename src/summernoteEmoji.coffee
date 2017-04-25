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
