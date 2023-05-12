#include <CL/sycl.hpp>
#include <cmath>
#include <cstddef>
#include <cstdint>
#include <type_traits>
#include "pybind11/pybind11.h"
#include "pybind11/stl.h"

int main(void) {
  sycl::queue q{sycl::default_selector_v};

  size_t n = 38455;
  float *d = sycl::malloc_device<float>(n, q);

  q.fill<float>(d, float(3), n).wait();

  q.parallel_for(sycl::range<1>(n), [=](auto id) {auto i=id[0]; d[i] = std::abs(d[i]);}).wait();

  sycl::free(d, q);

  return 0;
}
