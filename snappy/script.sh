#! /usr/sh

dataset_path="/data/hamid/snappy-dataset"

data1="${dataset_path}/dickens"
data2="${dataset_path}/mozilla"
data3="${dataset_path}/nci"
data4="${dataset_path}/sao"
data5="${dataset_path}/spamfile"
data6="${dataset_path}/xml"

size1=8
size2=16
size3=32
size4=64
size5=128
size6=256
size7=512
size8=1024



application="$HOME/pim-compression/snappy/dpu_snappy"
#results_dir="$HOME/snappy-roofline-results/july26"





#data_arr=("$data1" "$data2" "$data3" "$data4" "$data5" "$data6")
#size_arr=($size1 $size2 $size3 $size4 $size5 $size6 $size7 $size8)
#
## Nested for loop
#for data in "${data_arr[@]}"; do
#  for size in "${size_arr[@]}"; do
#    #echo "Processing $data with size $size"
#    path="${data}${size}MB.txt"
#    $application -c -i $path
#  done
#done


data_arr=("$data1")
size_arr=($size1 $size2 $size3 $size4 $size5 $size6 $size7 $size8)
block_arr=(2048 4096 8192 16384 32768 65536)

# Nested for loop
for data in "${data_arr[@]}"; do
  for size in "${size_arr[@]}"; do
    for block in "${block_arr[@]}"; do
      echo "Processing $data with size $size and block size $block"
      path="${data}${size}MB.txt"
      $application -c -i $path -b $block
    done
  done
done
