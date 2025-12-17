#!/bin/bash
EXT_NAME=wp_flight
EXT_PATH=target/debug/lib${EXT_NAME}.so

XDEBUG_MODE=develop,profile php -dextension=${EXT_PATH} \
  -d xdebug.output_dir=/tmp/xdebug \
  -d xdebug.start_with_request=trigger \
  -d xdebug.mode=profile \
  -d xdebug.profiler_output_name=cachegrind.out.%p \
  -d xdebug.collect_includes=1 \
  -d xdebug.collect_params=1 \
  -d xdebug.collect_return=1 \
  -d xdebug.collect_assignments=1 \
  -d xdebug.collect_vars=1 \
  -d xdebug.show_mem_delta=1 \
  -d auto_prepend_file= \
  -d auto_append_file= \
  -d display_errors=0 \
  -S 0.0.0.0:4444 -t php
