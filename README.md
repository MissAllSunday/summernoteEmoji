# summernoteEmoji

A simple emoji dropdown plugin for summernote editor

It inserts raw emojis, no images or icons.

### Usage

include lib/summernoteEmoji.js and add sEmoji to summernote toolbar:

['insert', ['sEmoji']],

### Options

```js
$.extend($.summernote.options, {
  sEmoji: {
	tooltip: 'Insert Emoji',
	list: ['😀', '😃', '😂', '😊', '😉', '😋', '😎', '🙁', '😡', '😐', '😲', '😱', '😴', '🙄 ', '😈']
  }
});
```
