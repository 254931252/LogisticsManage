package service;

import org.jfree.chart.JFreeChart;

public interface BusinessStatisticsService {
	
	public JFreeChart drawPicture(int type,String typeName,String startDate,String endDate,String proName);
	
	public JFreeChart changeConsider(int type,String typeName,String startDate,String endDate);

}
