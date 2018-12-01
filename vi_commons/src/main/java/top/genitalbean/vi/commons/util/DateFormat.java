package top.genitalbean.vi.commons.util;


import lombok.NonNull;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author lanko
 */
public class DateFormat {
    public static final String DATE="yyyy-MM-dd";
    public static final String DATE_TIME=DATE+" HH:mm:ss";
    public static final String DATE_TIME_WEEK=DATE_TIME+" E";
    public static final SimpleDateFormat sdf=new SimpleDateFormat();

    /**
     * @param format 格式化模板
     * @see #DATE,#DATE_TIME,#DATE_TIME_WEEKs
     * @return 格式化胡时间
     * @throws ParseException 解析字符串引发胡异常
     */
    public static final Date now(@NonNull String format) throws ParseException {
        sdf.applyPattern(format);
        return sdf.parse(sdf.format(new Date()));
    }
    public static final Date now(){
        return new Date();
    }
    public static final Date parse(@NonNull String time,@NonNull String format) throws ParseException {
        sdf.applyPattern(format);
        return sdf.parse(time);
    }
    public static final String decode(@NonNull Date time,@NonNull String format){
        sdf.applyPattern(format);
        return sdf.format(time);
    }
}
