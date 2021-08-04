package com.health.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.health.interceptor.SessionInterceptor;
import com.health.interceptor.SiteInterceptor;

@Configuration
public class App_config {
	
		//Mybatis 사용->ds.getConnection(); sql구문은 classpath:/mapper/에 있어
		@Bean
		public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);

		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:/mapper/**/*.xml");
		sessionFactory.setMapperLocations(res);

		return sessionFactory.getObject();
		}
		
		//위에 구문을 메모리에 올려줌
		@Bean
		public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		System.out.println("sqlSessionFactory : " + sqlSessionFactory);
		return new SqlSessionTemplate(sqlSessionFactory);
		}
		
		
		@Configuration
		public class WebMvcConfig extends WebMvcConfigurerAdapter {
		    @Override
		    public void addInterceptors(InterceptorRegistry registry) {
		        registry.addInterceptor(new SiteInterceptor())
		                .addPathPatterns("/**")
		        		.excludePathPatterns("/siteClose")
		        		.excludePathPatterns("/resources/**")
		        		.excludePathPatterns("/admin/*");
//		        registry.addInterceptor(new SessionInterceptor())
//		        	.addPathPatterns("/*/*.do");
		    }
		    

		}
		

		
} 