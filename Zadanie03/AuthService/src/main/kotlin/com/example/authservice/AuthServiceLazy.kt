package com.example.authservice

open class AuthServiceLazy protected constructor() {
    init {
        println("AuthService init (lazy)")
    }

    companion object {
        private val INSTANCE: AuthServiceLazy by lazy { AuthServiceLazy() }
        fun getInstance(): AuthServiceLazy = INSTANCE
    }

    open fun authorize(username: String, password: String): Boolean {
        return username == "admin" && password == "password"
    }
}