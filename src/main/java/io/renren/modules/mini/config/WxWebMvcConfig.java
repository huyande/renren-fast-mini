package io.renren.modules.mini.config;

import io.renren.modules.mini.interceptor.WxLoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WxWebMvcConfig implements WebMvcConfigurer {
    @Autowired
    private WxLoginInterceptor wxLoginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(wxLoginInterceptor).addPathPatterns("/wx/**");
    }
}
