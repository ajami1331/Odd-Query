#!/bin/bash
#
rm -r testcase
rm testcase.zip
mkdir testcase
 g++ generator.cc -o gen.exe
echo generator compiled
echo n, q, ai_upper_limit, filename, seed
echo sample
./gen.exe 3 3 5 ./testcase/1.in 123
./gen.exe 5 3 5 ./testcase/2.in 1234
./gen.exe 5 3 5 ./testcase/3.in 1235
echo sample input generated
echo small
./gen.exe 50 10 50 ./testcase/4.in 234
./gen.exe 100 50 100 ./testcase/5.in 12354
./gen.exe 500 100 500 ./testcase/6.in 324
echo small input generated
echo medium
./gen.exe 1000 500 5000 ./testcase/7.in 25534
./gen.exe 1000 1000 50000 ./testcase/8.in 35425
./gen.exe 10000 10000 500000 ./testcase/9.in 253
echo medium input generated
echo large
./gen.exe 100000 100000 1000000000 ./testcase/10.in 23456
./gen.exe 100000 100000 1000000000 ./testcase/11.in 23134
./gen.exe 100000 100000 1000000000 ./testcase/12.in 14152566
echo large input generated
g++ solution.cc -o sol.exe
echo solution compiled
for input in ./testcase/*.in
do
    output="${input//in/out}"
    ./sol.exe < $input > $output
done
echo output generated
zip testcase.zip ./testcase/*
echo testcase zipped