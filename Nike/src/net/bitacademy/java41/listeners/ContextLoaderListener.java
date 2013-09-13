package net.bitacademy.java41.listeners;

import java.io.FileReader;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class ContextLoaderListener implements ServletContextListener {
	Hashtable<String,Object> objTable = new Hashtable<String,Object>();
	ServletContext ctx;
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		ctx = event.getServletContext();
		ctx.setAttribute("rootPath", ctx.getContextPath());
		
		try {
			prepareObjects(ctx.getRealPath("/WEB-INF/context.properties"));	
			prepareDependancy();
		} catch (Exception e) {
			e.printStackTrace();
		}
   
	}
	
	private void prepareObjects(String filePath) throws Exception {
		Properties props = new Properties();
		props.load(new FileReader(filePath));
		
		Enumeration enums = props.keys();
		
		String key = null;
		String value =null;
		
		Class clazz = null;
		while(enums.hasMoreElements()){
			key=(String)enums.nextElement();
			value=(String)props.get(key);
			if(value.charAt(0)=='"'){
				objTable.put(key,value.substring(1,value.length()-1));
			}else{
				clazz = Class.forName(value);   
				objTable.put(key, clazz.newInstance()); 
			}
		}
	}
	
	
	
	private void prepareDependancy() {
		Collection<Object> objList = objTable.values();
		for(Object obj:objList){
			if(obj.getClass() != java.lang.String.class){
				injectDependancy(obj);
			}
		}
	}

	private void injectDependancy(Object obj) {
		System.out.println(obj.getClass().getName() + "------");
		Method[] methodList = obj.getClass().getMethods();
		for(Method m : methodList){
			if(m.getName().startsWith("set")){
				System.out.println("===> " + m.getName());
				m.getParameterTypes()
			}
		}
				
	}



	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}
}






