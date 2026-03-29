package com.example.authservice

open class AuthService protected constructor() {
    init {
        println("AuthService init (eager)")
    }

    companion object {
        private val INSTANCE = AuthService()
        fun getInstance(): AuthService = INSTANCE
    }

    open fun authorize(username: String, password: String): Boolean {
        return username == "admin" && password == "password"
    }
}