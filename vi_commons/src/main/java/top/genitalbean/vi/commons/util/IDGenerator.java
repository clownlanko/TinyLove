package top.genitalbean.vi.commons.util;

public class IDGenerator {
    static volatile int viu=000000001;
    public static final String generateUserID(){
        String id="VIU";
        synchronized ("VIU"){
            id+=swap(viu++);
        }
        return id;
    }
    private static String swap(int id){
        if(id>=100000)
            return Integer.toString(id);
        if(id>=10000)
            return "0"+Integer.toString(id);
        if(id>=1000)
            return "00"+Integer.toString(id);
        if(id>=100)
            return "000"+Integer.toString(id);
        if(id>=10)
            return "0000"+Integer.toString(id);
        return "00000"+Integer.toString(id);
    }
}

