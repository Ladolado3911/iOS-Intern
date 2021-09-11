import Foundation

// 1.     დაწერეთ ფუნქცია, რომელსაც გადაეცემა ტექსტი  და აბრუნებს პალინდრომია თუ არა. (პალინდრომი არის ტექსტი რომელიც ერთნაირად იკითხება ორივე მხრიდან).

func isPalindrome(text: String) -> Bool {
    text == String(text.reversed())
}

print(isPalindrome(text: "1221"))
print(isPalindrome(text: "1212"))
print("\n")

// 2.     გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.

func minSplit(amount: Int) -> Int {
    let sortedCoinSet = [50, 20, 10, 5, 1]
    guard amount > 0 else { return 0 }

    var change: [Int] = []
    var newValue = amount

    for coin in sortedCoinSet {
        while newValue - coin >= 0 {
            change.append(coin)
            newValue -= coin
        }

        if newValue == 0 {
            break
        }
    }
    return change.count

}
let amount = 99
print("amount: \(amount)")
print("answer: \(minSplit(amount: amount))")

// 3.     მოცემულია მასივი, რომელიც შედგება მთელი რიცხვებისგან. დაწერეთ ფუნქცია რომელსაც გადაეცემა ეს მასივი და აბრუნებს მინიმალურ მთელ რიცხვს, რომელიც 0-ზე მეტია და ამ მასივში არ შედის.

func notContains(array: [Int]) -> Int {
    for num in 1...Int.max {
        if !array.contains(num) {
            return num
        }
    }
    return Int.max
}

print("\n")
print("answer: \(notContains(array: [1, 3, 4]))")
print("\n")


// 4.     მოცემულია String რომელიც შედგება „(„ და „)“ ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.
// მაგ: (()()) სწორი მიმდევრობაა,  ())() არასწორია

func isProperly(sequence: String) -> Bool {
    var stack: [String] = []
    for char in sequence {
        if char == "(" {
            stack.append(String(char))
        }
        else if char == ")" {
            if stack.count > 0 && "(" == stack[stack.count - 1] {
                stack.removeLast()
            }
            else {
                return false
            }
        }
    }
    if stack.count == 0 {
        return true
    }
    else {
        return false
    }
}

print(isProperly(sequence: "()()()"))
print(isProperly(sequence: "())()"))
print(isProperly(sequence: "()(()))(()"))


// 5.     გვაქვს n სართულიანი კიბე, ერთ მოქმედებაში შეგვიძლია ავიდეთ 1 ან 2 საფეხურით. დაწერეთ ფუნქცია რომელიც დაითვლის n სართულზე ასვლის ვარიანტების რაოდენობას.

func countVariants(stairsCount: Int) -> Int {
    if stairsCount == 1 || stairsCount == 2 {
        return stairsCount
    }

    var current = 0
    var prevPrevious = 1
    var previous = 2

    for _ in (3..<stairsCount + 1) {
        current = prevPrevious + previous
        prevPrevious = previous
        previous = current
    }
    return current
}

print(countVariants(stairsCount: 5))


// 6.     დაწერეთ საკუთარი მონაცემთა სტრუქტურა, რომელიც საშუალებას მოგვცემს O(1) დროში წავშალოთ ელემენტი.


class Node {
    var value: Int
    var next: Node?
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    var head : Node?
    init(head: Node?) {
        self.head = head
    }
}

extension LinkedList {
    func append(_ node : Node) {
            guard head != nil else {
                head = node
                return
            }

            var current = head
            while let _ = current?.next {
                current = current?.next
            }
            current?.next = node
        }

    func deleteNode(withValue value: Int) {
        var current = head
        var previous: Node?

        while current?.value != value && current?.next != nil {
            previous = current
            current = current?.next
        }

        if current?.value == value {
            if previous != nil {
                previous?.next = current?.next
            } else {
                head = current?.next
            }
        }
    }
}
