package graduation;



public class Main {
	 public static void main(String[] args) {
		 
	        int[] A = new int[] {9,3,1,10};
//	        int[] A = new int[]{0, 0, 1, 2, 3, 4, 5, 6, 12, 13, 20, 10};
	        Integer maxAdjustDifference = findMaxDivision(A,A.length);
	        System.out.println(maxAdjustDifference);
	    }
	/**
	 *  计数排序思想： 获取无序数组的最大相邻差
	 *  步骤： 
	 *      1. 获取数组中的最大值和最小值，构建数组的长度
	 *      2. 将数组依次放入计数排序的数组中
	 *      3. 统计空值，判断0值最多连续出现的次数
	 *      4. 计算最大相邻差
	 * @param A
	 * @return
	 */
	public static Integer findMaxDivision(int[] A,int n) {
	    // 1. 获取数组中的最大值和最小值，构建数组的长度
	    int max = A[0];
	    int min = A[0];
	    for (int i = 1; i < n; i++) {
	        if (A[i] > max) {
	            max = A[i];
	        }
	        if (A[i] < min) {
	            min = A[i];
	        }
	    }
	    // 用来计算在统计数组中的下标
	    int distance = max - min;
	    int[] countArray = new int[distance+1];
	    // 2. 将数组依次放入计数排序的数组中
	    for (int i = 0; i < n; i++) {
	        countArray[A[i] - min]++;
	    }
	  
	    int maxNearDifference = 0;
	    int count = 0;
	    // 最大连续数
	    int maxCount = 0;
	    // 连续的开始位置
	    int startIndex = 0;
	    // 结束的开始位置
	    int endIndex  = 0;
	    for (int i = 0; i < countArray.length; i++) {
	        if (countArray[i] == 0) {
	            if (count == 0) {
	                // 记录连续为0的前一个位置
	                startIndex = i-1;
	            }
	            // 3. 统计空值，判断0值最多连续出现的次数
	            count++;
	        }else {
	            count = 0;
	        }
	        if (count > maxCount) {
	            maxCount = count;
	            // 记录连续为0的结束位置的后一个位置
	            endIndex = i+1;
	        }
	    }
	    // 4. 计算最大相邻差
	    maxNearDifference = endIndex - startIndex;
	    return maxNearDifference;
	}


		
}
