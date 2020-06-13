package graduation;

import java.util.Arrays;
import java.util.Scanner;

public class Test1 {
		
		 
	
	public static void main(String[] args) {
			Scanner sc = new Scanner(System.in);
			int len = Integer.parseInt(sc.nextLine());
			int[] num = new int[len];
			int index = 0 ;
			while(len-->0)
			{
				num[index++] = Integer.parseInt(sc.nextLine());
			}
			for (int i = 0; i < num.length; i++) {
				index = i;
				if (i % 2 == 0) {
					for (int j = num.length-1; j >i; j--) {
						if (num[j]<num[index]) {
							index = j;
						}
					}
				} else {
					for (int j = num.length-1; j >i; j--) {
						if (num[j]>num[index]) {
							index = j;
						}
					}
				}
				
				int k=num[i];
				num[i]=num[index];
				num[index]=k;
				
				
			}
			System.out.println(Arrays.toString(num));
	}
}