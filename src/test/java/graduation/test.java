package graduation;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class test {

	public static <E> void main(String[] args) {
		float price=(float) 1.2;
		DecimalFormat decimalFormat=new DecimalFormat(".00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
		String p=decimalFormat.format(price);//format 返回的是字符串
		System.out.println(p);
		float p1=Float.parseFloat(p);
		System.out.println(p1);

		
	}

}
