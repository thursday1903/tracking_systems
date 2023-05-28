/*
 * The MIT License
 *
 * Copyright 2020 Ozar <gosocial2@ozar.net>.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package com.system;

import java.util.TimeZone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
@SpringBootApplication
@EnableScheduling
public class MainApplication extends SpringBootServletInitializer {

	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MainApplication.class);
    }

	public static void main(String[] args) {
		setTimeZone();
		SpringApplication.run(MainApplication.class, args);
	}
	
	private static void setTimeZone() {
		String defaultCharacterEncoding = System.getProperty("file.encoding");
		System.out.println("defaultCharacterEncoding by property: " + defaultCharacterEncoding);
		System.setProperty("file.encoding", "UTF-8");
		defaultCharacterEncoding = System.getProperty("file.encoding");
		System.out.println("defaultCharacterEncoding by property reset: " + defaultCharacterEncoding);
		String defaultTimeZone = "Asia/Bangkok";
		// checking default time zone
		String timezoneId = defaultTimeZone;
		// Calendar.getInstance().getTimeZone().getID();
		// create time zone object

		TimeZone tzone = TimeZone.getTimeZone(timezoneId);

		System.out.println("Current TZ:" + tzone);
		// set time zone to default
		tzone.setDefault(tzone);

		// checking default time zone
		System.out.println("Default time zone:" + tzone);
	}
}
