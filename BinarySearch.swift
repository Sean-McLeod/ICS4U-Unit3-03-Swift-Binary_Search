/* This program generates 250 random numbers in an array
   and allows the user to search the array for a number.

   Sean McLeod
   2021/05/07
*/

import Foundation

func binarySearch(userArray: [Int], userNumber: Int,
                  lowIndex: Int, highIndex: Int) -> Int {
    let indexNumber:Int

    if (lowIndex > highIndex) {
        // return -1 when the number isn't in the array
        return -1
    } else {
        indexNumber = (lowIndex + highIndex) / 2
        if (userNumber > userArray[indexNumber]) {
            /* if the userNumber is greater than the "selected" number, it means
            that the userNumber is later on the array, so replace lowIndex to
            indexNumber + 1 to shorten the range */
            return binarySearch(userArray: userArray, userNumber: userNumber,
                                lowIndex: indexNumber + 1, highIndex: highIndex)
        } else if (userNumber < userArray[indexNumber]) {
            /* if the userNumber is smaller than the "selected" number, it means
            that the userNumber is before on the array, so replace highIndex to
            indexNumber - 1 to shorten the range */
            return binarySearch(userArray: userArray, userNumber: userNumber,
                                lowIndex: lowIndex, highIndex: indexNumber - 1);
        } else {
            // if it's not greater or smaller, it must be equal
            return indexNumber
        }
    }
}


let min:Int = 0
let max:Int = 999
let arraySize = 250

print("Binary Search Program")

// Declaring array
var randomNumberArray = [Int]()

// Adding numbers to the array
for _ in min..<arraySize {
    randomNumberArray.append(Int.random(in: min...max))
}

// Sorting the array
randomNumberArray.sort()

print("\nSorted list of numbers:\n")
for element in randomNumberArray {
    let padded = String(format: "%03d", element)
    print("\(padded),", terminator: " ")
}
print("\n\n")

// Getting user input as to what number they wish to search for
print("What number are you searching for in the array"
      ,"(integer between 0 and 999): ", terminator:"")
let userInput = readLine()

// Ensuring the user inputs an appropriate integer
if let searchNumber = Int(userInput!) {
    if (searchNumber > max || searchNumber < min) {
        print("This input is out of range")
    } else {
        // Using binary search to find the user's chosen number in the array
        let searchResult = binarySearch(userArray: randomNumberArray, userNumber: 
                            searchNumber, lowIndex: min, highIndex: randomNumberArray.count - 1)
        if (searchResult == -1) {
            print("\n\(searchNumber) is not in this array.")
        } else {
            // Outputing the results of the search
            print("Your number is in index: \(searchResult)")
        }
    }
} else {
    print("")
    print("ERROR: Invalid Input")
}
