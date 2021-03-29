A subsequence is a sequence that can be derived from the given sequence by deleting zero or more elements without changing the order of the remaining elements.

For example, **1, 2, 4** is a subsequence of **1, 2, 2, 4, 3, 6**, while **4, 2, 1** is not.

Alice is given a sequence of **n** numbers **A<sub>1</sub>, A<sub>2</sub>, …, A<sub>n</sub>**.

She wants to perform **q** operations on the sequence.
* **X V**, change the value of the element at the index **X** to **V**.
* After changing the value, she also wants to calculate the number of sub-sequence with an odd sum.

As she is feeling lazy, she doesn't want to do the calculation by herself. So help her by doing the calculation for her.

As the answer can be quite big, print the answer modulo **10^9+7**.

Input 

The first line contains two integers **n** and **q ( 1 <= n, q <= 10^5 )**.

The next line will contain **n** integers,  **A<sub>1</sub>,A<sub>2</sub>,…,A<sub>n</sub>**.

Each of the next **q** line will contain, two integers **X**, **V** describing each query.

**Constraints**

**( 1 <= n, q <= 10^5 )**

**1 <= A<sub>i</sub> <= 10^9**

**1 <= X <= N**

**1 <= V <= 10^9**

**Output**

For each operation. print the answer modulo **10^9+7** in a new line.
