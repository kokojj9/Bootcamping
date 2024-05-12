package com.kh.bootcamping.common.template;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.springframework.stereotype.Component;

import com.kh.bootcamping.member.controller.MailCheckController;

@Component
public class PropertyTemplate {

	public Properties getProperties() {
		Properties prop = new Properties();
		String sqlfile = MailCheckController.class.getResource("/configProperties/admin.properties").getPath();
		try {
			prop.load(new FileInputStream(sqlfile));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return prop;
	}
	
}
