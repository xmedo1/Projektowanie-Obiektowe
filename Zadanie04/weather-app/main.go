package main

import (
	"net/http"
	"github.com/labstack/echo/v4"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
	"encoding/json"
)

type Weather struct {
	gorm.Model
	City string  `json:"city"`
	Temperature float64 `json:"temperature"`
	Windspeed float64 `json:"windspeed"`
	Isday int `json:"is_day"`
}

type ExternalWeatherData struct {
	CurrentWeather struct {
		Temperature float64 `json:"temperature"`
		Windspeed float64 `json:"windspeed"`
		IsDay int `json:"is_day"`
	} `json:"current_weather"`
}


type WeatherProxy struct{}

func (p *WeatherProxy) FetchWeather(city string) (float64, float64, int, error) {
	url := "https://api.open-meteo.com/v1/forecast?latitude=50.06&longitude=19.94&current_weather=true"
	resp, err := http.Get(url)
	if err != nil {
		return 0, 0, 0, err
	}
	defer resp.Body.Close()

	var data ExternalWeatherData
	if err := json.NewDecoder(resp.Body).Decode(&data); err != nil {
		return 0, 0, 0, err
	}

	return data.CurrentWeather.Temperature, data.CurrentWeather.Windspeed, data.CurrentWeather.IsDay, nil
}

var DB *gorm.DB

func initDB() {
	var err error
	DB, err = gorm.Open(sqlite.Open("database.db"), &gorm.Config{})
	if err != nil {
		panic("Blad - baza danych")
	}
	DB.AutoMigrate(&Weather{})
}

func GetWeather(c echo.Context) error {
	proxy := WeatherProxy{}
	temp, windspeed, is_day, err := proxy.FetchWeather("Krakow")
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Proxy failed"})
	}

	weather := Weather{
		City: "Krakow",
		Temperature: temp,
		Windspeed: windspeed,
		Isday: is_day,
	}
	result := DB.Create(&weather)
    if result.Error != nil {
        return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Failed to save data"})
    }

	return c.JSON(http.StatusOK, weather)
}

func main() {
	initDB()
	e := echo.New()
	e.GET("/weather", GetWeather)
	e.Logger.Fatal(e.Start(":8080"))
}