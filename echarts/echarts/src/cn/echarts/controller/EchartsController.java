package cn.echarts.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.entity.JsonData;
import cn.entity.Product;
import cn.entity.TestlineData;
import cn.entity.Visit;

import com.alibaba.fastjson.JSONArray;
/**
 * 
 * @author yxx
 *
 */
@Controller
public class EchartsController {

	
	/**
	 * 柱状图
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/getColumEcharts")
	@ResponseBody
	public String getColumEcharts(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("getColumEcharts.................");
		List<Product> list = new ArrayList<Product>();
        
        //这里把“类别名称”和“销量”作为两个属性封装在一个Product类里，每个Product类的对象都可以看作是一个类别（X轴坐标值）与销量（Y轴坐标值）的集合
        list.add(new Product("衬衣", 10));
        list.add(new Product("短袖", 20));
        list.add(new Product("大衣", 30));
      
        String json = JSONArray.toJSONString(list);
        System.out.println("json>>>>>>>>>>>> " + json);
		return  json;
	}

	
	/**
	 * 饼图
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/getPieEcharts")
	@ResponseBody
	public String getPieEcharts(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("gePieEcharts.................");
	    List<Visit> list = new ArrayList<Visit>();
	    list.add(new Visit("直接访问", 10));
	    list.add(new Visit("邮件营销", 20));
	    list.add(new Visit("联盟广告", 30));
	    list.add(new Visit("搜索引擎", 40));
	    Map<String, List<Visit>> map = new HashMap<String, List<Visit>>();
	    map.put("visitInfo", list);
	    return JSONArray.toJSONString(map);
	}
	
	
	/**
	 * 折线图
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/getLineEcharts")
	@ResponseBody
	public String getLineEcharts(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("getLineEcharts.................");
		
		Integer[] data1 = {120, 132, 101, 134, -90, 230, 210};  
        Integer[] data2 = {20, 232, 11, -144, 90, 30, 90};  
        Integer[] data3 = {180, -12, 161, 84, 60, 230, -10};  
          
        JsonData jd1 = new JsonData();  
        jd1.setName("测试数据1");  
        jd1.setData(data1);
          
        JsonData jd2 = new JsonData();  
        jd2.setName("测试数据2");  
        jd2.setData(data2);
          
        JsonData jd3 = new JsonData();  
        jd3.setName("测试数据3");  
        jd3.setData(data3);  
          
        List<JsonData> data = new ArrayList<JsonData>();  
        data.add(jd1);  
        data.add(jd2);  
        data.add(jd3);  
        
        
        String[] xcontent = {"测试","b","c","d","e","f","g","h","i"};  
          
        TestlineData tld = new TestlineData();  
        tld.setXcontent(xcontent);  
        tld.setData(data);  
        
	    return JSONArray.toJSONString(tld);
	}

}
