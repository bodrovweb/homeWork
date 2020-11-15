import UIKit
import Foundation

//Бодров Антон
//Задание 1 Решить квадратное уравнение.

var a: Double = 1
var b: Double = -6
var c: Double = 9
var d: Double =  pow(b, 2) - 4 * a * c

let x1 = (-b + sqrt(d)) / 2 * a
let x2 = (-b - sqrt(d)) / 2 * a

// Добавил варианты решения для 3х типов D

if d > 0 {
    print("x1 равно " , x1, "x2 равно ", x2)
} else if d == 0 {
    print("x равно" , x1)
} else {
    print("Корней нет")
}

//Задание 2  Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var c1: Double = 4
var c2: Double = 2

//Ищем гипотенузу
let g = sqrt(pow(c1, 2) + pow(c2, 2))

//Ищем периметр
let p = c1 + c2 + g

//Ищем площадь
let s = (c1 * c2) / 2

print("Гипотенуза: ", Double(round(10 * g) / 10), ", Площадь: ", Int(s), ", Периметр: ", Int(p))

// Задание 3 Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var summ = 1000
var percent = 7
var time = 5
var days = time * 365

// Формула простых процентов
let summFinal = summ + (summ * percent * days / 365) / 100


