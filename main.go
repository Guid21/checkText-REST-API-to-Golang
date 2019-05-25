// main.go

package main

import (
	"github.com/gin-gonic/gin"
)

var router *gin.Engine

func main() {

	// роутер по-умолчанию в Gin
	router = gin.Default()

	// Инициализируем роуты
	initializeRoutes()

	// Запускаем приложение
	router.Run()

}
