package com.system.commons;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.Inet4Address;
import java.net.URLDecoder;
import java.net.UnknownHostException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Commons {

	public final static long SECOND_MILLIS = 1000;
    public final static long MINUTE_MILLIS = SECOND_MILLIS*60;
    public final static long HOUR_MILLIS = MINUTE_MILLIS*60;
    public final static long DAY_MILLIS = HOUR_MILLIS*24;
    public final static long YEAR_MILLIS = DAY_MILLIS*365;
	private static final String USER_AGENT = "Mozilla/5.0";
	private static final Logger logger = LoggerFactory.getLogger(Commons.class);
	private static String localServeriP;
	private static final DecimalFormat df = new DecimalFormat("000,000");
	private static final String EMAIL_REGEX = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" 
	        + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
	
	public Commons() {
		// TODO Auto-generated constructor stub
	}

	public static String getLocalIpAddress()
	{
		
		if(localServeriP==null)
			try {
				localServeriP = Inet4Address.getLocalHost().getHostAddress();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return localServeriP;
	}
	
	public static Object loadClassByName(String className) {
		Object chargingInterface = null;
		try {
			Class<?> clazz = Class.forName(className);

			// Get the private constructor.
			Constructor<?> cons = clazz.getDeclaredConstructor();

			// Since it is private, make it accessible.
			cons.setAccessible(true);

			// Create new object.
			chargingInterface = (Object) cons.newInstance();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("LOAD CLASS FAIL[" + className + "]", e);
		}
		return chargingInterface;
	}

	

	/**
	 * - Check a string is empty
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isEmpty(String value) {
		return (value == null || value.equals(""));
	}

	public static Boolean patternMatch(String regex, String input) throws Exception {
		try {
			return Pattern.matches(regex, input);
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public static String getClientIp(@Context HttpServletRequest requestContext) {
		String clientIp = "N/A";
		try {
			String header = requestContext.getHeader("X-Forwarded-For");
			clientIp = header;
			if (clientIp == null) {
				clientIp = requestContext.getRemoteHost();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return clientIp;
	}

	/**
	 * @param date
	 *            (+ or -)
	 * @param hour
	 *            (+ or -)
	 * @param min(+
	 *            or -)
	 * @param second(+
	 *            or -)
	 * @return
	 */
	public static Date caculateDateAtSpecificTime(int date, int hour, int min, int second) {
		Calendar cal = Calendar.getInstance();
		if (date != 0) {
			cal.add(Calendar.DATE, date);
		} else if (hour != 0) {
			cal.add(Calendar.HOUR, hour);
		} else if (min != 0) {
			cal.add(Calendar.MINUTE, min);
		} else if (second != 0) {
			cal.add(Calendar.SECOND, second);
		}
		return cal.getTime();
	}

	public static String bytesToHex(final byte[] bytes) {
		final StringBuilder buf = new StringBuilder(bytes.length * 2);
		for (final byte b : bytes) {
			final String hex = Integer.toHexString(0xff & b);
			if (hex.length() == 1) {
				buf.append("0");
			}
			buf.append(hex);
		}
		return buf.toString();
	}

	


	
	
	public static Object cloneObject(Object obj){
        try{
            Object clone = obj.getClass().newInstance();
            for (Field field : obj.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                field.set(clone, field.get(obj));
            }
            return clone;
        }catch(Exception e){
            return null;
        }
    }
	
	
	
	public static long subStractTwoDate(Date firstDate, Date secondDate,TimeUnit time)
	{
		long diff = secondDate.getTime() - firstDate.getTime();

//      TimeUnit time = TimeUnit.DAYS; 
        long diffrence = time.convert(diff, time);
        return diffrence;
	}
	
	public static int daysDiff(Date earlierDate, Date laterDate) {
		if (earlierDate == null || laterDate == null)
			return 0;
		
		return (int) ((laterDate.getTime() / DAY_MILLIS) - (earlierDate
				.getTime() / DAY_MILLIS));
	}
	
	
	public static String formatDecimalValue(Long value) {
		return df.format(value);
	}
	

	
	public static Date getDayOfThisMonth(Boolean islastDayOfMonth) {
		Calendar calendarFrom = Calendar.getInstance();
		Date retDate = new Date();
		try {
			if (!islastDayOfMonth) {
				calendarFrom.set(Calendar.DAY_OF_MONTH, 1);
				
				retDate = DateConvert.stringToDate(DateConvert.dateToString(calendarFrom.getTime(), "yyyy/MM/dd") + " 00:00:00", "yyyy/MM/dd HH:mm:ss");
			} else {
				Calendar calendarTo = Calendar.getInstance();
				int lastDayOfMonth = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH);
				calendarTo.set(Calendar.DAY_OF_MONTH, lastDayOfMonth);
				retDate = DateConvert.stringToDate(DateConvert.dateToString(calendarTo.getTime(), "yyyy/MM/dd") + " 23:59:59", "yyyy/MM/dd HH:mm:ss");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return retDate;
//		
//		String date = "1/13/2012";
//		LocalDate lastDayOfMonth = LocalDate.parse(date, DateTimeFormatter.ofPattern("M/dd/yyyy"))
//		       .with(TemporalAdjusters.lastDayOfMonth());
	
		
	}
	
	/**
	 * Nén danh sách file vào 1 file đầu ra
	 * @param listFile
	 * @return
	 */
	public static String zipListFiles(String[] listFile)
	{
		String outPutFileZip = "";
		try {
			String outputFile = "files/"+ System.currentTimeMillis()+".zip";
			FileOutputStream fos = new FileOutputStream(outputFile);
	        ZipOutputStream zipOut = new ZipOutputStream(fos);
	        for (String srcFile : listFile) {
	            File fileToZip = new File(srcFile);
	            FileInputStream fis = new FileInputStream(fileToZip);
	            ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
	            zipOut.putNextEntry(zipEntry);

	            byte[] bytes = new byte[1024];
	            int length;
	            while((length = fis.read(bytes)) >= 0) {
	                zipOut.write(bytes, 0, length);
	            }
	            fis.close();
	        }
	        zipOut.close();
	        fos.close();
	        outPutFileZip = outputFile;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("zipListFiles",e);
		}
        return outPutFileZip;
	}
	
	public static String postDataToCallbackLink(String url, String jsonData) {
		// TODO Auto-generated method stub
		// String URLPAYMENT =
		// "http://103.68.241.73:8080/Sandbox/MoneyTransfer/NAPAS";//Sandbox
		String URLPAYMENT = url;// Production
		final RequestConfig.Builder requestConfig = RequestConfig.custom();
		requestConfig.setConnectTimeout(20 * 1000);
		CloseableHttpClient httpClient = HttpClientBuilder.create().setDefaultRequestConfig(requestConfig.build()).build(); // Use
		// this
		// instead
		StringBuilder sb = new StringBuilder();
//		log.info(">> CALL URL:" + url);
//		log.info(">> REQUEST DATA:" + jsonData);
		
		try {
			HttpPost request 		= new HttpPost(URLPAYMENT);
			StringEntity params 	= new StringEntity(jsonData,"UTF-8");
			request.addHeader("Content-Type", "application/json");
			request.setEntity(params);
			HttpResponse response 	= httpClient.execute(request);
			
			InputStream ips 		= response.getEntity().getContent();
			BufferedReader buf 		= new BufferedReader(new InputStreamReader(ips, "UTF-8"));
			
			if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
				System.out.println("CALL ham SignIn RESPONSE KHAC 200");
				// throw new
				// Exception(response.getStatusLine().getReasonPhrase());
			}
			
			String s;
			while (true) {
				s = buf.readLine();
				if (s == null || s.length() == 0)
					break;
				sb.append(s);
			}
			buf.close();
			ips.close();
			
//			log.info(">> RESPONSE toString:" + sb.toString());
//			log.info(">> HTTP RS StatusLine:" + response.getStatusLine());
			
			// handle response here...
		} catch (Exception ex) {
			// handle exception here
			ex.printStackTrace();
			
		} finally {
			// Deprecated
			try {
				httpClient.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
	
	public static String callHttpGet(String url) {
		logger.info("CALL HTTP GET:" + url);
		HttpClient client = null;
		StringBuffer result = new StringBuffer();
		try {
			// HttpClient client =
			// HttpClientBuilder.create().setDefaultCookieStore(cookieStore).build();
			client = HttpClientBuilder.create().build();
			
			HttpGet request = new HttpGet(url);
			
			// add request header
			request.addHeader("User-Agent", USER_AGENT);
			HttpResponse response_ = client.execute(request);
			
			int responseCode = response_.getStatusLine().getStatusCode();
			result = new StringBuffer();
			if (responseCode == HttpURLConnection.HTTP_OK || responseCode == HttpURLConnection.HTTP_CREATED) { // success
				BufferedReader rd = new BufferedReader(new InputStreamReader(response_.getEntity().getContent()));
				
				String line = "";
				while ((line = rd.readLine()) != null) {
					result.append(line);
				}
				System.out.println(URLDecoder.decode(result.toString()));
			} else {
				System.out.println("GET request not worked");
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("CALL HTTP[" + url + "] GET FAIL", e);
		} finally {
			
		}
		logger.info("CALL HTTP GETRP:" + result.toString());
		return result.toString();
	}
	
	/**
	 * @param message content
	 * @param teleUrl url tele
	 * @param chatId chatid to send msg
	 */
	public static void composeAlertToTele(String message, String teleUrl, String chatId) {
		String url = teleUrl;
		HttpPost post = new HttpPost(url);

		// add request parameter, form parameters
		List<NameValuePair> urlParameters = new ArrayList<>();
		urlParameters.add(new BasicNameValuePair("chat_id", chatId));
		urlParameters.add(new BasicNameValuePair("text", message));
		// urlParameters.add(new BasicNameValuePair("custom", "secret"));

		try {
			post.setEntity(new UrlEncodedFormEntity(urlParameters));

			try (CloseableHttpClient httpClient = HttpClients.createDefault();
					CloseableHttpResponse response = httpClient.execute(post)) {

				System.out.println(EntityUtils.toString(response.getEntity()));
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("composeAlertToTele",e);
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("composeAlertToTele",e);
		}
	}
}
