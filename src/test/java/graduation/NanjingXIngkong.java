package graduation;

import java.util.Stack;

public class NanjingXIngkong {
	static int num = 1;
    static char aChar = 65;

	public static void main(String[] args) {
        final Object o = new Object();
 
        
 
        new Thread(()->{
            synchronized (o){
            	while (num>0) {
            		
            		try {
                        o.notify();
                        o.wait();
                        System.out.print(num);
                		num++;
                		if (num==10) {
    						num=1;
    					}
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
					finally {
						o.notify();
					}
				}
               
                
            }
        },"t1").start();
 
        new Thread(()->{
            synchronized (o){
            	while (true) {
					
					try {
                        o.notify();
                        o.wait();
                        System.out.println(aChar++);
    					if (aChar>'Z') {
    						aChar='A';
    					}
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
					finally {
						o.notify();
					}
				}
                
            }
        },"t2").start();
    }

}
