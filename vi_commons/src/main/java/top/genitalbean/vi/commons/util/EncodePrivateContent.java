package top.genitalbean.vi.commons.util;

import org.apache.commons.codec.digest.DigestUtils;

public class EncodePrivateContent {
	public String encode(String content,String key) {
		content = DigestUtils.md5Hex(content).toUpperCase() + DigestUtils.md5Hex(key).toUpperCase();
		for (int i = 0; i < 5; i++) {
			content = DigestUtils.md5Hex(content).toUpperCase();
		}
		return content;
	}
}
