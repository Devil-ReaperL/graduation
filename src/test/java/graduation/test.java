package graduation;

import java.util.ArrayList;
import java.util.Scanner;

public class test {
	static long sum=0;
	public static void main(String[] args){
        Scanner scanner=new Scanner(System.in);
        int k=scanner.nextInt();
        scanner.nextLine();
        String s=scanner.nextLine();
        int num=0,len=s.length();
        int[] dp=new int[k+2];
        long result=0;
        dp[0]=1;
        for(char c:s.toCharArray()){
            if(c=='1') num++;
            if(num-k>=0) result+=dp[(num-k)%(k+2)];
            dp[(num+1)%(k+2)]=0;
            dp[num%(k+2)]++;
        }
        System.out.println(result);
    }
	public static String fun(long k,String s) {
		char [] cs=s.toCharArray();
		ArrayList<Long> list=new ArrayList<Long>();
		
		long size=0;
		for (char c : s.toCharArray()) {
			if (c=='1') {
				list.add(size);
			}
			size++;
			
		}
		if (list.size()>=k) {
			long flag=0;
			long index=0;
			for (long i = k-1; i < list.size(); i++) {
				long j=i+1>list.size()-1?i:i+1;
				long head=list.get((int)j)-list.get((int)i)-1;
				if (i==list.size()-1) {
					head=cs.length-list.get(list.size()-1)-1;
				}
				long wei=list.get((int)flag)-index;
				if (i!=k-1) {
					wei=list.get((int)flag)-index-1;
				}
				long x=head+wei;
				index=list.get((int)flag);
				flag++;
				
				sum+=Long.parseLong(expString(2,(int)x));
			
				if (list.size()-flag<k) {
					return "0";
				}
				
				
			}
		}
		
		return "0";
			
	}
	
	 private static String expString(Integer bottom, Integer var) {
	        int i = 0;
	        String str = "1";
	        while (i < var) {
	            str = multiString(bottom, str);
	            i++;
	        }
	        return str;
	    }

	    /**
	     * @param bottom 底数
	     * @param str    指数
	     * @return
	     */
	    private static String multiString(Integer bottom, String str) {
	        char[] c = str.toCharArray();
	        //结果可能和原数组一样长或者比原数组长度长1， 2的3次幂是8,2的4次幂就是16了
	        char[] result = new char[c.length + 1];
	        //temp用来表示是否有进位
	        int temp = 0;
	        for (int i = c.length - 1; i >= 0; i--) {//从后向前遍历
	            //48 是 0对应的ASCII码
	            int j = (int) c[i] - 48;
	            int all = j * bottom;
	            //为什么是i+1呢？，因为最后可能会有进位
	            result[i + 1] = ((char) ((all % 10 + temp) % 10 + 48));
	            temp = (all + temp) / 10;
	        }
	        if (temp != 0) {
	            //最后如果有进位
	            result[0] = (char) (temp + 48);
	        }
	        //去掉不需要的0
	        return String.valueOf(result).replaceAll("\u0000", "");
	    }
}
