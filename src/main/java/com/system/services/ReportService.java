package com.system.services;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import com.system.modals.customize.IDirectTopupSummary;
import com.system.modals.customize.IDirectTopupTransaction;
import com.system.modals.customize.ISoftpinStock;
import com.system.modals.modal.StoreSummaryLogs;
import com.system.repositories.primarydb.SoftpinReportRepository;
import com.system.repositories.primarydb.StoreSummaryLogsRepository;
import com.system.repositories.primarydb.TblDirectTopupTransactionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j2;
import net.bytebuddy.build.Plugin.Engine.Summary;



@Service
@Log4j2
public class ReportService {

	private int maxRecordPerFile;
	
	
	private TblDirectTopupTransactionRepository tblDirectTopupTransactionRepository;	
	private SoftpinReportRepository softPinReportRepositori;
	private StoreSummaryLogsRepository storeSummaryLogsRepository;
	
	
	@Autowired
	public ReportService(TblDirectTopupTransactionRepository tblDirectTopupTransactionRepository,
			SoftpinReportRepository softPinReportRepositori,StoreSummaryLogsRepository storeSummaryLogsRepository) {
		//TODO Auto-generated constructor stub
		this.tblDirectTopupTransactionRepository = tblDirectTopupTransactionRepository;
		this.softPinReportRepositori = softPinReportRepositori;
		this.storeSummaryLogsRepository = storeSummaryLogsRepository;
	}
	
	/**
	 * Download file zip
	 * @param request
	 * @return
	 */
	public String[] getDirectTopupZipFile(Date fromDate, Date toDate, List<String> directStatus) {
		String[] listFile = null;
		Long totalRec = tblDirectTopupTransactionRepository.getTotalDirectTransaction(fromDate, toDate);
		if (totalRec <= maxRecordPerFile) {
			String outputFile = saveTransactionToFiles(fromDate, toDate, 0, maxRecordPerFile);
			listFile = new String[1];
			listFile[0] = outputFile;
		} else {
			int odd = (int) (totalRec % maxRecordPerFile);
			int totalFile = (int) (totalRec / maxRecordPerFile);
			//Nếu dư >0 thì plus thêm 1
			if (odd > 0)
				totalFile += 1;
			listFile = new String[totalFile];
			for (int i = 0; i < totalFile; i++) {
				int page = i*maxRecordPerFile;
				String outputFile = saveTransactionToFiles(fromDate, toDate, page, maxRecordPerFile);
				listFile[i] = outputFile;
			}
		}
		return listFile;
	}
	
