#!/bin/sh

DESCRIPTOR_OUT_DIR=build/descriptor-set-out

mkdir -p $DESCRIPTOR_OUT_DIR

protoc \
  -I src/main/proto \
  -I build/extracted-include-protos/main \
  --include_imports \
  --include_source_info \
  --descriptor_set_out=$DESCRIPTOR_OUT_DIR/proto-descriptor.pb \
  src/main/proto/helloworld.proto