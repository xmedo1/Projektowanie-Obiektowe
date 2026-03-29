package com.example.authservice

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.context.annotation.Lazy

@RestController
class AuthController(private val authService: AuthService, @Lazy private val authServiceLazy: AuthServiceLazy) { // constructor injection

    @GetMapping("/users")
    fun getUsers(): List<User> {
        return listOf(
            User(1, "admin"),
            User(2, "password")
        )
    }

    @GetMapping("/login")
    fun login(@RequestParam user: String, @RequestParam pass: String): String {
        val result = authService.authorize(user, pass)
        return if (result) "Zalogowano: $user" else "Zle haslo"
    }

    @GetMapping("/login-lazy")
    fun loginLazy(@RequestParam user: String, @RequestParam pass: String): String {
        val result = authServiceLazy.authorize(user, pass)
        return if (result) "Zalogowano: $user (lazy)" else "Zle haslo (lazy)"
    }

}