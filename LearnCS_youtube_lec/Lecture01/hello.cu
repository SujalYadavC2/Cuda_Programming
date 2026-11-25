#include <stdio.h>
#include <cuda.h>

__global__ void GetIdKernel(){
  printf("Thread Id: %d, Block Id: %d\n", threadIdx.x, blockidx.x);
}

int main(){
  GetIdKernal<<<2,4>>>();
  cudaDeviceSynchronize();

  printf("Launch: %s\n", cudaGetErrorString(cudaGetLastError()));
  printf("Sync: %s\n", cudaGetErrorString(cudaDeviceSynchronize())); // here we are doing syn again. No need for this but it will tell if there us an error in Sync

  return 0;
}
