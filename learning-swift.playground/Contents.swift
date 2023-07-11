import Foundation

func add (_ a: Int, _ b: Int) -> Int{
    a+b
}

let res = add(1,2)

let addClosure: (Int,Int) -> Int = {
    (a:Int, b:Int) -> Int in
    a+b
}
addClosure(1,2)

func customAdd(
    _ a: Int,
    _ b: Int,
    using myFunction: (Int, Int) -> Int
) -> Int {
    myFunction(a, b)
}


customAdd(
    20,
    30, using: {
    (a: Int, b: Int)-> Int in
    a+b
})

customAdd(
    20,
    30)
{(a: Int, b: Int)-> Int in
    a+b
}

customAdd(
    20,
    30)
{ $0 + $1 }


let ages = [30, 20, 19, 40]

ages.sorted(by: {(lhs: Int, rhs: Int) -> Bool in
    lhs > rhs
})

ages.sorted(by: <)


func doAddition (
    on value: Int,
    using function: (Int) -> Int
) -> Int {
    function (value)
}

doAddition(on: 20, using: {
    (value) in
    value + 30
})

func add10To (_ value: Int) -> Int {
    value+10
}

doAddition(on: 20, using: add10To(_:))
//end




// FUNC


//struct Car {
//    let currentSpeed: Int
//    func drive () {
//        "Driving... at \(currentSpeed)"
////        currentSpeed = currentSpeed
//    }
//}

//let immutableCar = Car(currentSpeed: 10)
//immutableCar.drive()

struct LivingThing {
    init() {
        "I'm a kuvubg thing"
    }
}

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike (manufacturer: "HD", currentSpeed: 20)
let bike2 = bike1.copy(currentSpeed: 30)

bike1.currentSpeed
bike2.currentSpeed



// Enumeration
enum Animals {
    case cat(name: String)
    case dog(name: String)
    case rabbit(name: String)
}

let myCat = Animals.cat(name: "Leo")

//if case let .cat(name) == myCat {
//    name
//}

enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song (artist: String, songName: String)
}

let wwwAppel = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!)

switch wwwAppel {
case let .fileOrFolder(path, name):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(artist, songName):
    artist
    songName
    break
//default:
//    "Nope"
}

if case let .wwwUrl(path) = wwwAppel {
    path
}

//func == (
//    a: Animals,
//    b: Int
//) -> Bool {
//    a == .cat && b == 3
//}


//enum Vehicle {
//    case car(manufacturer: String, model: String)
//    case bike(manufacturer: String, model: String)
//    func getManufacturer() -> String {
//        switch self {
//        case let .car(manufacturer, _):
//            return manufacturer
//
//        case let .bike(manufacturer, _):
//            return manufacturer
//        }
//    }
//}


enum VehicleCompact {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, model: String)
    func getManufacturer() -> String {
        switch self {
        case let .car(manufacturer, _),
            let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

//let car = VehicleCompact.car(manufacturer: "Ford", model: "Something")

//car.getManufacturer()

enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
}

FamilyMember.father.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case blush = "😊"
    case rocket = "🚀"
    case fire = "🔥"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "😊"){
    "Blush"
    blush.rawValue
}


// Class

class Person {
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func assignAge (_ newAge: Int) {
        self.age = newAge
    }
}

let myself = Person(name: "Foo", age: 20)

myself.age
myself.assignAge(10)

myself.age


class Vehicle {
    func goVroom(){
        "Vroom Vroom"
    }
}


class Car: Vehicle {
    
}


let car2 = Car()

car2.goVroom()


class Person3 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increaseAge(){
        self.age += 1
    }
}

let p = Person3(age: 10)
p.age
//cannot increase age externally
p.increaseAge()
p.age


class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    //designeted initializer
    init(){
        self.model = "X"
        self.year = 2023
    }
    init(
        model: String,
        year: Int
    ){
        self.model = model
        self.year = year
    }
    convenience init (
        model: String
    ) {
        self.init(
            model: model,
            year: 2023)
    }
}

class TeslaModelY: Tesla {
    override init() {
        super.init(
            model: "Y",
            year: 2023
        )
    }
}

let modelY = TeslaModelY()

modelY.model
modelY.year
modelY.manufacturer

// Protocols


