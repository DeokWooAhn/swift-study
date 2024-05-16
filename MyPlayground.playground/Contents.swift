import UIKit

//func abb(_ value: inout Int) {
//    value += 1
//    print(value)
//}
//
//var a = 1
//
//abb(&a)
//
//func add(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//
//var function = add
//
//func abc(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
//    let result = function(a, b)
//    print(result)
//}
//
//abc(function, 1, 2)

//var a: Int? = 1
//
//if a != nil {
//    print("aa")
//} else {
//    print("bb")
//}
//
//if let unwrappedA = a {
//    print("aa")
//} else {
//    print("bb")
//}
//
//var food: String? = "rice"
//
//if let favoriteFood = food {
//    print(favoriteFood)
//} else {
//    print("nil")
//}
//
//func printNickName(_ name: String?) {
//    guard let nickName = name else {
//        print("nil")
//        return
//    }
//    
//    print(nickName)
//}
//
//printNickName("Tom")

//var info: [String: String] = ["name": "Ahn", "job": "developer", "city": "seoul"]
//info["city"] = "busan"
//
//func printDictionary(dic: [String: String]) {
//    if let name = dic["name"], let job = dic["job"], let city = dic["city"] {
//        print(name, job, city)
//    } else {
//        print("is nil")
//    }
//}
//
//printDictionary(dic: info)

var multiplyClosure: (Int, Int) -> Int = { a, b in
    return a * b
}

let result = multiplyClosure(4, 2)

func operateNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}

operateNum(a: 4, b: 2, operation: multiplyClosure)
