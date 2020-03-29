package com.tinhoc.nhathuoc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Qualifier("userServiceImpl")
    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    public void configure(HttpSecurity http) throws Exception{
        http
                .authorizeRequests()
                //Cấu hình cho các đuòng dẫn không cần xác thực
                .antMatchers("/","/login","register","/booking").permitAll()
                //Cấu hình cho các đường dẫn đăng nhập bằng Role là Member, Admin
                .antMatchers("/review").hasAnyRole("MEMBER","ADMIN")
                //cấu hình cho đường dẫn admin, chỉ có Role admin mới vào được
                .antMatchers("/admin").hasRole("ADMIN")
                .and()
                //formlogin
                .formLogin()
                //Đường dẫn trả về trang login
                .loginPage("/login")
                .usernameParameter("email")
                .passwordParameter("password")
                //Nếu login thành công
                .defaultSuccessUrl("/")
                //Nếu login thất bại
                .failureUrl("/login?error")
                //Nếu login thành công nhưng vào trang không đúng role
                .and()
                .exceptionHandling()
                .accessDeniedPage("/403");

    }
}
