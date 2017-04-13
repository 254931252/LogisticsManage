package test.newTest;

import javax.annotation.Resource;

import org.junit.Test;
import service.OrdersService;

public class OrdersTest extends BaseTest {
	@Resource
	private OrdersService ordersService;
	@Test
	public void oo(){
		System.out.println(ordersService.queryOrders(-1, "", "", "",2,1));
		//System.out.println(ordersService.queryOrdersList().size());
	}	
}
