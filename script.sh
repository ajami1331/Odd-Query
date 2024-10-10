#!/bin/bash
#
rm -rf testcase
rm -f testcase.zip
mkdir testcase
 g++ generator_odd_heavy.cc -o gen.exe
echo generator compiled
echo n, q, ai_upper_limit, filename, seed
echo sample
./gen.exe 3 1 5 ./testcase/1.in 12
./gen.exe 1 1 5 ./testcase/2.in 23
./gen.exe 5 5 5 ./testcase/3.in 45854457
echo sample input generated
echo small
./gen.exe 10 10 50 ./testcase/4.in 234
./gen.exe 15 15 100 ./testcase/5.in 12354
./gen.exe 20 20 500 ./testcase/6.in 324
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

rm -rf ./Input/
rm -rf ./Output/

mkdir -p ./Input/
mkdir -p ./Output/

cp ./testcase/*.in ./Input/
cp ./testcase/*.out ./Output/

cp Config.json ./

zip -r testcase.zip ./Config.json ./Input ./Output
echo testcase zipped