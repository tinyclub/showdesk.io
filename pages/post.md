---
title: 我的
tagline: 录制并分享我的视频
layout: page
group: navigation
highlight: true
permalink: /post/
order: 30
---

[桌面秀（Showdesk.io）][1] 是一个开源项目，致力于更便捷地分享技术学习和操作过程。

它提供了配套的桌面会话录制、回放和分享工具，从而可以轻松录制，即时分享。

## 录制与回放

基于 [pyvnc2swf][2]，我们添加了 noVNC 格式输出支持。

该工具已经集成进 [Showdesk.io][1] 代码仓库，安装和使用方式如下（请事先安装 x11vnc 和 git）：

    $ git clone https://github.com/tinyclub/showdesk.io
    $ cd showdesk.io
    $ tools/install.sh

安装后会在桌面创建两个快捷启动图标，一个为录制工具（noVNC REC），一个为播放器（noVNC Player）。

点击 `noVNC REC` 会自动打开本地 VNC 服务器并启动一个录制界面。可以通过菜单配置`File`（视频存放的文件名），`Title`，`Author`，`Category`，`Tags` 和 `Description` 等信息。

之后点击 "Start" 等到按钮变为绿色 "Stop" 后，即可开始录制，录制完成后点击 "Stop"，退出后即可通过 noVNC Player 进行回放，该播放器通过浏览器启动，进入后选择视频列表中最新的一个，点击 Play 即可。

也可分别通过命令行启动他们：

    $ tools/record.sh
    $ tools/play.sh

## 视频信息编辑

录制的视频默认存放在 `recordings/default/` 目录下，流媒体化后的格式为 `.slice*`，建议分享时选择该格式，可以节省流量并提高加载体验。如果录制的视频不大，也可以用 `.zb64`，这个是单一文件，也有其便利性。

为了更好地展示视频信息，建议做一定编辑，可以打开 `.zb64` 文件进行编辑，配置好 `Title`，`Author`，`Category`，`Tags` 和 `Description`：

    var VNC_frame_category = 'Linux 0.11';
    var VNC_frame_title = 'Linux 0.11 Lab Usage';
    var VNC_frame_author = 'Wu Zhangjin <wuzhangjin@gmail.com';
    var VNC_frame_tags = 'Linux 0.11, OS';
    var VNC_frame_desc = 'Do Linux 0.11 operating system experiments with Linux 0.11 Lab.';

另外，默认生成的文件名为创建时间，建议命名为更有意义的文件名，例如：

    $ ls recordings/default/2017-04-02/20170402062749.novnc*
    $ tools/rename.sh 20170402062749.novnc test-showdesk

编辑完成后需要执行如下命令进行更新：

    $ rm recordings/default/2017-04-02/test-showdesk.slice*
    $ tools/publish.sh

## 分享视频

有两种方式用于分享上述视频。

第一种是直接把录制好的视频文件（所有刚录制 `.slice*`）放到自己的 Web 服务器上，然后直接通过我们开发的在线播放器 [Vplayer.io][http://vplayer.io] 播放：

    http://vplayer.io?data=http://your-web-site/path/to/xxx.slice

另外一种是通过桌面秀（Showdesk.io）集中展示和分享，这个需要 Fork [Showdesk.io][4] 和视频数据库 [Vrecordings][12]。

接着先把视频数据上传到自己 Fork 的仓库中，并发 PR 到 [Vrecordings][11]。

    $ cd recordings/default/
    $ git add 2017-04-01/xxx.slice*
    $ git commit -s
    $ git remote add USER https://github.com/USER/vrecordings
    $ git push USER master

接着把会话和展示页面上传，并发 PR 到 [Showdesk.io][1]。

    $ git add sessions/*xxx*
    $ git add _post/*xxx*
    $ git commit -s
    $ git remote add USER https://github.com/USER/showdesk.io
    $ git push USER gh-pages

之后就可以通过会话页面或者视频展示页面进行访问，或者把会话页面嵌入到其他网站中。

会话页面的地址是一串 md5 码，可以在 `sessions/` 下的会话页面中找到 `permalink`，在它的前面追加上 `showdesk.io` 即可，例如：

    $ grep permalink sessions/2017-03-18-17-54-23-linux-0.11-lab.session.md
    permalink: /50bc346f53a19b4d1f813b428b0b7b49/

## 内嵌到博客中

也可以在 Showdesk.io 最终生成的视频展示页面中找到这样的内容，可以把它嵌入到包括博客在内的任何网站中：

    <iframe src="http://showdesk.io/50bc346f53a19b4d1f813b428b0b7b49/?f=1" width="100%" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" border="0" allowfullscreen></iframe>

如果要自适应视频大小，可以使用 [iframeresizer][5]，在网页中加入如下代码即可：

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

也可自行下载上述 [jquery][8] 和 [iframeResizer.min.js][6] 到网页所在服务器。

[1]: https://github.com/tinyclub/showdesk.io
[2]: https://github.com/tinyclub/pyvnc2swf
[3]: https://github.com/novnc/noVNC
[4]: https://github.com/tinyclub/showdesk.io#fork-destination-box
[5]: https://github.com/davidjbradshaw/iframe-resizer
[6]: https://raw.githubusercontent.com/davidjbradshaw/iframe-resizer/master/js/iframeResizer.min.js
[7]: https://github.com/tinyclub/cloud-ubuntu
[8]: https://code.jquery.com/jquery-1.10.1.min.js
[9]: http://vplayer.io
[11]: https://github.com/tinyclub/vrecordings
[12]: https://github.com/tinyclub/vrecordings#fork-destination-box
