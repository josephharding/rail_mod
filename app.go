package main

import (
  "fmt"
  "io/ioutil"
)

func check(e error) {
  if e != nil {
    panic(e)
  }
}

func main() {
	fmt.Printf("reading file...\n")
  dat, err := ioutil.ReadFile("data/phase0")
  check(err)
  fmt.Print(string(dat))

  one := dat[0:len(dat)]
  two := ", class"

  final := append(one, two...)

  fmt.Println(string(final))
  err = ioutil.WriteFile("data/phase1", final, 0644)
  check(err)
}
