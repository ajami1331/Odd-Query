#include <cstdio>
#include <cassert>
#include <cmath>
#include <random>
#include <vector>
#include <set>
#include <algorithm>
using ll = long long;

// n, q, ai_upper_limit, filename, seed
int main(int argc, char **argv) {
    assert(argc == 6 && "must provide n, q, ai_upper_limit, filename, seed");
    
    int n = atoi(argv[1]);
    int q = atoi(argv[2]);
    int ai_upper_limit = atoi(argv[3]);
    char* filename = argv[4];
    ll seed = atoll(argv[5]);
    
    FILE *file = fopen(filename, "w+");

    std::mt19937_64 rng(seed);

    fprintf(file, "%d %d\n", n, q);

    std::vector <int> ar(n + 1);
    std::vector <int> index;

    for (int i = 1; i <= n; i++) { 
        ar[i] = (rng() % ai_upper_limit) + 1;
        while (ar[i] % 2 != 0) ar[i] = (rng() % ai_upper_limit) + 1;
    }

    std::shuffle(ar.begin() + 1, ar.end(), rng);

    for (int i = 1; i <= n; i++) {
        fprintf(file, "%d", ar[i]);
        fprintf(file, i < n ? " " : "\n");
        index.push_back(i);
    }

    std::shuffle(index.begin(), index.end(), rng);

    for (int i = 1; i <= q; i++) {
        int x = index.back();
        index.pop_back();
        int v = (rng() % ai_upper_limit) + 1;
        while (((v ^ ar[x]) & 1) == 0) v = (rng() % ai_upper_limit) + 1;
        ar[x] = v;
        fprintf(file, "%d %d\n", x, v);
    }

    fclose(file);
}