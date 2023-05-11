package vpay_cms_topup_bill;

import java.util.Date;
import java.util.List;
import java.util.Random;

import com.system.MainApplication;
import com.system.modals.modal.TopupListFiles;
import com.system.repositories.primarydb.TblAdminUserRepository;
import com.system.repositories.primarydb.TopupListFileRepository;
import com.system.services.TopupService;
import com.system.threadpool.TaskThread;
import com.system.threadpool.ThreadPoolExecutorUtil;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = MainApplication.class)
public class TestAdminService {

	
	@Autowired
	TblAdminUserRepository tblAdminUserRepository;
	
	TopupListFileRepository topupListFileRepository;
	
	@Autowired
	TopupService topupService;
	
	@Autowired
	ThreadPoolExecutorUtil threadPoolExecutorUtil;
	
	
	
//	@Test
//	public void testGetAllAdmin() {
//		try {
//			Long total = tblAdminUserRepository.count();					
//			System.out.println("Total user:"+ total);
//			String clearPass = "VpadminPWd";
//			System.out.println("new BCryptPasswordEncoder():"+ new BCryptPasswordEncoder().encode(clearPass));
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//	}
	
//	@Test
	public void testTopupListFiles()
	{
		List<TopupListFiles> lstAllRequest = topupListFileRepository.findAll();
		for (TopupListFiles topupListFiles : lstAllRequest) {
			System.out.println(topupListFiles.getFileUpload());
			topupListFiles.setApprovedRejectByAdmin("Admin");
			topupListFiles.setApprovedRejectDate(new Date());
			topupListFileRepository.save(topupListFiles);
		}
	}
	
	
	@Test
	public void testTopupService()
	{
		System.out.println("new BCryptPasswordEncoder:"+ new BCryptPasswordEncoder().encode("pwd*68"));
	}
}
