# Project-for-Signals-and-Systems-2021
清华大学谷源涛老师《信号与系统》大作业2021

关于大作业内容的具体说明参见[作业说明（初稿）](Project2021.pdf)（**作业说明以网络学堂发布版本为准**）

## Installation
- Clone this repo
- Make sure you have FFmpeg in your computer. Simply run `ffmpeg -version`. 
If FFmpeg is not installed, you can follow the instructions [here](https://ffmpeg.org/download.html). Or if you have [Homebrew](https://brew.sh/) in your MacOS, simply `brew install ffmpeg`.

## Usage
* For MacOS and Linux

    - 修改视频合并顺序。在input.txt中按顺序输入需要合并的视频片段名称。例如，想要按照顺序合并`3.mp4`,`1.mp4`,`8.mp4`，此时input.txt中的内容应该为

        ``` text
        3
        1
        8
        ```

    - 修改视频地址路径。在`merge.sh`第一行中修改视频以及音频文件夹路径（该路径应该包括所有的视频序列以及`test.wav`背景音乐）。

    - 运行脚本`merge.sh`。

        ```
        sh merge.sh
        ```
      会生成两个文件，`result.mp4`是合并后的视频文件，`result_bgm.mp4`是合并以及添加BGM后的视频文件。
        
* For Windows

    - TODO...


## Acknowledgement
- [FFmpeg](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwi-s5SmupHwAhXIFogKHclNCNAQFjAAegQIBxAD&url=https%3A%2F%2Fwww.ffmpeg.org%2F&usg=AOvVaw09zXstjq6AgcEKkXkTNIzA)
- [How to add a new audio (not mixing) into a video using ffmpeg?](https://stackoverflow.com/questions/11779490/how-to-add-a-new-audio-not-mixing-into-a-video-using-ffmpeg/11783474#11783474)
- [FFmpeg split video and merge back](https://superuser.com/questions/1229945/ffmpeg-split-video-and-merge-back)
- [Buffer Queue Overflow](https://superuser.com/questions/1135095/ffmpeg-buffer-queue-overflow-error-appears-when-adding-audio-with-amix-to-overl)
