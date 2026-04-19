package main

import (
	"net/http"
	"github.com/labstack/echo/v4"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

type Weather struct {
	gorm.Model
	City string  `json:"city"`
	Temperature float64 `json:"temperature"`
}

var DB *gorm.DB

func initDB() {
	var err error
	DB, err = gorm.Open(sqlite.Open("database.db"), &gorm.Config{})
	if err != nil {
		panic("Blad - baza danych")
	}
	DB.AutoMigrate(&Weather{})

	var count int64
	DB.Model(&Weather{}).Count(&count)
	if count == 0 {
		initialWeather := Weather{City: "Krakow", Temperature: 20.0}
		DB.Create(&initialWeather)
	}
}

func GetWeather(c echo.Context) error {
	var weather Weather
	DB.First(&weather)
	return c.JSON(http.StatusOK, weather)
}

func main() {
	initDB()
	e := echo.New()
	e.GET("/weather", GetWeather)
	e.Logger.Fatal(e.Start(":8080"))
}