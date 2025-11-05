import Foundation // needed for reading and writing files

/*
Vowel Counting Program in Swift (File Version)
Reads words from a file called "input.txt",
counts the vowels in each word,
and writes the results to both terminal and a file called "output.txt".)
*/

/// Function to count vowels in a word
func NumVowels(word: String) -> Int {
    var count = 0 // how many vowels found
    let lower = word.lowercased() // make all letters lowercase

    for c in lower { // go through each letter in the word
        if c.isNumber { // check if the letter is a number
            return 0 // stop and return 0 if number found
        }

        // check if the letter is one of the vowels
        if c == "a" || c == "e" || c == "i" || c == "o" || c == "u" {
            count += 1 // add 1 to the count if vowel found
        }
    }
    return count // return the total number of vowels
}

/// Main function of the program
func main() {
    print("Welcome to the Vowel Counting Program!")

    let inputFile = "input.txt" // input file name
    let outputFile = "output.txt" // output file name

    var results = "" // will store all the output lines

    // Try to open and read from the input file
    do {
        // read all text
        let fileContents = try String(contentsOfFile: inputFile)
         // split text into words
        let words = fileContents.components(separatedBy: .whitespacesAndNewlines)

        // Go through each word from the input file
        for word in words {
            if word.isEmpty { continue } // skip empty lines
            let vowelCount = NumVowels(word: word) // call the function to count vowels
            let outputLine = "\(word): \(vowelCount) vowel(s)" // create result line

            print(outputLine) // display in terminal
            results += outputLine + "\n" // add it to the output string
        }

        // Write all results to the output file
        try results.write(toFile: outputFile, atomically: true, encoding: .utf8)
        print("Results are saved to \(outputFile)") // confirmation message

    } catch { // if reading or writing fails
        print("Error reading input file or writing output file: \(error)")
    }
}

// Run the program
main() // call the main function to start
