package com.system.threadpool;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class ThreadPoolExecutorUtil
{
    private Logger logger= LoggerFactory.getLogger(ThreadPoolExecutorUtil.class);

    private ThreadPoolExecutor threadPoolExecutor;

    public ThreadPoolExecutorUtil()
    {
        
        BlockingQueue<Runnable> blockingQueue = new ArrayBlockingQueue(10000);
        threadPoolExecutor = new ThreadPoolExecutor(2, 10, 20, TimeUnit.SECONDS, blockingQueue);
        threadPoolExecutor.setRejectedExecutionHandler((r, executor) ->
        {
            try
            {
                Thread.sleep(1000);
                logger.error("Exception occurred while adding task, Waiting for some time");
            }
            catch (InterruptedException e)
            {
                logger.error("Thread interrupted:  ()",e.getCause());
                Thread.currentThread().interrupt();
            }
            threadPoolExecutor.execute(r);
        });
    }

    public void executeTask(TaskThread taskThread)
    {
        threadPoolExecutor.submit(taskThread);
        System.out.println("Queue Size: "+threadPoolExecutor.getQueue().size());
        System.out.println("Number of Active Threads: "+threadPoolExecutor.getActiveCount());
    }
}

