#!/bin/bash
#
rm -r testcase
rm testcase.zip
mkdir testcase
 g++ generator.cc -o gen.exe
echo generator compiled
echo n, q, ai_upper_limit, filename, seed
echo sample
./gen.exe 3 3 5 ./testcase/input01.txt 123
./gen.exe 5 3 5 ./testcase/input02.txt 1234
./gen.exe 5 3 5 ./testcase/input03.txt 1235
echo sample input generated
echo small
./gen.exe 50 10 50 ./testcase/input04.txt 234
./gen.exe 100 50 100 ./testcase/input05.txt 12354
./gen.exe 500 100 500 ./testcase/input06.txt 324
echo small input generated
echo medium
./gen.exe 1000 500 5000 ./testcase/input07.txt 25534
./gen.exe 1000 1000 50000 ./testcase/input08.txt 35425
./gen.exe 10000 10000 500000 ./testcase/input09.txt 253
echo medium input generated
echo large
./gen.exe 100000 100000 1000000000 ./testcase/input10.txt 23456
./gen.exe 100000 100000 1000000000 ./testcase/input11.txt 23134
./gen.exe 100000 100000 1000000000 ./testcase/input12.txt 14152566
echo large input generated
g++ solution.cc -o sol.exe
echo solution compiled
for input in ./testcase/input*.txt
do
    output="${input//input/output}"
    ./sol.exe < $input > $output
done
echo output generated
zip testcase.zip ./testcase/*
echo testcase zipped