TEST_SAMPLE="SM-3MGPZ_DHG02382_H2L7KCCXX_L4"

bin/targets | grep $TEST_SAMPLE | xargs mk
