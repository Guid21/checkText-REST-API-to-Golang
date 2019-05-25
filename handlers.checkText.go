package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"golang.org/x/net/html/charset"
)

func checkSubstring(data string, SearchText string) bool {
	if strings.Index(string(data), SearchText) != -1 {
		return true
	}
	return false
}

func requestDataSite(site string) string {
	req, err := http.Get(site)
	if err != nil {
		fmt.Println("HTTP error:", err)
		return ""
	}
	defer req.Body.Close()
	utf8, err := charset.NewReader(req.Body, req.Header.Get("Content-Type"))
	if err != nil {
		fmt.Println("Encoding error:", err)
		return ""
	}
	b, err := ioutil.ReadAll(utf8)
	if err != nil {
		fmt.Println("IO error:", err)
		return ""
	}
	return string(b)
}

func distributor(request Request) Response {
	var response Response
	for _, site := range request.Sites {
		if checkSubstring(requestDataSite(site), request.SearchText) {
			response.FoundAtSites = append(response.FoundAtSites, site)
		}
	}
	return response
}

func checkText(c *gin.Context) {
	var request Request
	var response Response

	c.BindJSON(&request)
	response = distributor(request)
	if len(response.FoundAtSites) != 0 {
		c.JSON(200, gin.H{
			"found-at-sites": response.FoundAtSites,
		})
	} else {
		c.Data(204, gin.MIMEHTML, nil)
	}
}
