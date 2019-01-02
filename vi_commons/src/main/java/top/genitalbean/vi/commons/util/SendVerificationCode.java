package top.genitalbean.vi.commons.util;

import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class SendVerificationCode {
    public boolean send(String phone,String code) throws IOException {
//        CloseableHttpClient client = HttpClients.createDefault();
//        HttpPost post = new HttpPost("http://op.juhe.cn/yuntongxun/voice");
//        post.setEntity(new StringEntity("key=a14133b160eb4a47dc179e2f51157467&valicode="+code+"&to="+phone+"&playtimes=3"));
//        CloseableHttpResponse response = client.execute(post);
//        HttpEntity entity = response.getEntity();
//        JsonNode jsonNode = new ObjectMapper().readTree(entity.getContent());
//        System.err.println(jsonNode.toString());
//        return Integer.parseInt(jsonNode.findValue("error_code").toString()) == Integer.valueOf(0);
        return true;
    }
}
