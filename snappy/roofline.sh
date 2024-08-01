#! /usr/sh

dataset_path="/data/hamid/snappy-dataset/"

data1="${dataset_path}/dickens"
data2="${dataset_path}/mozilla"
data3="${dataset_path}/nci"
data4="${dataset_path}/sao"
data5="${dataset_path}/spamfil"
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
results_dir="$HOME/snappy-roofline-results/july29/"





#file_arr=("dickens" "mozilla" "nci" "sao" "spamfile" "xml")
file_arr=("dickens")
#size_arr=(8 16 32 64 128 256 512  1024)
size_arr=(1024)
#block_arr=(32768 65536 131072 262144 524288 1048576 2097152 4194304 8388608 16777216)
block_arr=(268435456)

# Nested for loop
for file in "${file_arr[@]}"; do
  for size in "${size_arr[@]}"; do
    for block in "${block_arr[@]}"; do
      path="${dataset_path}${file}${size}MB.txt"
      advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}${file}${size}-${block}"  --app-working-dir=$HOME/pim-compression/snappy/ -- $application -c -i $path -b $block
    done
  done
done


#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l1}-${distance}-${pairs_count}Pairs"  --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path1} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l2}-${distance}-${pairs_count}Pairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path2} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l3}-${distance}-${pairs_count}Pairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path3} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l4}-${distance}-${pairs_count}Pairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path4} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l5}-${distance}-${pairs_count}Pairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path5} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l6}-${distance}-1MPairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path6} -a gap-affine-wfa-adaptive -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l7}-${distance}-1MPairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path7} -a gap-affine-wfa-adaptive -g "0,3,4,1"



