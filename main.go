package main

import (
	"fmt"
	"time"
)

func main() {
	for tick:=range time.Tick(3*time.Second) {
		fmt.Println(tick, "Testing")
	}
}
