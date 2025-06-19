package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
    var choice string

    // Create a buffered reader that reads from standard input
    reader := bufio.NewReader(os.Stdin)

    for {
        fmt.Print("Choose a, b, c, or q... ")

        // Read until newline
        input, _ := reader.ReadString('\n')         

        // Remove newline and spaces
        input = strings.TrimSpace(input)

        // Convert to lowercase
        input = strings.ToLower(input)

        // Get the first character
        if len(input) > 0 {
            choice = string(input[0])
        } else {
            // Handle empty input
            choice = ""
        }

        // Show user their choice
        fmt.Println("You chose:", choice)

        // Compare user's choice 
        switch  choice{

            case "a":
                fmt.Println("A")

            case "b":
                fmt.Println("B")

            case "c":
                fmt.Println("C")

            case "q":
                fmt.Println("Exiting")
                os.Exit(0)

            default:
                fmt.Println("Defaulting")
        }
    }
}
