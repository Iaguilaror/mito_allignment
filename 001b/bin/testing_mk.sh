##TEST_SAMPLE="SM-3MG3L_DHG02288_H3VGKCCXX_L8"
TEST_SAMPLE="SM-3MG3L_DHG02288_H3VGKCCXX"
##TEST_SAMPLE="SM-3MG3L_DHG02288_H3VGKCCXX_L6"

bin/targets | grep $TEST_SAMPLE | xargs mk
