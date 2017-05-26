# summernoteEmoji

A simple emoji dropdown plugin for summernote editor

It inserts raw emojis, no images or icons.

### Usage

include lib/summernoteEmoji.js and add sEmoji to summernote toolbar:

$('.summernote').summernote({
    toolbar:[
        ['insert', ['sEmoji']]
    ]
});

### Options

```javascript
$.extend($.summernote.options, {
  sEmoji: {
    icon: '😀',
    tooltip: 'Insert Emoji',
    list: ['😀', '😃', '😂', '😊', '😉', '😋', '😎', '🙁', '😡', '😐', '😲', '😱', '😴', '🙄 ', '😈']
  }
});
```
- icon the default icon for the button
- tooltip text for the tooltip
- list A js array of emojis. The plugin will accept any string

### License

Released under the [MIT](https://opensource.org/licenses/MIT) license
