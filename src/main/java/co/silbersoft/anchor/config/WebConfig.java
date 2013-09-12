package co.silbersoft.anchor.config;


import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;
import java.util.Properties;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages="co.silbersoft.anchor")
@ImportResource(value = {"/WEB-INF/spring-security.xml"})
public class WebConfig {

    

    @Bean
    public ViewResolver getViewResolver() {
        InternalResourceViewResolver internalViewResolver = new InternalResourceViewResolver();
        internalViewResolver.setViewClass(JstlView.class);
        internalViewResolver.setPrefix("/WEB-INF/views/");
        internalViewResolver.setSuffix(".jsp");
        return internalViewResolver;
    }
    
    @Bean
    public Config config() {
        return ConfigFactory.load().withFallback(ConfigFactory.systemProperties());
    }

    @Bean(destroyMethod = "close")
    public DataSource dataSource() {
        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName(config().getString("db.driverClass"));
        basicDataSource.setUrl(config().getString("db.url"));
        basicDataSource.setUsername(config().getString("db.username"));
        basicDataSource.setPassword(config().getString("db.password"));
        basicDataSource.setMaxWait(config().getLong("db.maxwait"));
        return basicDataSource;
    }

    @Bean
    public SessionFactory sessionFactory() {
        LocalSessionFactoryBuilder sf = new LocalSessionFactoryBuilder(dataSource()).scanPackages("co.silbersoft.anchor.models");
        sf.addProperties(getHibernateProperties());
        return sf.buildSessionFactory();
    }

    @Bean(name = "transactionManager")
    public HibernateTransactionManager transactionManager() {
        HibernateTransactionManager t = new HibernateTransactionManager();
        t.setSessionFactory(sessionFactory());
        return t;
    }
    
    private Properties getHibernateProperties() {
        Properties p = new Properties();
        p.setProperty("hibernate.dialect", config().getString("hibernate.dialect"));
        p.setProperty("hibernate.show_sql", config().getString("hibernate.show_sql"));
        p.setProperty("hibernate.format_sql", config().getString("hibernate.format_sql"));
        p.setProperty("hibernate.hbm2ddl.auto", config().getString("hibernate.hbm2ddl.auto"));
        return p;
    }

    
}
