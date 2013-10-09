package co.silbersoft.anchor.config;

import co.silbersoft.anchor.dao.MailSettingsDao;
import co.silbersoft.anchor.models.MailSettings;
import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"co.silbersoft.anchor"})
public class AppContext {

    private static final Logger log = LoggerFactory.getLogger(AppContext.class);
    @Value("#{ systemEnvironment['DATABASE_URL'] }")
    private String DATABASE_URL;

    @Bean
    public Config config() {
        return ConfigFactory.load().withFallback(ConfigFactory.systemProperties());
    }

    @Bean
    public URI dbUrl() {
        log.debug(DATABASE_URL + " ------------------- ");
        try {
            return new URI(DATABASE_URL);
        } catch (URISyntaxException ex) {
            log.error("unable to get DATABASE_URL from the environment");
            return null;
        }
    }

    @Bean(destroyMethod = "close")
    public DataSource dataSource() {
        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName("org.postgresql.Driver");
        basicDataSource.setUrl("jdbc:postgresql://" + dbUrl().getHost() + ":" + dbUrl().getPort() + dbUrl().getPath());
        basicDataSource.setUsername(dbUrl().getUserInfo().split(":")[0]);
        basicDataSource.setPassword(dbUrl().getUserInfo().split(":")[1]);
        basicDataSource.setMaxWait(1);
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

    @Bean(name = "mailSender")
    public JavaMailSenderImpl mailSender() {
        JavaMailSenderImpl jms = new JavaMailSenderImpl();              
        return jms;
    }

    @Bean
    public SimpleMailMessage mailMessage() {
        SimpleMailMessage m = new SimpleMailMessage();        
        return m;
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
