// models.article.go

package main

// Структура для обработчика
type Request struct {
	Sites      []string `json:"sites"`
	SearchText string   `json:"search-text"`
}

// Структура ответа
type Response struct {
	FoundAtSites []string
}
