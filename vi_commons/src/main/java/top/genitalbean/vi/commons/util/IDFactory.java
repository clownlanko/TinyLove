package top.genitalbean.vi.commons.util;

public class IDFactory {
    public static Integer[] codes={0,1,2,3,4,5,6,7,8,9};

    /**
     * @return 生成验证码
     */
    public static String generateVerificationCode(){
        String code="";
        for (int i=0;i<7;i++){
            code+=codes[(int) Math.floor(Math.random()*10)];
        }
        return code;
    }

    /**
     * @return 生成用户ID
     */
    public static synchronized String generateUserId(){
        String id="viu";
        for (int i=0;i<4;i++){
            id+=codes[(int) Math.floor(Math.random()*10)];
        }
        return id+System.currentTimeMillis();
    }
}
