/**
 * 
 */
package web.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import service.SenderService;
import entity.Senders;

/**
 * @author Junhua
 * @ClassName:TaskAction.java
 * @Version 版本
 * @ModifyedBy 修改人
 * @Copyright 公司名称
 * @date 2016年12月14日上午11:29:25
 */
@Controller
public class TaskAction {
	@Resource
	private SenderService senderService;
	@ResponseBody
	@RequestMapping(value="/allSender")
	public void allTask(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println(11111);
		List<Senders> list = senderService.allSender();
		JSONArray json = new JSONArray();
		for(Senders s:list){
			json.add(s);
		}
		response.getWriter().print(JSON.toJSONString(json));
		
	}
}
