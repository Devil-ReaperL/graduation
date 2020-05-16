package graduation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Test1 {
public static void main(String[] args) {
	HashMap<String, String> params=new HashMap<>();
	params.put("a", "1");
	params.put("b", "2");
	System.out.println(urlencode("http://www.baidu.com/", params) );
	
}
	

	static String urlencode(String hostUrl, HashMap<String, String> params) {
		hostUrl+="?";
		for ( String key : params.keySet()) {
			hostUrl+=key+"="+params.get(key)+"&";
		}
		hostUrl=hostUrl.substring(0, hostUrl.length()-1);
		return hostUrl;
	}
}
