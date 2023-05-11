package com.system.controllers;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import com.google.gson.Gson;
import com.system.commons.Commons;
import com.system.commons.DateConvert;
import com.system.config.Constants;
import com.system.modals.customize.CardDetail;
import com.system.modals.customize.IDirectTopupSummary;
import com.system.modals.customize.Paging;
import com.system.modals.customize.interfaces.ISoftpinDetailData;
import com.system.modals.modal.StoreSummaryLogs;
import com.system.repositories.primarydb.SoftpinReportRepository;
import com.system.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ToolController extends BaseController{
	@Autowired
	private SoftpinReportRepository softpinRepository;
	
	@Autowired
	private ReportService reportService;
	
	
	
	
	private String checkCardVttDataUrl;
	
	final String PATH_QUERY_PIN = "/report/searchPin";
	final String PATH_QUERYVTT_DATA_PIN = "/report/searchVttData";
	final String PATH_CHART_REPORT = "/report/charts_report";
	final String PATH_DIRECT_SUMMARY_REPORT = "/report/direct_summary_report";
	final String PATH_DOWNLOAD_SUMMARY_REPORT = "/report/download_summary_report";
	final String PATH_STORE_SUMMARY_LOG = "/report/store_summary_logs";
	
	@RequestMapping(PATH_QUERY_PIN)
	public String queryPins(Model model,
			HttpServletResponse response,
			@ModelAttribute Paging paging,
			@RequestParam(required=false, defaultValue="") String exportExcel
			) {
		try {
			StringBuffer stringBuffer = new StringBuffer();
			stringBuffer.append("request to "+PATH_QUERY_PIN+"" + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("page:"+ paging.getPage() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("size:"+ paging.getSize() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("from:"+ paging.getFromDate() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("to:"+ paging.getToDate() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("serial:"+ paging.getPinSerial() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("exportExcel:"+ exportExcel + Constants.RETURN_NEWLINE_CHAR);
			
			Calendar from = Calendar.getInstance();
			from.setTime(paging.getFromDate()==null?new Date():paging.getFromDate());
			from.set(Calendar.HOUR, 0);
			from.set(Calendar.MINUTE, 0);
			from.set(Calendar.SECOND, 0);
			from.set(Calendar.MILLISECOND, 0);
			Calendar to = Calendar.getInstance();
			to.setTime(paging.getToDate()==null?new Date():paging.getToDate());
			to.set(Calendar.HOUR, 23);
			to.set(Calendar.MINUTE, 59);
			to.set(Calendar.SECOND, 59);
			to.set(Calendar.MILLISECOND, 999);
			
			
			if (getCurrentSessionAuthen()!=null) {	
				System.out.println("start compare");
				Sort sortable = Sort.by("softpin_id").ascending();
				Pageable pageable = PageRequest.of(paging.getPage(), paging.getSize(), sortable);
//					String[] listPinSerial = paging.getPin_serial().split("\r\n");
//					(paging.getPinSerial()==null?"":paging.getPinSerial()).split(",")
				String querySerial = paging.getPinSerial() == null ? "" : paging.getPinSerial();
				querySerial = querySerial.replace(" ", "\r\n");
				List<String> myList = new ArrayList<String>(Arrays.asList(querySerial.split("\r\n")));
				if (myList.size() <= 100) {
					Page<ISoftpinDetailData> lstDirectTrans = softpinRepository.querySoftpins(myList, pageable);
					System.out.println("Total record:" + lstDirectTrans.getTotalElements());
					model.addAttribute("lstPinDetail", lstDirectTrans);
					List<ISoftpinDetailData> lstData = lstDirectTrans.getContent();
					log.info(stringBuffer.toString());
				}
			} else {
				return "redirect:/login";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "report/searchPin";
	}
	
	@RequestMapping(PATH_QUERYVTT_DATA_PIN)
	public ModelAndView queryVTTDataPins(Model model,
			@Valid @ModelAttribute("cardDetail") CardDetail cardDetailPost			
			) {
		ModelAndView mav = new ModelAndView("report/searchVttData");
		CardDetail cardDetail = new CardDetail();
		mav.addObject("cardDetail",cardDetail);
		try {
			
			StringBuffer stringBuffer = new StringBuffer();
			stringBuffer.append("request to "+PATH_QUERYVTT_DATA_PIN+"" + Constants.RETURN_NEWLINE_CHAR);
			
			
			if (getCurrentSessionAuthen()!=null) {	
				System.out.println("start compare");
				
				String checkSampleModal = "{\r\n"
						+ "  \"code\": 0,\r\n"
						+ "  \"message\": \"Thành công\",\r\n"
						+ "  \"status_card_message\": \"Ma data code nay da su dung\",\r\n"
						+ "  \"status_card\": 1,\r\n"
						+ "  \"serial\": \"000000003142\"\r\n"
						+ "}";
				String inputJson = "{\r\n"
						+ "    \"serial\": \"{inputSeri}\"\r\n"
						+ "}";
				
				inputJson = inputJson.replace("{inputSeri}", cardDetailPost.getSerial());
				String strQueryRs = Commons.postDataToCallbackLink(checkCardVttDataUrl, inputJson);
				
				CardDetail queryRs = null;
				if (strQueryRs != null) {
					queryRs = new Gson().fromJson(strQueryRs, CardDetail.class);					
				} else {
					queryRs = new CardDetail();
					queryRs.setStatus_card_message("Truy vấn thất bại, liên hệ với admin để được hỗ trợ");
					queryRs.setStatus(-1);
					queryRs.setSerial(cardDetailPost.getSerial());
				}
				mav.addObject("cardDetail", queryRs);
			} else {				
				return  new ModelAndView("redirect:/login");				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			CardDetail queryRs = new CardDetail();
			queryRs.setStatus_card_message("Truy vấn thông tin :"+ cardDetailPost.getSerial()+" thất bại");
			mav.addObject("cardDetail",queryRs);
		}
		return mav;
	}
	
	@RequestMapping(PATH_DIRECT_SUMMARY_REPORT)
	public String directTopupSummary(Model model,
			HttpServletResponse response,
			@ModelAttribute Paging paging,
			@RequestParam(required=false, defaultValue="") String exportExcel
			) {
		try {
			StringBuffer stringBuffer = new StringBuffer();
			stringBuffer.append("request to "+PATH_DIRECT_SUMMARY_REPORT + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("page:"+ paging.getPage() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("size:"+ paging.getSize() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("from:"+ paging.getFromDate() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("to:"+ paging.getToDate() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("exportExcel:"+ exportExcel + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("requestId:"+ paging.getRequestId() + Constants.RETURN_NEWLINE_CHAR);
			
			Calendar from = Calendar.getInstance();
			from.setTime(paging.getFromDate()==null?new Date():paging.getFromDate());
			from.set(Calendar.HOUR_OF_DAY, 0);
			from.set(Calendar.MINUTE, 0);
			from.set(Calendar.SECOND, 1);
			from.set(Calendar.MILLISECOND, 0);
			String strFrom = DateConvert.dateToString(from.getTime(), "yyyy-MM-dd HH:mm:ss.SSS");
			Calendar to = Calendar.getInstance();
			to.setTime(paging.getToDate()==null?new Date():paging.getToDate());
			to.set(Calendar.HOUR_OF_DAY, 23);
			to.set(Calendar.MINUTE, 59);
			to.set(Calendar.SECOND, 59);
			to.set(Calendar.MILLISECOND, 999);
			String strTo = DateConvert.dateToString(to.getTime(), "yyyy-MM-dd HH:mm:ss.SSS");
			
			if (getCurrentSessionAuthen() !=null) {
				if(!exportExcel.equalsIgnoreCase("exportExcel"))
				{					
					Sort sortable = Sort.by("direct_topup_transaction_date").descending();;
					Pageable pageable = PageRequest.of(paging.getPage(), paging.getSize(), sortable);
					List<String> lstRequestid =null;
					if(paging.getRequestId()!=null)
						lstRequestid = new ArrayList<String>(Arrays.asList((paging.getRequestId()==null?"":paging.getRequestId()).split("\r\n")));
					List<IDirectTopupSummary> lstDirectTrans = null;
					if(lstRequestid!=null)
					{
						System.out.println(strFrom);
						System.out.println(strTo);
						lstDirectTrans = reportService.getDirectSummaryReport(strFrom, strTo, "A");
						System.out.println(new Gson().toJson(lstDirectTrans.get(0)));
					}else {
						System.out.println(strFrom);
						System.out.println(strTo);
						lstDirectTrans = reportService.getDirectSummaryReport(strFrom, strTo, "A");						
					}					
					System.out.println("Total record:" + lstDirectTrans.size());
					model.addAttribute("lstDirectTrans", lstDirectTrans);
					log.info(stringBuffer.toString());
				}else {
					stringBuffer.append("start export");
					String[] fileName = reportService.getDirectTopupZipFile(from.getTime(), to.getTime(), null);
					if(fileName != null)
					{
						String zipFile = Commons.zipListFiles(fileName);
						File file = new File(zipFile);
						stringBuffer.append("download file:"+ zipFile);
						if (file.exists()) {
							// get the mimetype
							String mimeType = URLConnection.guessContentTypeFromName(file.getName());
							if (mimeType == null) {
								// unknown mimetype so set the mimetype to application/octet-stream
								mimeType = "application/octet-stream";
							}
							response.setContentType(mimeType);
							/**
							 * In a regular HTTP response, the Content-Disposition response header is a
							 * header indicating if the content is expected to be displayed inline in the
							 * browser, that is, as a Web page or as part of a Web page, or as an
							 * attachment, that is downloaded and saved locally.
							 * 
							 */
							/**
							 * Here we have mentioned it to show inline
							 */
							response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));
							
							// Here we have mentioned it to show as attachment
							// response.setHeader("Content-Disposition", String.format("attachment;
							// filename=\"" + file.getName() + "\""));
							
							response.setContentLength((int) file.length());
							
							InputStream inputStream;
							try {
								inputStream = new BufferedInputStream(new FileInputStream(file));
								FileCopyUtils.copy(inputStream, response.getOutputStream());
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
					log.info(stringBuffer.toString());
				}
			} else {
				return "redirect:/login";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		return PATH_DIRECT_SUMMARY_REPORT.substring(1, PATH_DIRECT_SUMMARY_REPORT.length());
	}
	@RequestMapping(PATH_STORE_SUMMARY_LOG)
	public String storeSummaryLogs(Model model,
			HttpServletResponse response,
			@ModelAttribute Paging paging,
			@RequestParam(required=false, defaultValue="") String exportExcel
			) {
		try {
			StringBuffer stringBuffer = new StringBuffer();
			stringBuffer.append("request to "+PATH_STORE_SUMMARY_LOG + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("page:"+ paging.getPage() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("size:"+ paging.getSize() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("from:"+ paging.getFromDate() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("to:"+ paging.getToDate() + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("exportExcel:"+ exportExcel + Constants.RETURN_NEWLINE_CHAR);
			stringBuffer.append("requestId:"+ paging.getRequestId() + Constants.RETURN_NEWLINE_CHAR);
			
			Calendar from = Calendar.getInstance();
			from.setTime(paging.getFromDate()==null?new Date():paging.getFromDate());
			from.set(Calendar.HOUR_OF_DAY, 0);
			from.set(Calendar.MINUTE, 0);
			from.set(Calendar.SECOND, 1);
			from.set(Calendar.MILLISECOND, 0);
			String strFrom = DateConvert.dateToString(from.getTime(), "yyyy-MM-dd HH:mm:ss.SSS");
			Calendar to = Calendar.getInstance();
			to.setTime(paging.getToDate()==null?new Date():paging.getToDate());
			to.set(Calendar.HOUR_OF_DAY, 23);
			to.set(Calendar.MINUTE, 59);
			to.set(Calendar.SECOND, 59);
			to.set(Calendar.MILLISECOND, 999);
			String strTo = DateConvert.dateToString(to.getTime(), "yyyy-MM-dd HH:mm:ss.SSS");
			
			if (getCurrentSessionAuthen() !=null) {
				if(!exportExcel.equalsIgnoreCase("exportExcel"))
				{					
					Sort sortable = Sort.by("direct_topup_transaction_date").descending();;
					Pageable pageable = PageRequest.of(paging.getPage(), paging.getSize(), sortable);
					List<String> lstRequestid =null;
					if(paging.getRequestId()!=null)
					lstRequestid = new ArrayList<String>(Arrays.asList((paging.getRequestId()==null?"":paging.getRequestId()).split("\r\n")));
					List<StoreSummaryLogs> lstDirectTrans = null;
					if(lstRequestid!=null)
					{						
						lstDirectTrans = reportService.getStoreSummaryLogs(from.getTime(), to.getTime(), "A");
						System.out.println(new Gson().toJson(lstDirectTrans.get(0)));
					}else {					
						lstDirectTrans = reportService.getStoreSummaryLogs(from.getTime(), to.getTime(), "A");						
					}					
					System.out.println("Total record:" + lstDirectTrans.size());
					model.addAttribute("lstDirectTrans", lstDirectTrans);
					log.info(stringBuffer.toString());
				}else {
					stringBuffer.append("start export");
					List<StoreSummaryLogs> lstDirectTrans = null;
					lstDirectTrans = reportService.getStoreSummaryLogs(from.getTime(), to.getTime(), "A");
//					.append(iDirectTransEntity.getProductId() +",")
//					.append(iDirectTransEntity.getProductName() +",")
//					.append(iDirectTransEntity.getTotalQuantity() +",")
//					.append(iDirectTransEntity.getSnapshotDate() +"")
					final String HEADER = "ProductId,Product Name, Total quantity, Snapshot date";
					String[] fileName = reportService.writeStoreSummaryLogsToFiles(HEADER,lstDirectTrans);
					if(fileName != null)
					{
						String zipFile = Commons.zipListFiles(fileName);
	 					File file = new File(zipFile);
	 					stringBuffer.append("download file:"+ zipFile);
						if (file.exists()) {
							// get the mimetype
							String mimeType = URLConnection.guessContentTypeFromName(file.getName());
							if (mimeType == null) {
								// unknown mimetype so set the mimetype to application/octet-stream
								mimeType = "application/octet-stream";
							}
							response.setContentType(mimeType);
							/**
							 * In a regular HTTP response, the Content-Disposition response header is a
							 * header indicating if the content is expected to be displayed inline in the
							 * browser, that is, as a Web page or as part of a Web page, or as an
							 * attachment, that is downloaded and saved locally.
							 * 
							 */
							/**
							 * Here we have mentioned it to show inline
							 */
							response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

							// Here we have mentioned it to show as attachment
							// response.setHeader("Content-Disposition", String.format("attachment;
							// filename=\"" + file.getName() + "\""));

							response.setContentLength((int) file.length());

							InputStream inputStream;
							try {
								inputStream = new BufferedInputStream(new FileInputStream(file));
								FileCopyUtils.copy(inputStream, response.getOutputStream());
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
					log.info(stringBuffer.toString());
				}
			} else {
				return "redirect:/login";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		return PATH_STORE_SUMMARY_LOG.substring(1, PATH_STORE_SUMMARY_LOG.length());
	}
	
}