	public String[] writeStoreSummaryLogsToFiles(String header, List<StoreSummaryLogs> lstRecord)
	{		
		String[] fileOutput = new String[1];
		try {						
			System.out.println("Tong so gd:"+ lstRecord.size());
			if(lstRecord.size() > 0 )
			{
				final String fileHeader = header + "\r\n";
				StringBuffer stBuff = new StringBuffer();
				stBuff.append(fileHeader);
				lstRecord.stream().forEach(iDirectTransEntity->stBuff
						.append(iDirectTransEntity.getProductId() +",")
						.append(iDirectTransEntity.getProductName() +",")
						.append(iDirectTransEntity.getTotalQuantity() +",")
						.append(iDirectTransEntity.getSnapshotDate() +"\r\n")
						);

				String filename =System.currentTimeMillis() + ".csv"; 
//						request.getPaging().getFrom_date() + request.getPaging().getTo_date()+".csv"; 
				String filePath = "files/"+ filename;
				File yourFile = new File(filePath);
				yourFile.getParentFile().mkdirs();
				yourFile.createNewFile(); // if file already exists will do nothing 
				FileOutputStream outputStream = new FileOutputStream(filePath);
				byte[] strToBytes = stBuff.toString().getBytes();
				outputStream.write(strToBytes);
				outputStream.close();
				
//				String outputFile = "files/"+ System.currentTimeMillis()+".zip";
//		        FileOutputStream fos = new FileOutputStream(outputFile);
//		        ZipOutputStream zipOut = new ZipOutputStream(fos);
//		        File fileToZip = new File(filePath);
//		        FileInputStream fis = new FileInputStream(fileToZip);
//		        ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
//		        zipOut.putNextEntry(zipEntry);
//		        byte[] bytes = new byte[1024];
//		        int length;
//		        while((length = fis.read(bytes)) >= 0) {
//		            zipOut.write(bytes, 0, length);
//		        }
//		        zipOut.close();
//		        fis.close();
//		        fos.close();
//		        return outputFile;
				fileOutput[0] = yourFile.getAbsolutePath();
				return fileOutput;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.fatal("writeStoreSummaryLogsToFiles",e);
		}
		return null;
	}
	public String saveTransactionToFiles(Date fromDate, Date toDate, int page, int size)
	{
		List<IDirectTopupTransaction> lstTransaction=null;
		try {			
			lstTransaction = tblDirectTopupTransactionRepository.getDirectTopupTransactionInputSize(fromDate, toDate, page, size);
			System.out.println("Tong so gd:"+ lstTransaction.size());
			if(lstTransaction.size() > 0 )
			{
				final String fileHeader = "telco,tenDoiTac,requestId,transIdVpay,ngayGd,ketQuaFinal,menhgia,chietkhau\r\n";
				StringBuffer stBuff = new StringBuffer();
				stBuff.append(fileHeader);
				lstTransaction.stream().forEach(iDirectTransEntity->stBuff
						.append(iDirectTransEntity.getTelco() +",")
						.append(iDirectTransEntity.getTenDoiTac() +",")
						.append(iDirectTransEntity.getRequestId() +",")
						.append(iDirectTransEntity.getTransIdVpay() +",")
						.append(iDirectTransEntity.getNgayGd() +",")
						.append(iDirectTransEntity.getKetQuaFinal() +",")
						.append(iDirectTransEntity.getMenhgia() +",")
						.append(iDirectTransEntity.getChietkhau() +"\r\n"));
//				for (Object object : lstTransaction) {
//					IDirectTopupTransaction entity = (IDirectTopupTransaction)object;
//					stBuff.append(entity.getTelco() +",");
//					stBuff.append(entity.getTenDoiTac() +",");
//					stBuff.append(entity.getRequestId() +",");
//					stBuff.append(entity.getTransIdVpay() +",");
//					stBuff.append(entity.getNgayGd() +",");
//					stBuff.append(entity.getKetQuaFinal() +",");
//					stBuff.append(entity.getMenhgia() +",");
//					stBuff.append(entity.getChietkhau() +"\r\n");
//				}
				String filename =System.currentTimeMillis() + ".csv"; 
//						request.getPaging().getFrom_date() + request.getPaging().getTo_date()+".csv"; 
				String filePath = "files/"+ filename;
				File yourFile = new File(filePath);
				yourFile.getParentFile().mkdirs();
				yourFile.createNewFile(); // if file already exists will do nothing 
				FileOutputStream outputStream = new FileOutputStream(filePath);
			    byte[] strToBytes = stBuff.toString().getBytes();
			    outputStream.write(strToBytes);
			    outputStream.close();
				
//				String outputFile = "files/"+ System.currentTimeMillis()+".zip";
//		        FileOutputStream fos = new FileOutputStream(outputFile);
//		        ZipOutputStream zipOut = new ZipOutputStream(fos);
//		        File fileToZip = new File(filePath);
//		        FileInputStream fis = new FileInputStream(fileToZip);
//		        ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
//		        zipOut.putNextEntry(zipEntry);
//		        byte[] bytes = new byte[1024];
//		        int length;
//		        while((length = fis.read(bytes)) >= 0) {
//		            zipOut.write(bytes, 0, length);
//		        }
//		        zipOut.close();
//		        fis.close();
//		        fos.close();
//		        return outputFile;
		        return yourFile.getAbsolutePath();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.fatal("saveTransactionToFiles",e);
		}
		return null;
	}
	
	
	
	public List<ISoftpinStock> getListSoftpinStock()
	{
		return softPinReportRepositori.getSoftpinStockReport();
	}
	
	public List<IDirectTopupSummary> getDirectSummaryReport(String fromdate, String todate, String transactionResult)
	{
		return tblDirectTopupTransactionRepository.getDirectTopupSummary(fromdate, todate, transactionResult);
	}
	
	public List<StoreSummaryLogs> getStoreSummaryLogs(Date fromdate, Date todate, String transactionResult)
	{
		return storeSummaryLogsRepository.getSoftpinStockReport(fromdate, todate);
	}
	
//	public List<IDirectTopupStatistic> getDirectTopupStatistic(String from, String to)
//	{
//		return tblDirectTopupTransactionRepository.getDirectTopupStatistic(from, to);
//	}
	
	public static void main(String[] args) {
		System.out.println(17500%1000);
	}
}
