#define PROGRAM_NAME "trim_sgb_tilemap"
#define USAGE_OPTS "[-h|--help] [-r|--revert] infile.tilemap outfile.tilemap"

#include "common.h"

void parse_args(int argc, char *argv[], bool *revert) {
    struct option long_options[] = {
        {"revert", no_argument, 0, 'r'},
        {"help", no_argument, 0, 'h'},
        {0}
    };
    for (int opt; (opt = getopt_long(argc, argv, "rh", long_options)) != -1;) {
        switch (opt) {
            case 'r':
                *revert = true;
                break;
            case 'h':
                usage_exit(0);
                break;
            default:
                usage_exit(1);
        }
    }
}

uint8_t output[0x700];
int frame_start = (5 * 32 + 6) * 2;

void trim_tilemap(const uint8_t *data, long filesize) {
    int pos = 0;
    int frame_end = (22 * 32 + 26) * 2;

    for (int i = 0; i < frame_start; i++) {
        output[pos++] = data[i];
    }

    for (int row = 0; row < 17; row++) {
        for (int  i = 0; i < 12 * 2; i++) {
            output[pos++] = data[frame_start + 20 * 2 + row * 32 * 2 + i];
        }
    }

    for (int i = frame_end; i < filesize; i++) {
        output[pos++] = data[i];
    }
}

void expand_tilemap(const uint8_t *data, long filesize) {
    int pos = 0;
    int frame_end = frame_start + 18 * 12 * 2;

    for (int i = 0; i < frame_start; i++) {
        output[pos++] = data[i];
    }

    for (int row = 0; row < 18; row++) {
        for (int i = 0; i < 20 * 2; i++) {
            output[pos++] = 0;
        }
        for (int  i = 0; i < 12 * 2; i++) {
            output[pos++] = data[frame_start + row * 12 * 2 + i];
        }
    }

    for (int i = frame_end; i < filesize; i++) {
        output[pos++] = data[i];
    }
}

int main(int argc, char *argv[]) {
    bool revert = false;
    parse_args(argc, argv, &revert);

    argc -= optind;
    argv += optind;
    if (argc < 1) {
        usage_exit(1);
    }

    int in_size  = revert ? 0x430 : 0x700;

    long filesize;
    uint8_t *data = read_u8(argv[0], &filesize);
    if (filesize != in_size) {
        error_exit("Input SGB tilemap has wrong size.");
    }

    if (revert) {
        expand_tilemap(data, filesize);
    } else {
        trim_tilemap(data, filesize);
    }
    write_u8(argv[1], output, revert ? 0x700 : 0x430);

    free(data);
    return 0;
}
