package io.renren.modules.mini.annotation;

import java.lang.annotation.*;

/**
 * 微信小程序是否有openid效验
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface WxLogin {
}
