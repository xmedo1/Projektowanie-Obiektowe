package com.example.authservice

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.RequestParam

@RestController
class AuthController(private val authService: AuthService) { // constructor injection

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

}