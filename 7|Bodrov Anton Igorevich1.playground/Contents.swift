import UIKit
import Foundation

enum LocalErrors: String, Error {
    case noRoots = " Корней нет "
}

class QuadraticEquationElements {
    var a: Double
    var b: Double
    var c: Double
    init (a:Double, b: Double, c:Double ) {
        self.a = a
        self.b = b
        self.c = c
    }
}

func quadratic(a:Double, b:Double, c:Double) throws -> [Double] {
        let discr = pow(b,2) - (4 * a * c)
        guard discr >= 0 else { throw LocalErrors.noRoots }
        let x1 = (-b + sqrt(discr))/(2 * a)
        let x2 = (-b - sqrt(discr))/(2 * a)

        if x1 == x2 {
            return [x1]
        } else {
            return [x1,x2]
        }
    }

do {
    let results = try quadratic(a: 5, b: 1, c: 3)
    print(results)
}   catch {
    if error is LocalErrors {
        let error = error as! LocalErrors
        print(error.rawValue)
    }
}

