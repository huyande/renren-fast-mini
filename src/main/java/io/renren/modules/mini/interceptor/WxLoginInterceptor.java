package io.renren.modules.mini.interceptor;

import io.renren.common.exception.RRException;
import io.renren.modules.app.annotation.Login;
import io.renren.modules.mini.annotation.WxLogin;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class WxLoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        WxLogin annotation;
        if(handler instanceof HandlerMethod) {
            annotation = ((HandlerMethod) handler).getMethodAnnotation(WxLogin.class);
        }else{
            return true;
        }
        if(annotation == null){
            return true;
        }
        //判断请求头中是否有openid这个参数
        String openid = request.getHeader("_openid");
        if(openid==null){
//            response.setCharacterEncoding("UTF-8");
            throw new RRException("微信小程序请求头缺少openid", HttpStatus.UNAUTHORIZED.value());
        }
        return true;
    }
}
