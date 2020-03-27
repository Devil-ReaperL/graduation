package graduation;

import java.util.ArrayList;
import java.util.List;

public class test {

	public static <E> void main(String[] args) {
		String string="\\image\\e57cb565-eac6-45b1-9c35-f337208c2442\\8129eb4a-9c2d-4b1f-adc4-0b5cad0a288a.jpg";
		String s="e57cb565-eac6-45b1-9c35-f337208c2442\\9d0aa011-d875-447d-ac79-38d9bc371188.jpg;e57cb565-eac6-45b1-9c35-f337208c2442\\52203b17-bb9d-4d73-a920-868e03d77773.jpg;e57cb565-eac6-45b1-9c35-f337208c2442\\77cf93f0-37fe-4425-8f0f-448374eae81b.jpg;e57cb565-eac6-45b1-9c35-f337208c2442\\8129eb4a-9c2d-4b1f-adc4-0b5cad0a288a.jpg;";
		string=string.replace("\\image\\", "")+";";
		System.out.println(string);
		System.out.println(s.replace(string, ""));
		
	}

}
