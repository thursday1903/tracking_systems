package com.system.threadpool;

import com.system.repositories.primarydb.TopupListFileRepository;

public class TaskThread implements Runnable{

	private final TopupListFileRepository topupListFileRepository;
	
	public TaskThread(TopupListFileRepository topupListFileRepository) {
		//TODO Auto-generated constructor stub
		this.topupListFileRepository = topupListFileRepository;
	}
	
	@Override
	public void run() {
		try {			
			// TODO Auto-generated method stub
			System.out.println("Total rec:"+ this.topupListFileRepository.count());
			System.out.println("Total rec:");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

} 
