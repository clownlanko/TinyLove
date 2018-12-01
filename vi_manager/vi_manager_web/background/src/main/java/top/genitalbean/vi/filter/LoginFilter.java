package top.genitalbean.vi.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        servletResponse.setCharacterEncoding("UTF-8");
        servletResponse.setContentType("text/html;charset=utf-8");
        if(request.getSession().getAttribute("vim")!=null){
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
            servletResponse.getOutputStream().write(("<script>alert('你没有权限');location.href='../login.jsp';</script>").getBytes("UTF-8"));
        }
    }
}
