#include <cstdio>
#include <cassert>
using ll = long long;
const int mod = 1e9 + 7;
const int sz = 1e5 + 10;

int ar[sz];
int n, q;
int x, v;
int oddCount;
int eventCount;
// Limits
const int n_lim_low = 1;
const int n_lim_high = 1e5;
const int q_lim_low = 1;
const int q_lim_high = 1e5;
const int ai_lim_low = 1;
const int ai_lim_high = 1e9;
const int v_lim_low = 1;
const int v_lim_high = 1e9;
// Limits

int main() {
    int n, q;
    scanf("%d %d", &n, &q);
    assert(n_lim_low <= n && n <= n_lim_high && "n not within limit");
    assert(q_lim_low <= q && q <= q_lim_high && "q not within limit");
    for (int i = 1; i <= n; i++) {
        scanf("%d", &ar[i]);
        assert(ai_lim_low <= ar[i] && ar[i] <= ai_lim_high && "ai not within limit");
    }
    ll ans = 0;
    while (q--) {
        scanf("%d %d", &x, &v);
        assert(n_lim_low <= x && x <= n && "x not within limit");
        assert(v_lim_low <= v && v <= v_lim_high && "v not within limit");
        ar[x] = v;
        ll odd = 0;
        ll even = 0;
        for (int mask = 0; mask < (1 << n); mask++) {
            ll h = 0;
            for (int i = 0; i < n; i++) {
                if (mask & (1 << i)) {
                    h += (ar[i + 1]  & 1);
                }
            }
            odd = (odd + (h & 1)) % mod;
            even = (even + !(h & 1)) % mod;
        }
        printf("%lld\n", odd);
    }
}