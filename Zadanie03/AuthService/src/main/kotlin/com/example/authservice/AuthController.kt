package com.example.authservice

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class AuthController {

    @GetMapping("/users")
    fun getUsers(): List<User> {
        return listOf(
            User(1, "admin"),
            User(2, "password")
        )
    }
}