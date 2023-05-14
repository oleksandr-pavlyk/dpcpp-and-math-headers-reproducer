#include <CL/sycl.hpp>
#include <cstddef>
#include <cstdint>
#include <type_traits>
#include <cmath>
#include <complex>

template <typename T>
void test(sycl::queue q) {
  size_t n = 38455;

  T *d = sycl::malloc_device<T>(n, q);
  bool *r = sycl::malloc_device<bool>(n, q);

  q.fill<T>(d, T(3), n).wait();

  q.parallel_for(sycl::range<1>(n), [=](auto id) {auto i=id[0]; r[i] = std::isinf(d[i]);}).wait();
  
  sycl::free(d, q);
  sycl::free(r, q);
  return;
}

int main(void) {
  sycl::queue q{sycl::default_selector_v};
  auto const &d = q.get_device();

  if (d.has(sycl::aspect::fp64)) {
    test<double>(q);
  }

  return 0;
}
