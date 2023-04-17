package com.lms.librarymanagementsystem.Configs;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.lms.librarymanagementsystem.Interceptors.AdminInterceptor;
import com.lms.librarymanagementsystem.Interceptors.LoginInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    private LoginInterceptor loginInterceptor;
    private AdminInterceptor adminInterceptor;

    public WebMvcConfig(LoginInterceptor loginInterceptor,AdminInterceptor adminInterceptor) {
        this.loginInterceptor = loginInterceptor;
        this.adminInterceptor = adminInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/login/**","/registration/**");
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/**");
    }
}
