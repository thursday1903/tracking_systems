package com.system.services;

import java.util.List;

import com.system.modals.modal.TopupListFileDetails;
import com.system.modals.modal.TopupListFiles;
import com.system.repositories.primarydb.TopupListFileDetailRepository;
import com.system.repositories.primarydb.TopupListFileRepository;
import com.system.threadpool.TaskThread;
import com.system.threadpool.ThreadPoolExecutorUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class TopupService {

	 
	final TopupListFileRepository topupListFileRepository;
	
	final TopupListFileDetailRepository topupListFileDetailRepository;
	
	private final ThreadPoolExecutorUtil threadPoolExecutorUtil;
	
	@Autowired 
	public TopupService(TopupListFileRepository topupListFileRepository,TopupListFileDetailRepository topupListFileDetailRepository,
			ThreadPoolExecutorUtil threadPoolExecutorUtil) {
		//TODO Auto-generated constructor stub
		this.topupListFileRepository = topupListFileRepository; 
		this.topupListFileDetailRepository = topupListFileDetailRepository;
		this.threadPoolExecutorUtil = threadPoolExecutorUtil;
	}
	
	public void executeTopup(TopupListFiles topupListFiles, List<TopupListFileDetails> lstFileDetails)
	{
//		System.out.println("Total rec:"+ topupListFileRepository.count());
		TaskThread taskThread = new TaskThread(topupListFileRepository);
		threadPoolExecutorUtil.executeTask(taskThread);
	}
	
	public String initLogin(TopupListFiles topupListFiles)
	{
		return null;
	}

}
