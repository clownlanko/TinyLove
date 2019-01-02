package top.genitalbean.vi.commons.util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URL;

@Component
public class CheckPhoneNumber {
    private final String key="0f829cf8e945f174c958ecdf14b6f194";
    public boolean check(String phoneNumber) throws IOException {
//        URL url = new URL("http://apis.juhe.cn/mobile/get?key="+key+"&phone="+phoneNumber);
//        JsonNode jsonNode = new ObjectMapper().readTree(url);
//        System.err.println(jsonNode.toString());
//        return Integer.parseInt(jsonNode.findValue("error_code").toString())==Integer.valueOf(0);
        return true;
    }
}
