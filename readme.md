# jquery.polyClip

Adds a simple polygonal mask around images. The mask expands on hover and collapses afterwards.

![DEMO](https://raw.github.com/alexdeloy/polyclip/master/demo.gif)

## Usage

    $("section img").polyClip();

Add a transition to your CSS to make things look nicer:

    section img
        transition: all 0.25s

## Options

| option | description | default value |
| ------ | ----------- | ------------- |
| horizontalOffset | the horizontal offset in px or percent | 15 |
| verticalOffset | the vertical offset in px or percent | 15 |
| pixels | whether to use pixel or percent | true |
| hover | whether to show the hover effect | true |
