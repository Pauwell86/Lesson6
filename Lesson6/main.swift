//
//  main.swift
//  Lesson6
//
//  Created by Pauwell on 21.03.2021.
//
protocol Cutable {
    var cut: Bool { get set }
    var waight: Double { get set }
    var kindOfAnimal: String { get }
}

class Cat: Cutable, CustomStringConvertible {
    let kindOfAnimal: String
    var waight: Double
    var cut: Bool
    
    var description: String {
        "\nПорода: \(kindOfAnimal), Вес: \(waight), Кастрированная: \(cut ? "Да" : "Нет")"
    }
    
    init(kindOfAnimal: String, waight: Double, cut: Bool) {
        self.kindOfAnimal = kindOfAnimal
        self.waight = waight
        self.cut = cut
    }
    
    func cutting() {
        if self.cut == false {
            self.cut = true
        }
    }
}

class Dog: Cutable, CustomStringConvertible {
    let kindOfAnimal: String
    var waight: Double
    var cut: Bool
    
    var description: String {
        "\n Порода: \(kindOfAnimal), Вес: \(waight), Кастрированная: \(cut ? "Да" : "Нет")"
    }
    
    init(kindOfAnimal: String, waight: Double, cut: Bool) {
        self.kindOfAnimal = kindOfAnimal
        self.waight = waight
        self.cut = cut
    }
    
    func cutting() {
        if cut == false {
            cut = true
        }
    }
}

struct Queue<T: Cutable> {
    var animals: [T] = []
    
    mutating func push(_ animal: T) {
        animals.append(animal)
    }
    
    mutating func pop() -> T? {
        guard animals.count > 0 else { return nil }
        return animals.removeFirst()
    }
    
    var totalWaight: Double {
        var waight = 0.0
        for animal in animals {
            waight += animal.waight
        }
        return waight
    }
    
    func filter(array: [T], predicate:(T) -> Bool) -> [T] {
        var tmrArray = [T]()
        for element in array {
            if predicate(element) {
                tmrArray.append(element)
            }
        }
        return tmrArray
    }
}

extension Queue {

    subscript(indexes: Int...) -> [String] {

        var nameKindOfAnimals = [String]()

        for index in indexes {
            guard index >= 0 && index < animals.count else { continue }
            nameKindOfAnimals.append(animals[index].kindOfAnimal)
        }
        return nameKindOfAnimals
    }
}

var queueCat = Queue<Cat>()
var queueDog = Queue<Dog>()



queueDog.push(Dog(kindOfAnimal: "Бульдог", waight: 40, cut: false))
queueDog.push(Dog(kindOfAnimal: "Шпиц", waight: 3, cut: true))
queueCat.push(Cat(kindOfAnimal: "Сфинкс", waight: 4, cut: true))
queueCat.push(Cat(kindOfAnimal: "Британец", waight: 8, cut: true))
queueDog.push(Dog(kindOfAnimal: "Доберман", waight: 20, cut: true))
queueDog.push(Dog(kindOfAnimal: "Колли", waight: 15, cut: false))
queueDog.push(Dog(kindOfAnimal: "Чау хуа хуа", waight: 1.5, cut: false))

print(queueDog.totalWaight)
print(queueDog.animals)
queueDog.pop()
print(queueDog.totalWaight)
print(queueCat.totalWaight)
print(queueDog.animals)
print(queueCat.animals)

let newArray1 = queueDog.filter(array: queueDog.animals) { $0.waight > 5 }
print(newArray1)

let newArray2 = queueDog.filter(array: queueDog.animals) { $0.waight < 10 }
print(newArray2)

let newArray3 = queueDog.filter(array: queueDog.animals) { $0.cut == true }
print(newArray3)

print(queueDog[0,2,3])

