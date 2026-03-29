package com.example.authservice

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@SpringBootApplication
class AuthServiceApplication

fun main(args: Array<String>) {
    runApplication<AuthServiceApplication>(*args)
}

@Configuration
class AuthConfig {
    @Bean
    fun authService(): AuthService = AuthService.getInstance()
}
