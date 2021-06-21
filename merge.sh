rootFolder="/Users/zhangzhenwei/Downloads/met" # !change this to your own path!

rm videos.txt
touch videos.txt
while IFS= read -r line || [ -n "$line" ]; do
    echo "file ${rootFolder}/${line}.mp4" >> videos.txt
done < input.txt

ffmpeg -f concat -safe 0 -i videos.txt -vcodec copy -acodec copy result.mp4

ffmpeg -i "result.mp4" -i "${rootFolder}/test.wav" \
-filter_complex "[0:a][1:a]amerge=inputs=2[a]" \
-map 0:v -map "[a]" -c:v copy -ac 2 -shortest result_bgm.mp4