import UIKit
import Foundation

//1. Написать функцию, которая определяет, четное число или нет.

var a = 11
var checkEvenNumber = a % 2

if checkEvenNumber == 0 {
    print("Число ", a, "четное")
} else {
    print ("Число ", a, "Не четное")
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

var b = 11
var checkNumm = b % 3

if checkNumm == 0 {
    print("Число ", b, "делится на 3 без остатка")
} else {
    print ("Число ", b, "Не делится на 3 без остатка")
}

//3. Создать возрастающий массив из 100 чисел.

var hundredArray = Array (0...100) // это решение нашл уже в конце

/* А сначала было так:
 
 for i in 0...100 {
    hundredArray.append(i)
}
*/

print (hundredArray)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var filteredArray = hundredArray.filter { $0 % 2 != 0 && $0 % 3 == 0 }
print (filteredArray)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func fibonacciArray(_ n: Int) -> [Double] {
    var fibonacci: [Double] = [1, 1]
    (2...n).forEach{ i in
        fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
    }
    return fibonacci
}
print(fibonacciArray(50))













