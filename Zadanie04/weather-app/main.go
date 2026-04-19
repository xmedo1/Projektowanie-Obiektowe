package main

import (
	"net/http"
	"github.com/labstack/echo/v4"
)

type WeatherResponse struct {
	City string  `json:"city"`
	Temperature float64 `json:"temperature"`
}

func GetWeather(c echo.Context) error {
	data := WeatherResponse{ // roboczo
		City: "Krakow",
		Temperature: 20.0,
	}
	return c.JSON(http.StatusOK, data)
}

func main() {
	e := echo.New()
	e.GET("/weather", GetWeather)
	e.Logger.Fatal(e.Start(":8080"))
}