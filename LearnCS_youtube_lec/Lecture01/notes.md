## Core idea
- A **kernel** is a function you write that runs on the **GPU**.
- The `main` function runs on the **CPU**. It does the normal work (printing, setup) and sends jobs to the GPU as kernel launches.

```cpp
__global__ void myKernel() {   // __global__ = runs on GPU, called from CPU
    // work done by each thread
}

int main() {
    myKernel<<<numBlocks, threadsPerBlock>>>();  // kernel launch
    cudaDeviceSynchronize();                     // wait for GPU to finish
    return 0;
}
```

---

## Q: Does the CPU wait for a kernel to finish?
**No. Kernel launches are asynchronous.** The CPU launches the kernel and moves straight on to the next line.

## Q: How do I make sure the CPU waits for the GPU?
Call `cudaDeviceSynchronize()` ("CDS"). It blocks the CPU until all previously launched GPU work is done.
- Use it before the CPU reads results or prints anything that depends on the kernel.

## Q: What happens if I launch two kernels back to back?
They go into a **queue** (called a **stream**). The second kernel starts only after the first one finishes.
- If you don't specify a stream, kernels go to the **default stream**, so they run in launch order.
- Note: the CPU still doesn't wait. The ordering happens on the GPU side.

## Q: Where does the parallelism come from?
From the launch configuration `<<<numBlocks, threadsPerBlock>>>`:
- The kernel runs **once per thread**, with all threads running in parallel.
- Threads are grouped into **blocks**.
- Total threads = `numBlocks × threadsPerBlock`.

---

## Open questions / to revisit
- (add anything that confused you here)
