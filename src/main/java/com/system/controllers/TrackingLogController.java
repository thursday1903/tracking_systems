package com.system.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import com.google.gson.Gson;
import com.system.commons.DateConvert;
import com.system.interfaces.IcustomTrackingLog;
import com.system.modals.customize.TrackingDataUpload;
import com.system.modals.customize.TrackingObject;
import com.system.modals.modal.TrackingCodeData;
import com.system.modals.modal.TrackingLogs;
import com.system.repositories.primarydb.TblCardTypeDetailRepository;
import com.system.repositories.primarydb.TrackingCodeDataRepository;
import com.system.repositories.primarydb.TrackingLogRepository;
import com.system.services.ReportService;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class TrackingLogController extends BaseController{
	
	final String PATH_UPLOAD_FILE = "/utils/uploadfile";
	final String PATH_CREATE_FILE_INDEX = "/transport/create_tracking";
	final String PATH_IMPORT_FILE_INDEX = "/transport/import_tracking";
	@Autowired
	private TblCardTypeDetailRepository tblCardTypeDetailRepository;
	
	@Autowired
	private ReportService reportService;
	
	
	@Autowired
	private TrackingLogRepository trackingLogRepository;
	@Autowired
	private TrackingCodeDataRepository trackingCodeDataRepository;
	
	
    @RequestMapping("/transport/tracking_logs")
    public String listProductConfig(Model model) {
    	try {
    		model.addAttribute("moduleName","tracking_logs");
    		Authentication auth = SecurityContextHolder.getContext().getAuthentication();			
    		if (auth.isAuthenticated() && !auth.getPrincipal().toString().equalsIgnoreCase("anonymousUser"))
    		{
    			List<IcustomTrackingLog> lstSofpinStock = trackingLogRepository.getListAllCustomTracking();
    			System.out.println("Total record:"+ lstSofpinStock.size());
    			model.addAttribute("listCardTypeDetail", lstSofpinStock);			
    		}else {
    			return "redirect:/login";
    		}
    	} catch (Exception e) {
    		// TODO: handle exception
    		e.printStackTrace();
    	}
    	return "transport/tracking_logs";
    }
    
		
    @RequestMapping("/transport/edit_tracking/{id}")
    public ModelAndView showEditForm(@PathVariable(name = "id") Long rowId) {
    	System.out.println("rowId:"+rowId);
    	ModelAndView mav = new ModelAndView("transport/edit_tracking");
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	try {
    		if (auth.isAuthenticated() && !auth.getPrincipal().toString().equalsIgnoreCase("anonymousUser")) {    			
    			TrackingLogs tblCardTypeDetails = trackingLogRepository.getListTrackingLogById(rowId);    			
    			List<TrackingCodeData> lstTrackingCodeDatas = trackingCodeDataRepository.findAll();        	
    			mav.addObject("trackingCode",lstTrackingCodeDatas);
    			mav.addObject("trackingLogs", tblCardTypeDetails);	    	
    		}else {
    			return new ModelAndView("redirect:/login");
    		}
    	} catch (Exception e) {
    		// TODO: handle exception
    		e.printStackTrace();
    	}    	
    	return mav;
    }
    
    @RequestMapping("/transport/delete_tracking/{id}")
    public String deleteTracking(@PathVariable(name = "id") Long rowId) {
    	System.out.println("rowId:"+rowId);    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	if (auth.isAuthenticated() && !auth.getPrincipal().toString().equalsIgnoreCase("anonymousUser")) {
    		try {
            	trackingLogRepository.deleteById(rowId);        	       	    	
    		} catch (Exception e) {
    			// TODO: handle exception
    			e.printStackTrace();
    		}	
    	}else {
    		return "redirect:/login";
    	}    	    
    	return "redirect:/transport/tracking_logs";
    }
    

	
	@RequestMapping(value = "/transport/submit_update_tracking", method = RequestMethod.POST)
	public String updateTracking(@Valid @ModelAttribute("trackingLogs") TrackingLogs trackingLogs) {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			System.out.println("start update data-----------");
			if (auth.isAuthenticated() && !auth.getPrincipal().toString().equalsIgnoreCase("anonymousUser")) {
//				trackingLogs.setChangeDate(new Date());
				trackingLogRepository.save(trackingLogs);
				return "redirect:/transport/tracking_logs?Success";
			} else {
				return "redirect:/login";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "redirect:/transport/tracking_logs?Success";
		}
	}
	
	@RequestMapping(value = "/transport/submit_create_tracking", method = RequestMethod.POST)
	public String createTracking(@Valid @ModelAttribute("trackingLogs") TrackingLogs trackingLogs) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();			
		if (auth.isAuthenticated() && !auth.getPrincipal().toString().equalsIgnoreCase("anonymousUser")) {			
			trackingLogRepository.save(trackingLogs);
			return "redirect:/transport/tracking_logs?Success";
		} else {
			return "redirect:/login";
		}
	}
	
	@GetMapping("/transport/create_tracking")
	public ModelAndView homepage(Model model) {
		ModelAndView mav = new ModelAndView("transport/create_tracking");
		TrackingLogs trackingLogs = new TrackingLogs();
		List<TrackingCodeData> lstTrackingCodeDatas = trackingCodeDataRepository.findAll();
		mav.addObject("trackingCode",lstTrackingCodeDatas);
		mav.addObject("trackingLogs", trackingLogs);	    
		return mav;
	}
	
	@GetMapping(PATH_IMPORT_FILE_INDEX)
	public ModelAndView importTracking(Model model) {
		ModelAndView mav = new ModelAndView("transport/import_tracking");
//		TrackingLogs trackingLogs = new TrackingLogs();
//		List<TrackingCodeData> lstTrackingCodeDatas = trackingCodeDataRepository.findAll();
//		mav.addObject("trackingCode",lstTrackingCodeDatas);
//		mav.addObject("trackingLogs", trackingLogs);	    
		return mav;
	}
	
	@GetMapping("/order_tracking/searchPin")
	public ModelAndView searchOrderHome(Model model,@RequestParam(name = "keyword",defaultValue = "N/A") String keyword) {
		ModelAndView mav = new ModelAndView("order_tracking/searchPin");		
		System.out.println("keyword"+ keyword);
		if(!keyword.equalsIgnoreCase("N/A"))
		{
			List<IcustomTrackingLog> lstTrackingCodeDatas = trackingLogRepository.getListCustomTracking(keyword);
			System.out.println("Tổng số bản ghi:"+ lstTrackingCodeDatas.size());
			mav.addObject("trackingCode",lstTrackingCodeDatas);
			mav.addObject("keyword", keyword);	
		    mav.addObject("trackingLogs", lstTrackingCodeDatas);	
		}
	    return mav;
	}
	
	@PostMapping(PATH_UPLOAD_FILE)
	public String uploadRequestTopupFiles(Model model, @RequestParam("file") MultipartFile file) {
		try {			
			StringBuffer stringBuffer = new StringBuffer();
			
			System.out.println(file.getContentType());
			String UPLOAD_DIR = "./files/";			
			if (getCurrentSessionAuthen()!=null) {
				final String fileExtensionAccept = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
				if(file.getContentType().equalsIgnoreCase(fileExtensionAccept))
				{
					log.info(stringBuffer.toString());
					 // normalize the file path
			        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

					// save the file on the local file system
					try {
						Path path = Paths.get(UPLOAD_DIR + fileName);
						Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
						List<TrackingDataUpload> lstTopupObjects = readExcelfileContent(path.toString());	
						
						for (TrackingDataUpload trackingDataUpload : lstTopupObjects) {
							
							List<TrackingLogs> lstSubmitAll = new ArrayList<TrackingLogs>();
							for (TrackingObject trackingObject : trackingDataUpload.getLstTrackingObj()) {
								TrackingLogs trackingLogs = new TrackingLogs(trackingDataUpload.getOrderCode(), trackingDataUpload.getOrderReferenceCode(),null,null,null,null);
								if(trackingObject.isValidTracking())
								{
									trackingLogs.setChangeDate(trackingObject.getDate());
									trackingLogs.setLogLocation(trackingObject.getLoc());
									trackingLogs.setStateId(trackingObject.getIndex());
									try {
										TrackingLogs trackingLogFound = trackingLogRepository.getListTrackingByOrderCodeAndState(trackingObject.getOrderReferenceCode(), trackingObject.getIndex());
										if(trackingLogFound!=null)
										trackingLogRepository.updateTrackingLogs(trackingObject.getLoc(), trackingObject.getDate(), trackingLogs.getOrderReferenceCode(), trackingObject.getIndex());
										else
										{
//											trackingLogRepository.save(trackingLogs);	
											lstSubmitAll.add(trackingLogs);
										}
									} catch (Exception e) {
										// TODO: handle exception
										log.info("Save and update error at:"+trackingLogs.getOrderCode() ,e);
									}									
								}
							}
							if(lstSubmitAll.size()>0)
								trackingLogRepository.saveAll(lstSubmitAll);
							
						}
						model.addAttribute("lstPinDetail", lstTopupObjects);
						
//						topupUtils.saveRequest(lstTopupObjects, getCurrentSessionAuthen(), fileName);
						return PATH_IMPORT_FILE_INDEX.substring(1, PATH_IMPORT_FILE_INDEX.length());
					} catch (IOException e) {
						e.printStackTrace();
						model.addAttribute("error", "Lỗi khi đọc thông tin file excel");
						log.info("Read file error",e);
						return PATH_IMPORT_FILE_INDEX.substring(1, PATH_IMPORT_FILE_INDEX.length());
					}	
				}else {
					String displayMsg = "Chỉ chấp nhận file xlsx";
					System.out.println(displayMsg);
					List<TrackingDataUpload> lstTopupObjects = new ArrayList<TrackingDataUpload>();
		            model.addAttribute("lstPinDetail", lstTopupObjects);	
		            
		    		return PATH_IMPORT_FILE_INDEX.substring(1, PATH_IMPORT_FILE_INDEX.length());
				}					        		      
			} else {
				return "redirect:/login";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.info("Process file error",e);
			model.addAttribute("error", "Lỗi khi xử lý, liên hệ admin để được hỗ trợ");
		}
		return PATH_IMPORT_FILE_INDEX.substring(1, PATH_IMPORT_FILE_INDEX.length());
	}
	
	private List<TrackingDataUpload> readExcelfileContent(String path) throws Exception
	{
		List<TrackingDataUpload> lstList  = new ArrayList<TrackingDataUpload>();
		try {
			FileInputStream file = new FileInputStream(new File(path));
			// Get the workbook instance for XLS file
			XSSFWorkbook workbook = new XSSFWorkbook(file);
			// Get first sheet from the workbook
			XSSFSheet sheet = workbook.getSheet("tracking_data");

			Integer count = sheet.getLastRowNum() + 1;

			for (int i = 1; i <= count; i++) {
				Row rw = sheet.getRow(i);
				if(rw==null)
					continue;
//				Double mobileNumber = rw.getCell(1).getNumericCellValue();
//				Double topupAmount = rw.getCell(2).getNumericCellValue();
//				String provider = rw.getCell(3).getStringCellValue();
				String referencyOrderCode = getCellValue(rw.getCell(0));
				String orderCode = getCellValue(rw.getCell(1));
				
				String date1 = getCellValue(rw.getCell(2));
				String loc1 = getCellValue(rw.getCell(3));
				TrackingObject trackingObject1 = new TrackingObject(1,parseDate(date1), loc1,referencyOrderCode);
				String date2 = getCellValue(rw.getCell(4));;
				String loc2 = getCellValue(rw.getCell(5));;
				TrackingObject trackingObject2 = new TrackingObject(2,parseDate(date2), loc2,referencyOrderCode);
				String date3 = getCellValue(rw.getCell(6));;
				String loc3 = getCellValue(rw.getCell(7));;
				TrackingObject trackingObject3 = new TrackingObject(3,parseDate(date3), loc3,referencyOrderCode);
				String date4 = getCellValue(rw.getCell(8));;
				String loc4 = getCellValue(rw.getCell(9));;
				TrackingObject trackingObject4 = new TrackingObject(4,parseDate(date4), loc4,referencyOrderCode);
				String date5 = getCellValue(rw.getCell(10));;
				String loc5 = getCellValue(rw.getCell(11));;
				TrackingObject trackingObject5 = new TrackingObject(5,parseDate(date5), loc5,referencyOrderCode);
				String date6 = getCellValue(rw.getCell(12));;
				String loc6 = getCellValue(rw.getCell(13));;
				TrackingObject trackingObject6 = new TrackingObject(6,parseDate(date6), loc6,referencyOrderCode);
				String date7 = getCellValue(rw.getCell(14));;
				String loc7 = getCellValue(rw.getCell(15));;
				TrackingObject trackingObject7 = new TrackingObject(7,parseDate(date7), loc7,referencyOrderCode);
				List<TrackingObject> lstTrackingObj = new ArrayList<TrackingObject>();
				lstTrackingObj.add(trackingObject7);
				lstTrackingObj.add(trackingObject6);
				lstTrackingObj.add(trackingObject5);
				lstTrackingObj.add(trackingObject4);
				lstTrackingObj.add(trackingObject3);
				lstTrackingObj.add(trackingObject2);
				lstTrackingObj.add(trackingObject1);				
				TrackingDataUpload trackingDataUpload = new TrackingDataUpload(orderCode,referencyOrderCode,
						parseDate(date1),loc1,parseDate(date2),loc2,parseDate(date3),loc3,
						parseDate(date4),loc4,parseDate(date5),loc5,parseDate(date6),loc6,
						parseDate(date7),loc7);
				trackingDataUpload.setLstTrackingObj(lstTrackingObj);
				System.out.println(new Gson().toJson(trackingDataUpload));
				
				lstList.add(trackingDataUpload);
			}
		} catch (Exception e) {
			// TODO: handle exception
			log.info("readExcelfileContent",e);
			throw e;
		}
		return lstList;
	}
	
	String getCellValue(Cell cellObj)
	{
		if(cellObj != null)
		{
			return cellObj.getStringCellValue()==null?"N/A":cellObj.getStringCellValue();
		}
		return "N/A";
	}
	
	Date parseDate(String input) throws Exception {
		try {
			if (!input.equalsIgnoreCase("N/A"))
				return DateConvert.stringToDate(input, "dd/MM/yyyy");
			else
				return null;
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}
}
