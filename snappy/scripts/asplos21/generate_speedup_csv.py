import os
import sys
import csv
import argparse
import pathlib
from math import ceil
from parse_output_file import get_avg_max_cycles, get_avg_host_runtime, get_avg_host_runtime_withoutoverhead, get_avg_overhead_time, get_avg_dpu_runtime
MAX_DPUS = 2304
MAX_TASKLETS = 24


def get_optimal_tasklets(file_path, block_size, num_dpus):
        size = os.path.getsize(file_path)
        num_blocks = ceil(size / block_size)

        num_tasklets = ceil(num_blocks / num_dpus)
        if (num_tasklets > MAX_TASKLETS):
                num_tasklets = MAX_TASKLETS
        return num_tasklets

def run_dpu_test(files, min_dpu, max_dpu, incr):

        block_size_list=[2048,4096,8192,16384,32768,65536,131072,262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216]
        with open('results/compression_speedup_dpu.csv', 'w', newline='') as csvfile:
                writer = csv.writer(csvfile, delimiter=',')
                writer.writerow(['version', 'Runtimewithoutoverhead', 'Speedupwithoutoverhead' ,'dpus', 'tasklets', 'block_size'])
                writer.writerow(['host','0', '1' ,'0', '0', '0'])

                for testfile in files:
                    #for i in [min_dpu] + list(range(min_dpu - 1 + incr, max_dpu + 1, incr)):
                    for i in list(range(min_dpu, max_dpu + 1, incr)):
                       for block_size in block_size_list:
                          for tasklets in range(1, 25):
                                #tasklets = get_optimal_tasklets(f"/data/hamid/snappy-dataset/{testfile}.txt", block_size, i)

                                #host_withoverhead = get_avg_host_runtime(pathlib.Path("results/compression"), testfile,block_size)
                                host_withoutoverhead = get_avg_host_runtime_withoutoverhead(pathlib.Path("results/compression"), testfile, block_size)
                                dpu = get_avg_dpu_runtime(pathlib.Path("results/compression"), testfile, i, tasklets, block_size)
                                #dpu_overhead = get_avg_overhead_time(pathlib.Path("results/compression"), testfile, i, tasklets, block_size)

                                if dpu > 0:
                                    #std_dpu = host / (dpu + sum(dpu_overhead))
                                    #writer.writerow([testfile, std_dpu, i, tasklets])

                                    #dpu_withoverhead = dpu + sum(dpu_overhead)
                                    #std_dpu_withoverhead = host_withoverhead / dpu_withoverhead
                                    std_dpu_withoutoverhead = host_withoutoverhead / dpu
                                    writer.writerow([testfile, dpu, std_dpu_withoutoverhead, i, tasklets, block_size])
       
        
if __name__ == "__main__":
        parser = argparse.ArgumentParser(description='Run a specific test')
        requiredArgs = parser.add_argument_group('required arguments')
        requiredArgs.add_argument('-f', '--files', nargs='+', required=True, help='List of test files to run, without file endings')
        requiredArgs.add_argument('-r', '--range', nargs='+', required=True, help='Range of DPUs or tasklets to test: [MIN] [MAX]')
        requiredArgs.add_argument('-i', '--incr', required=True, help='Increment to test within the range')

        args = parser.parse_args()
        files = args.files
        range_min = int(args.range[0])
        range_max = int(args.range[1])
        incr = int(args.incr)

        # Set up the folders to hold output files
        script_dir = os.path.dirname(os.path.realpath(sys.argv[0]))
        os.chdir(script_dir + "/../../")
        run_dpu_test(files, range_min, range_max, incr) 
