package co.silbersoft.anchor.config;

import java.net.URI;
import java.net.URISyntaxException;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Configuration
@Profile(value="production")
public class ProductionDataConfig implements DataConfig{

	private static final Logger log = LoggerFactory.getLogger(ProductionDataConfig.class);
	
    @Value("#{ systemEnvironment['DATABASE_URL'] }")
    private String DATABASE_URL;
    
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
	
	@Override
	@Bean
	public DataSource dataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName("org.postgresql.Driver");
        basicDataSource.setUrl("jdbc:postgresql://" + dbUrl().getHost() + ":" + dbUrl().getPort() + dbUrl().getPath());
        basicDataSource.setUsername(dbUrl().getUserInfo().split(":")[0]);
        basicDataSource.setPassword(dbUrl().getUserInfo().split(":")[1]);
        basicDataSource.setMaxWait(1);
        return basicDataSource;
	}

}
