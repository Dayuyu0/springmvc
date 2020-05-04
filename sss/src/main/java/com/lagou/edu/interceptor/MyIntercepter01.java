package com.lagou.edu.interceptor;
import com.alibaba.druid.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义springmvc拦截器
 */
public class MyIntercepter01 implements HandlerInterceptor {

    /**
     * 会在handler方法业务逻辑执行之前执行
     * 往往在这里完成权限校验工作
     * @param request
     * @param response
     * @param handler
     * @return  返回值boolean代表是否放行，true代表放行，false代表中止
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("MyIntercepter01 preHandle......");
        //url判断，若是则通过
        String uri = request.getRequestURI();
        if (uri.indexOf("/login") >= 0) {
            return true;
    }
        //若session中有值，则通过，否则返回登陆页面
        String username = (String) request.getSession().getAttribute("username");
        if(!StringUtils.isEmpty(username)){
            return true;
        }else
            {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        response.sendRedirect("login");
        return false;}
    }

}
