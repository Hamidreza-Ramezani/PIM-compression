import os
import sys
import csv
import argparse
import pathlib
from math import ceil
from parse_output_file import get_avg_max_cycles, get_avg_host_runtime, get_avg_overhead_time
MAX_DPUS = 640
MAX_TASKLETS = 24


def get_optimal_tasklets(file_path, block_size, num_dpus):
        size = os.path.getsize(file_path)
        num_blocks = ceil(size / block_size)

        num_tasklets = ceil(num_blocks / num_dpus)
        if (num_tasklets > MAX_TASKLETS):
                num_tasklets = MAX_TASKLETS
        return num_tasklets

def run_dpu_test(files, min_dpu, max_dpu, incr):

        with open('results/compression_speedup_dpu.csv', 'w', newline='') as csvfile:
                writer = csv.writer(csvfile, delimiter=',')
                writer.writerow(['version', 'time', 'dpus', 'tasklets'])
                writer.writerow(['host', '1', '0', '0'])

                for testfile in files:
                    #for i in [min_dpu] + list(range(min_dpu - 1 + incr, max_dpu + 1, incr)):
                    for i in list(range(min_dpu, max_dpu + 1, incr)):
                                tasklets = get_optimal_tasklets(f"/data/hamid/snappy-dataset/{testfile}.txt", 32768, i)

                                host = get_avg_host_runtime(pathlib.Path("results/compression"), testfile)
                                dpu = float(get_avg_max_cycles(pathlib.Path("results/compression"), testfile, i, tasklets)) / 350000000
                                dpu_overhead = get_avg_overhead_time(pathlib.Path("results/compression"), testfile, i, tasklets)

                                if dpu > 0:
                                    std_dpu = host / (dpu + sum(dpu_overhead))
                                    writer.writerow([testfile, std_dpu, i, tasklets])
       
        
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
