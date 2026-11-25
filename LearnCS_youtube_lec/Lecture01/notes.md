This is the introduction to the coda programming. The idea from here is that you write a kernel(function) which you launch in the 
main function. The kernel will be executed on the GPU where as the main function will use CPU to print or do stuff that you do not GPU for and 
send the job to GPU as a kernel call. **CPU does not wait to the kernel to finish it job.** so to make sure the code in the our main function is 
not executed before completion of any kernel call before that we use a command `cudaDeviceSynchronize()` or CDS for remembering. 

It also teaches the concept of queue. So If I launch two kernels one after another, the second kernel will go in the queue and it will be executed
after first kernel call is over. Also you can select number of blocks and number of thread in those block at the time of a kernel launch, **This is where
the parallelisation comes into the picture**
