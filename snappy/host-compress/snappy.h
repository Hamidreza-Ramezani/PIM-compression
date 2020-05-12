#ifndef _LINUX_SNAPPY_H
#define _LINUX_SNAPPY_H 1

#include <stdbool.h>
#include <stddef.h>

/* Only needed for compression. This preallocates the worst case */
struct snappy_env {
	unsigned short *hash_table;
	void *scratch;
	void *scratch_output;
};

struct iovec;
int snappy_init_env(struct snappy_env *env);
int snappy_init_env_sg(struct snappy_env *env, bool sg);
void snappy_free_env(struct snappy_env *env);
int snappy_compress(struct snappy_env *env,
		    const char *input,
		    size_t input_length,
            size_t block_size,
		    char *compressed,
		    size_t *compressed_length);
int snappy_compress_iov(struct snappy_env *env,
			struct iovec *iov_in,
			int iov_in_len,
			size_t input_length,
			struct iovec *iov_out,
			int *iov_out_len,
            size_t block_size,
			size_t *compressed_length);
bool snappy_uncompressed_length(const char *buf, size_t len, size_t *result);
size_t snappy_max_compressed_length(size_t source_len);




#endif
