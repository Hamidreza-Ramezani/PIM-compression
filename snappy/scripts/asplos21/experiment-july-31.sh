#! /usr/sh

#sudo python run_tests.py -t 1 -f dickens8MB -r 64 64 -i 64
#sudo python run_tests.py -t 1 -f dickens16MB -r 64 64 -i 64
#sudo python run_tests.py -t 1 -f dickens32MB -r 64 64 -i 64
#sudo python run_tests.py -t 1 -f dickens64MB -r 128 128 -i 64
#sudo python run_tests.py -t 1 -f dickens128MB -r 256 256 -i 64
#sudo python run_tests.py -t 1 -f dickens256MB -r 320 320 -i 64
#sudo python run_tests.py -t 1 -f dickens512MB -r 384 384 -i 64
#sudo python run_tests.py -t 1 -f dickens1024MB -r 576 576 -i 64
#




#sudo python generate_speedup_csv.py -r 2304 2304 -i 64 -f dickens8MB dickens16MB dickens32MB dickens64MB dickens128MB dickens256MB dickens512MB dickens1024MB mozilla8MB mozilla16MB mozilla32MB mozilla64MB mozilla128MB mozilla256MB mozilla512MB mozilla1024MB nci8MB nci16MB nci32MB nci64MB nci128MB nci256MB nci512MB nci1024MB sao8MB sao16MB sao32MB sao64MB sao128MB sao256MB sao512MB sao1024MB spamfile8MB spamfile16MB spamfile32MB spamfile64MB spamfile128MB spamfile256MB spamfile512MB spamfile1024MB xml8MB xml16MB xml32MB xml64MB xml128MB xml256MB xml512MB xml1024MB
sudo chown hamidkeb:hamidkeb ../../results/
#python chart_fs_dpu_speedup.py -r ../../results/compression_speedup_dpu.csv -o output1
#python chart_fs_dpu_speedup_no_overhead.py -r ../../results/compression_speedup_dpu.csv -o output2

