
# Showdesk.io - Record Easily, Share Quickly

[Showdesk.io][0] is a [Showterm.io][1]-like tool, which can record and share the learning procedures gracefully.

The difference is that showterm.io is only for Terminal/CLI with easier copy-paste, but showdesk.io is for desktop/GUI with more scenes besides Terminal.

Showdesk is based on two famous open source projects, one is [noVNC][2], another is [pyvnc2swf][3].

## Fork & Download

[Fork][4] our github project: <https://github.com/tinyclub/showdesk.io> and clone it:

    $ git clone https://github.com/Your-Github-Account/showdesk.io
    $ cd showdesk.io

Forking is required for later sharing of recorded VNC sessions via sending 'Pull Request'.

If only use locally, just clone the official one:

    $ git clone https://github.com/tinyclub/showdesk.io
    $ cd showdesk.io

## Record & Replay

[pyvnc2swf][5] is a fork with noVNC format support, it is also integrated into Showdesk for easier using.

### Install

Clone the dependent tools and install the shortcuts:

    $ tools/install.sh

* Recorder

  <img width="25px" src="https://raw.githubusercontent.com/tinyclub/pyvnc2swf/master/icons/recorder.png"/>

* Player

  <img width="25px" src="https://raw.githubusercontent.com/tinyclub/pyvnc2swf/master/icons/player.png"/>

### Record

Click the `noVNC REC` button on Desktop or issue the following command:

    $ tools/record.sh

The sessions will be saved to `recordings/default/`. Before pressing the `start` button, please configure the vnc server, port, password and also the session title, author, category, tags and description.

### Replay

Click the `noVNC Player` button on Desktop or issue the following command:

    $ tools/play.sh

## Share

To share the VNC sessions, simply generate the session and post pages for publishing:

    $ tools/publish.sh

Commit the new generated data in `sessions/`, `_posts/` and `recordings/default/` into your own repo and then send a 'Pull Request' to [showdesk.io][7].

If want to embed the session in your own web page, just check the `permalink` address in `sessions/`, for example:

    $ grep permalink sessions/*linux-0.11-lab*
    permalink: /50bc346f53a19b4d1f813b428b0b7b49/

And then, embed it with:

    <iframe src="http://showdesk.io/50bc346f53a19b4d1f813b428b0b7b49/?f=1" width="100%" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" border="0" allowfullscreen></iframe>

To auto resize the video, use [iframeresizer][8]:

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="https://raw.githubusercontent.com/davidjbradshaw/iframe-resizer/master/js/iframeResizer.min.js"></script>
    <script>
      function resize_iframe() {
        iFrameResize({
          log: false,
          autoResize: true,
          interval: -1,
          minHeight: 300,
          heightCalculationMethod: "lowestElement",
        });
      }

      $(document).ready(function () {
        resize_iframe();
      });
    </script>

[0]: http://showdesk.io
[1]: http://showterm.io
[2]: https://github.com/novnc/noVNC
[3]: http://www.unixuser.org/~euske/vnc2swf/pyvnc2swf.html
[4]: https://github.com/tinyclub/showdesk.io#fork-destination-box
[5]: https://github.com/tinyclub/pyvnc2swf
[7]: https://github.com/tinyclub/showdesk.io
[8]: https://github.com/davidjbradshaw/iframe-resizer
