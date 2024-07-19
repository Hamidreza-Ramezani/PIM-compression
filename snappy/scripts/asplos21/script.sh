#! /usr/sh

sudo python run_tests.py -t 1 -f dickens8MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f dickens16MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f dickens32MB -r 128 128 -i 64
sudo python run_tests.py -t 1 -f dickens64MB -r 192 192 -i 64
sudo python run_tests.py -t 1 -f dickens128MB -r 256 256 -i 64
sudo python run_tests.py -t 1 -f dickens256MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f dickens512MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f dickens1024MB -r 576 576 -i 64

sudo python run_tests.py -t 1 -f mozilla8MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f mozilla16MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f mozilla32MB -r 128 128 -i 64
sudo python run_tests.py -t 1 -f mozilla64MB -r 192 192 -i 64
sudo python run_tests.py -t 1 -f mozilla128MB -r 256 256 -i 64
sudo python run_tests.py -t 1 -f mozilla256MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f mozilla512MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f mozilla1024MB -r 576 576 -i 64


sudo python run_tests.py -t 1 -f nci8MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f nci16MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f nci32MB -r 128 128 -i 64
sudo python run_tests.py -t 1 -f nci64MB -r 192 192 -i 64
sudo python run_tests.py -t 1 -f nci128MB -r 256 256 -i 64
sudo python run_tests.py -t 1 -f nci256MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f nci512MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f nci1024MB -r 576 576 -i 64


sudo python run_tests.py -t 1 -f sao8MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f sao16MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f sao32MB -r 128 128 -i 64
sudo python run_tests.py -t 1 -f sao64MB -r 192 192 -i 64
sudo python run_tests.py -t 1 -f sao128MB -r 256 256 -i 64
sudo python run_tests.py -t 1 -f sao256MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f sao512MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f sao1024MB -r 576 576 -i 64


sudo python run_tests.py -t 1 -f spamfile8MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f spamfile16MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f spamfile32MB -r 128 128 -i 64
sudo python run_tests.py -t 1 -f spamfile64MB -r 192 192 -i 64
sudo python run_tests.py -t 1 -f spamfile128MB -r 256 256 -i 64
sudo python run_tests.py -t 1 -f spamfile256MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f spamfile512MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f spamfile1024MB -r 576 576 -i 64


sudo python run_tests.py -t 1 -f xml8MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f xml16MB -r 64 64 -i 64
sudo python run_tests.py -t 1 -f xml32MB -r 128 128 -i 64
sudo python run_tests.py -t 1 -f xml64MB -r 192 192 -i 64
sudo python run_tests.py -t 1 -f xml128MB -r 256 256 -i 64
sudo python run_tests.py -t 1 -f xml256MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f xml512MB -r 512 512 -i 64
sudo python run_tests.py -t 1 -f xml1024MB -r 576 576 -i 64



#sudo python generate_speedup_csv.py -r 64 576 -i 64 -f dickens8MB dickens16MB dickens32MB dickens64MB dickens128MB dickens256MB dickens512MB dickens1024MB


sudo python generate_speedup_csv.py -r 64 576 -i 64 -f dickens8MB dickens16MB dickens32MB dickens64MB dickens128MB dickens256MB dickens512MB dickens1024MB mozilla8MB mozilla16MB mozilla32MB mozilla64MB mozilla128MB mozilla256MB mozilla512MB mozilla1024MB nci8MB nci16MB nci32MB nci64MB nci128MB nci256MB nci512MB nci1024MB sao8MB sao16MB sao32MB sao64MB sao128MB sao256MB sao512MB sao1024MB spamfile8MB spamfile16MB spamfile32MB spamfile64MB spamfile128MB spamfile256MB spamfile512MB spamfile1024MB xml8MB xml16MB xml32MB xml64MB xml128MB xml256MB xml512MB xml1024MB


python chart_fs_dpu_speedup.py -r ../../results/compression_speedup_dpu.csv -o output


#sudo python run_tests.py -t 1 -r 64 576 -i 64 -f dickens8MB dickens16MB dickens32MB dickens64MB dickens128MB dickens256MB dickens512MB dickens1024MB


#python chart_fs_dpu_speedup.py -r ../../results/compression_speedup_dpu.csv -o output
#python chart_dpu_speedup.py -r ../../results/compression_speedup_dpu.csv -o output




