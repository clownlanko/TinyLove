package top.genitalbean.vi.commons.util;

/**
 * @author lanko
 */
public interface RegexString {
    String EMAIL="^\\w+\\x40\\w{2,}\\x2e\\w{2,5}$";
    String PHONE="^1[3456789]\\d{9}$";
    String IDCARD="^(^\\d{17}x&)||(^\\d{18}&)";
}
