package dev.jaimerey.accounts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;

@SpringBootApplication
@EnableJpaAuditing(auditorAwareRef = "auditAwareImpl")
@OpenAPIDefinition(
    info = @io.swagger.v3.oas.annotations.info.Info(
        title = "Accounts microservice REST API Documentation",
        version = "v1.0",
        description = "EazyBank Accounts microservice REST API documentation",
        contact = @io.swagger.v3.oas.annotations.info.Contact(
            name = "Jaime Rey",
            email = "jaimereycasado@gmail.com"
        ),
        license = @io.swagger.v3.oas.annotations.info.License(
            name = "MIT License",
            url = "https://opensource.org/license/mit/"
        )

    )

)
public class AccountsApplication {

    static void main(String[] args) {
        SpringApplication.run(AccountsApplication.class, args);
    }

}
