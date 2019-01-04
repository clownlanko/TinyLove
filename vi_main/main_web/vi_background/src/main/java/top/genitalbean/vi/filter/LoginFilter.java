package top.genitalbean.vi.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        request.setCharacterEncoding("UTF-8");
        servletResponse.setCharacterEncoding("UTF-8");
        servletResponse.setContentType("text/html;charset=utf-8");
        if(request.getSession().getAttribute("vim")!=null){
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
            StringBuffer content=new StringBuffer();
            content.append("<!DOCTYPE html>");
            content.append("<html lang='zh_cn'>");
            content.append("<head>");
            content.append("<meta charset='UTF-8'>");
            content.append("<script src='/TinyLove/vib/js/jquery.min.js'></script>");
            content.append("<script src='/TinyLove/vib/layui/layui.js'></script>");
            content.append("<style>body{margin:0px;}</style>");
            content.append("</head>");
            content.append("<body>");
            content.append("<script>");
            content.append("layui.use('layer')");
            content.append("layer.alert('你没有权限，或者登陆信息已过期。<br>即将跳转登陆页面...',{icon:2,title:'ITJ提示',end:function(){location.href='login.jsp'}});");
            content.append("</script>");
            content.append("</body>");
            content.append("</html>");
            servletResponse.getOutputStream().write(content.toString().getBytes("UTF-8"));
        }
    }
}
