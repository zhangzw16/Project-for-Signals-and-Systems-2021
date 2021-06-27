rootFolder="/Users/zhangzhenwei/Downloads/met" # !change this to your own path!

mkdir -p out

filter=""
suffix=""
loop=0
while IFS=' ' read -r movie time || [ -n "$time" ]; do
    filter="${filter}[$(($movie-1)):v]trim=${time},setpts=PTS-STARTPTS,fifo[v${loop}]; [$(($movie-1)):a]atrim=${time},asetpts=PTS-STARTPTS,afifo[a${loop}]; "
    suffix="${suffix}[v${loop}] [a${loop}] "
    loop=$(($loop+1))
done < input/input_time.txt
suffix="${suffix}concat=n=${loop}:v=1:a=1[outv][outa]"
filter="${filter}${suffix}"

# -------- filter example ---------
# filter="[0:v]trim=1:10,setpts=PTS-STARTPTS[v0]; \
#  [0:a]atrim=1:10,asetpts=PTS-STARTPTS[a0]; \
#  [0:v]trim=100:105,setpts=PTS-STARTPTS[v1]; \
#  [0:a]atrim=100:105,asetpts=PTS-STARTPTS[a1]; \
#  [v0] [a0] [v1] [a1] concat=n=2:v=1:a=1[outv][outa]"
# echo "$filter"

inputVideos=""
for i in {1..25}
do
    inputVideos="${inputVideos}-i ${rootFolder}/${i}.mp4 "
done
# echo "$inputVideos"

ffmpeg $inputVideos \
-filter_complex "$filter" \
-map "[outv]" -map "[outa]" out/output.mp4

ffmpeg -i out/output.mp4 -i "${rootFolder}/test.wav" \
-filter_complex "[0:a][1:a]amerge=inputs=2[a]" \
-map 0:v -map "[a]" -c:v copy -ac 2 -shortest out/output_bgm.mp4
