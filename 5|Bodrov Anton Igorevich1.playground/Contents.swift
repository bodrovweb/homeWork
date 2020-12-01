import UIKit
import Foundation

protocol Healhable: AnyObject {
    var healt: Int { get set }
}

protocol Armored: AnyObject {
    var armor: Int { get }
}

protocol Melee: AnyObject {
    var damage: Int { get }
    func hit(target: inout Healhable)
}

extension Melee {
    func hit(target: inout Healhable) {
        target.healt -= self.damage
    }
}

protocol Range: AnyObject {
    var damage: Int { get }
}

extension Range {
    func shoot(target: inout Healhable) {
        target.healt -= self.damage
    }
}

class Archer: Healhable, Range {
    
    var healt: Int = 10
    var damage: Int = 7
}

class Knight: Healhable, Armored, Melee {
    
    var healt: Int = 40
    var armor: Int = 5
    var damage: Int =  3
    
}

class Swordsman: Healhable, Melee {
    
    var healt: Int = 40
    var damage: Int = 6
    
}

var knight: Healhable = Knight() //все таки не лучшее решение, не сообразил как сюда добавить Armored 
var swordsman = Swordsman()

swordsman.hit(target: &knight)
print(knight.healt)
print(swordsman.healt)

