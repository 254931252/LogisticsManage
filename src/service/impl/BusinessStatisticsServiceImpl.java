package service.impl;

import java.awt.Font;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.springframework.stereotype.Service;

import dao.BusinessStatisticsDao;
import service.BusinessStatisticsService;
import util.BusinessStatistics;
import view.RequirementView;

@Service
public class BusinessStatisticsServiceImpl implements BusinessStatisticsService {
	
	@Resource
	private BusinessStatisticsDao businessStatisticsDao;
	
	private static StandardChartTheme standardChartTheme = new StandardChartTheme("CN");;
	
	static{
		//设置标题字体  
		standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,16));
		//设置图例的字体  
		standardChartTheme.setRegularFont(new Font("宋书",Font.PLAIN,14));  
		//设置轴向的字体  
		standardChartTheme.setLargeFont(new Font("宋书",Font.PLAIN,16));
	}

	public BusinessStatisticsDao getBusinessStatisticsDao() {
		return businessStatisticsDao;
	}

	public void setBusinessStatisticsDao(BusinessStatisticsDao businessStatisticsDao) {
		this.businessStatisticsDao = businessStatisticsDao;
	}

	@Override
	public JFreeChart drawPicture(int type, String typeName, String startDate,
			String endDate, String proName) {
		String title;
		List<RequirementView> list;
		JFreeChart jFreeChart = null; 
		//应用主题样式  
		ChartFactory.setChartTheme(standardChartTheme);
		if(!"".equals(proName)){
			title = proName + "    " + startDate + " 至 " + endDate + "需求变化统计";
			list = businessStatisticsDao.selectByProduct(proName, startDate, endDate);
			List<RequirementView> rvList = new ArrayList<RequirementView>();
			if(list.size() != 0){
				String date[] = list.get(0).getCreateDate().split("-");
				int year = Integer.parseInt(date[0]);
				int month = Integer.parseInt(date[1]);
				int day = Integer.parseInt(date[0]);
				int num1 = 0;
				int num2 = 0;
				int num3 = 0;
				for (int i = 0; i < list.size(); i ++) {
					RequirementView rv = list.get(i);
					String theDate[] = rv.getCreateDate().split("-");
					int theYear = Integer.parseInt(theDate[0]);
					int theMonth = Integer.parseInt(theDate[1]);
					day = Integer.parseInt(theDate[2]);
					if(year < theYear) year ++;
					if(month < theMonth) month ++;
					if(day <= 10){
						if(i != 0 && num3 !=0){
							RequirementView requirementView = new RequirementView();
							requirementView.setCreateDate(year + "年" + (month -1) + "月下旬");
							requirementView.setBuyNum(num3);
							rvList.add(requirementView);
							num3 =0;
						}
						num1 += rv.getBuyNum();
					}else if(day <= 20){
						if(i != 0 && num1 != 0){
							RequirementView requirementView = new RequirementView();
							requirementView.setCreateDate(year + "年" + month + "月上旬");
							requirementView.setBuyNum(num1);
							rvList.add(requirementView);
							num1 =0;
						}
						num2 += rv.getBuyNum();
					}else{
						if(i != 0 && num2 != 0){
							RequirementView requirementView = new RequirementView();
							requirementView.setCreateDate(year + "年" + month + "月中旬");
							requirementView.setBuyNum(num2);
							rvList.add(requirementView);
							num2 =0;
						}
						num3 += rv.getBuyNum();
					}
				}
				if(day <= 10){
					RequirementView requirementView = new RequirementView();
					requirementView.setCreateDate(year + "年" + month + "月上旬");
					requirementView.setBuyNum(num1);
					rvList.add(requirementView);
				}else if(day <= 20){
					RequirementView requirementView = new RequirementView();
					requirementView.setCreateDate(year + "年" + month + "月中旬");
					requirementView.setBuyNum(num2);
					rvList.add(requirementView);
				}else{
					RequirementView requirementView = new RequirementView();
					requirementView.setCreateDate(year + "年" + (month -1) + "月下旬");
					requirementView.setBuyNum(num3);
					rvList.add(requirementView);
				}
			}
			Map<String,List<RequirementView>> map = new HashMap<String, List<RequirementView>>();
			map.put(proName, rvList);
			jFreeChart = BusinessStatistics.drawXY(map, title, "时间", "销量");
		}else{
			Map<String,Integer> map = new HashMap<String, Integer>();
			title = typeName + "商品    " + startDate + " 至 " + endDate + "需求统计";
			if(type == 0){
				list = businessStatisticsDao.seleceAll(startDate, endDate);
				if(list.size() != 0){
					for (RequirementView rv : list) {
						map.put(rv.getPtType(), rv.getBuyNum());
					}
				}
			}else{
				list = businessStatisticsDao.selectByType(type,startDate,endDate);
				if(list.size() != 0){
					for (RequirementView rv : list) {
						map.put(rv.getProName(), rv.getBuyNum());
					}
				}
			}
			jFreeChart = BusinessStatistics.drawPie(map, title);
		}
		return jFreeChart;
	}
	

	@Override
	public JFreeChart changeConsider(int type, String typeName,
			String startDate, String endDate) {
		String title;
		List<RequirementView> list;
		JFreeChart jFreeChart = null;
		//应用主题样式  
		ChartFactory.setChartTheme(standardChartTheme);
		Map<String,Integer> map = new HashMap<String, Integer>();
		if(type == 0){
			title = typeName + "商品    " + startDate + " 至 " + endDate + "销量统计";
			list = businessStatisticsDao.seleceAll(startDate, endDate);
			if(list.size() <= 5){
				for (RequirementView rv : list) {
					map.put(rv.getPtType(), rv.getBuyNum());
				}
			}else{
				int num = 0;
				for (int i = 0; i < list.size(); i++) {
					RequirementView rv = list.get(i);
					if(i < 5){
						map.put(rv.getPtType(), rv.getBuyNum());
					}else{
						num += rv.getBuyNum();
					}
				}
				map.put("其他", num);
			}
			jFreeChart = BusinessStatistics.drawPie(map, title);
		}else{
			title = typeName + "商品    " + startDate + " 至 " + endDate + "销量排行";
			list = businessStatisticsDao.selectByType(type, startDate, endDate);
			if(list.size() <= 5){
				jFreeChart = BusinessStatistics.drawBar(list, title, "商品排名", "销量");
			}else{
				List<RequirementView> rvList = new ArrayList<RequirementView>();
				for (int i = 0; i < 5; i ++) {
					rvList.add(list.get(i));
				}
				jFreeChart = BusinessStatistics.drawBar(rvList, title, "商品排名", "销量");
			}
		}
		return jFreeChart;
	}

}
