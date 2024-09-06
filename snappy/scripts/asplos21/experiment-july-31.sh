#! /usr/sh

block_size_list=(2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304 8388608 16777216)

#for block_size in "${block_size_list[@]}"
#do
#   for tasklets in {1..24}
#   do
#    #sudo python run_tests.py -t 1 -f dickens8MB -r 2304 2304 -i 64 -b ${block_size}  -k ${tasklets}
#    #sudo python run_tests.py -t 1 -f dickens16MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
#    #sudo python run_tests.py -t 1 -f dickens32MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
#    #sudo python run_tests.py -t 1 -f dickens64MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
#    #sudo python run_tests.py -t 1 -f dickens128MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
#    #sudo python run_tests.py -t 1 -f dickens256MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
#    #sudo python run_tests.py -t 1 -f dickens512MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
#    # sudo python run_tests.py -t 1 -f dickens1024MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
#   done
#done


for block_size in "${block_size_list[@]}"
do
   for tasklets in {1..24}
   do
    sudo python run_tests.py -t 1 -f nci1024MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
   done
done



for block_size in "${block_size_list[@]}"
do
   for tasklets in {1..24}
   do
    sudo python run_tests.py -t 1 -f nci512MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
   done
done



for block_size in "${block_size_list[@]}"
do
   for tasklets in {1..24}
   do
    sudo python run_tests.py -t 1 -f nci256MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
   done
done



for block_size in "${block_size_list[@]}"
do
   for tasklets in {1..24}
   do
    sudo python run_tests.py -t 1 -f nci128MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
   done
done


for block_size in "${block_size_list[@]}"
do
   for tasklets in {1..24}
   do
    sudo python run_tests.py -t 1 -f nci64MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
   done
done


for block_size in "${block_size_list[@]}"
do
   for tasklets in {1..24}
   do
    sudo python run_tests.py -t 1 -f nci32MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
   done
done


for block_size in "${block_size_list[@]}"
do
   for tasklets in {1..24}
   do
    sudo python run_tests.py -t 1 -f nci16MB -r 2304 2304 -i 64 -b ${block_size} -k ${tasklets}
   done
done


for block_size in "${block_size_list[@]}"
do
   for tasklets in {1..24}
   do
    sudo python run_tests.py -t 1 -f nci8MB -r 2304 2304 -i 64 -b ${block_size}  -k ${tasklets}
   done
done


sudo python generate_speedup_csv.py -r 2304 2304 -i 64 -f dickens8MB dickens16MB dickens32MB dickens64MB dickens128MB dickens256MB dickens512MB dickens1024MB mozilla8MB mozilla16MB mozilla32MB mozilla64MB mozilla128MB mozilla256MB mozilla512MB mozilla1024MB nci8MB nci16MB nci32MB nci64MB nci128MB nci256MB nci512MB nci1024MB sao8MB sao16MB sao32MB sao64MB sao128MB sao256MB sao512MB sao1024MB spamfile8MB spamfile16MB spamfile32MB spamfile64MB spamfile128MB spamfile256MB spamfile512MB spamfile1024MB xml8MB xml16MB xml32MB xml64MB xml128MB xml256MB xml512MB xml1024MB dickens2048MB dickens4096MB
sudo chown hamidkeb:hamidkeb ../../results/*
sudo chown hamidkeb:hamidkeb ../../results/
#python chart_fs_dpu_speedup.py -r ../../results/compression_speedup_dpu.csv -o output1
#python chart_fs_dpu_speedup_no_overhead.py -r ../../results/compression_speedup_dpu.csv -o output2

