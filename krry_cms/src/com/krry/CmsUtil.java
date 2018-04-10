package com.krry;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Iterator;
import java.util.Map;

/**
 * CmsUtil 网页静态化的工具类
 * @author krry
 * @version 1.0
 *
 */
public class CmsUtil {

	public static boolean getHtmlByUrl(String u,String charset,String htmlPath){
		boolean result = false;
		
		InputStream in = null;
		BufferedReader reader = null;
		BufferedWriter writer = null;
		//通过url生成静态页面
		try {
			URL url = new URL(u);
			//打开连接
			URLConnection connection = url.openConnection();
			
			in = connection.getInputStream();
			//高效读取
			reader = new BufferedReader(new InputStreamReader(in,charset));
			StringBuffer sBuffer = new StringBuffer();
			
			while(reader.ready()){
				sBuffer.append(reader.readLine()+"\n");
			}
			
			File file = new File(htmlPath);
			//高效写入
			writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),charset));
			writer.write(sBuffer.toString());
			
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 根据模板生成html
	 * @param templatePath
	 * @param htmlPath
	 * @param values
	 * @return
	 */
	public static boolean getHtmlByTemplate(String templatePath,String htmlPath,Map<String,String> values){
		boolean flag = false;
		FileInputStream in = null;
		BufferedReader br = null;
		BufferedWriter write = null;
		//通过模板生成静态页面
		//读取模板文件里面的内容
		try {
			in = new FileInputStream(templatePath);
			//高效读取
			br = new BufferedReader(new InputStreamReader(in,"utf-8"));
			String jsContent = "";
			StringBuffer content = new StringBuffer();
			while((jsContent = br.readLine()) != null){
				content.append(jsContent+"\n");
			}
			
			/*Map<String, String> values = new HashMap<String,String>();
			values.put("##title##", "筱月");
			values.put("##author##", "krry");
			values.put("##content##", "这是内容哦~~~~~");*/
			Iterator<String> iterator = values.keySet().iterator();
			//将StringBuffer变成String对象
			String contentReal = content.toString();
			while(iterator.hasNext()){
				String key = iterator.next();
				contentReal = contentReal.replaceAll(key, values.get(key));
			}
			//将文件保存到html
			File file = new File(htmlPath);
			write = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file),"utf-8"));
			write.write(contentReal);
			System.out.println("执行成功");
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				write.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public static void main(String[] args){
		
	}
}





