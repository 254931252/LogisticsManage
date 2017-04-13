package util;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.NumberTickUnit;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import view.RequirementView;

public class BusinessStatistics{

	public static JFreeChart drawPie(Map<String, Integer> map,String title) {
		DefaultPieDataset dPie = new DefaultPieDataset();
		Iterator<Entry<String, Integer>> it = map.entrySet().iterator();
		while(it.hasNext()) {
			Map.Entry<String, Integer> entry = it.next();
			dPie.setValue(entry.getKey(), entry.getValue());
		}
		JFreeChart jChart = ChartFactory.createPieChart3D(title, dPie, true, false, false); 
		PiePlot pieplot = (PiePlot) jChart.getPlot(); //通过JFreeChart 对象获得 
		pieplot.setNoDataMessage("无数据可供显示！"); // 没有数据的时候显示的内容 
		//设置显示{name}:{value},{百分比},百分比保留一位小数
		pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator(("{0}: {1},{2}"), NumberFormat.getNumberInstance(), new DecimalFormat("0.0%"))); 
		return jChart;
	}

	public static JFreeChart drawBar(List<RequirementView> list,String title,String xName,String yName) {
		DefaultCategoryDataset dcd = new DefaultCategoryDataset();
		for (RequirementView rv : list) {
			dcd.addValue(rv.getBuyNum(), rv.getProName(), rv.getProName());
		}
		JFreeChart jChart = ChartFactory.createBarChart3D(title,xName,yName,dcd,PlotOrientation.VERTICAL,true,false,false);
		BarRenderer3D renderer3D = new BarRenderer3D();
		//显示每个柱的数值，并修改该数值的字体属性 
        renderer3D.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
        renderer3D.setBaseItemLabelFont(new Font("黑体", Font.PLAIN, 8));  
        renderer3D.setBaseItemLabelsVisible(true);
        CategoryPlot plot = jChart.getCategoryPlot();  
        plot.setRenderer(renderer3D);
		return jChart;
	}

	public static JFreeChart drawXY(Map<String, List<RequirementView>> map,String title,String xName,String yName) {
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
		Iterator<Entry<String,List<RequirementView>>> it = map.entrySet().iterator();
		while(it.hasNext()){
			Entry<String, List<RequirementView>> entry1 = it.next();
			for (RequirementView rv : entry1.getValue()) {
				dataSet.addValue(rv.getBuyNum(), entry1.getKey(), rv.getCreateDate());
			}
		}
		JFreeChart jChart = ChartFactory.createLineChart(title, xName, yName, dataSet,
				PlotOrientation.VERTICAL, // 绘制方向
                true, // 显示图例
                true, // 采用标准生成器
                false // 是否生成超链接
                );
		 //设置标题字体  
		jChart.getTitle().setFont(new Font("隶书", Font.BOLD, 20));  
		//设置图例类别字体  
		jChart.getLegend().setItemFont(new Font("宋体", Font.BOLD, 14));  
		jChart.setBackgroundPaint(new Color(250,250,250));   //设置背景色  
		//获取绘图区对象  
		CategoryPlot plot = jChart.getCategoryPlot();
		Font font = new Font("宋体", Font.BOLD, 14);
		plot.getDomainAxis().setLabelFont(font);     
		//设置横轴字体  
		plot.getDomainAxis().setTickLabelFont(font);
		//设置坐标轴标尺值字体  
		plot.getRangeAxis().setLabelFont(font);    
		//设置纵轴字体  
		plot.setBackgroundPaint(Color.WHITE);         
		//设置绘图区背景色  
		plot.setRangeGridlinePaint(Color.RED);       
		//设置水平方向背景线颜色  
		plot.setRangeGridlinesVisible(true);       
		//设置是否显示水平方向背景线,默认值为true  
		plot.setDomainGridlinePaint(Color.RED);     
		//设置垂直方向背景线颜色  
		plot.setDomainGridlinesVisible(true);    
		//设置是否显示垂直方向背景线,默认值为false  
		//获取折线对象  
		LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();  
		BasicStroke realLine = new BasicStroke(1.6f);   //设置实线  
		float dashes[] = { 8.0f };                      //定义虚线数组  
		BasicStroke brokenLine = new BasicStroke(1.6f,  //线条粗细  
			BasicStroke.CAP_SQUARE,             //端点风格  
			BasicStroke.JOIN_MITER,             //折点风格  
			8.0f,                                //折点处理办法  
			dashes,                         	//虚线数组  
			0.0f);                          	//虚线偏移量      
		//利用虚线绘制第一条折线
		renderer.setSeriesStroke(0, realLine);
		//利用实线绘制第一条折线
		renderer.setSeriesStroke(1, brokenLine);     
		//利用虚线绘制第二条折线
		renderer.setSeriesStroke(2, realLine);
		// 设置X轴
		CategoryAxis domainAxis = plot.getDomainAxis();   
		domainAxis.setLabelFont(new Font("宋书", Font.PLAIN, 15)); // 设置横轴字体
		domainAxis.setTickLabelFont(new Font("宋书", Font.PLAIN, 15));// 设置坐标轴标尺值字体
		domainAxis.setLowerMargin(0.01);// 左边距 边框距离
		domainAxis.setUpperMargin(0.06);// 右边距 边框距离,防止最后边的一个数据靠近了坐标轴。
		domainAxis.setMaximumCategoryLabelLines(10);
		domainAxis.setCategoryLabelPositions(CategoryLabelPositions.DOWN_45);// 横轴 lable 的位置 横轴上的 Lable 45度倾斜 DOWN_45
		
		// 设置Y轴
		NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
		rangeAxis.setLabelFont(new Font("宋书", Font.PLAIN, 15)); 
		rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());//Y轴显示整数
		rangeAxis.setAutoRangeMinimumSize(1);   //最小跨度
		rangeAxis.setUpperMargin(0.18);//上边距,防止最大的一个数据靠近了坐标轴。   
		rangeAxis.setLowerBound(0);   //最小值显示0
		rangeAxis.setAutoRange(false);   //不自动分配Y轴数据
		rangeAxis.setTickMarkStroke(new BasicStroke(1.6f));     // 设置坐标标记大小
		rangeAxis.setTickMarkPaint(Color.BLACK);     // 设置坐标标记颜色
		rangeAxis.setTickUnit(new NumberTickUnit(10));//每10个刻度显示一个刻度值
		return jChart;
	}

}
