import UIKit

enum EngineState {
    case turnedOn, turnedOff
    }
enum WindowState {
    case windowOpen, windowClosed
}

enum CarActions {
    
    case load(Int)
    case unload(Int)
    case setEngineState(EngineState)
    case setWindowState(WindowState)
    case twistMileage(Int)
    }

struct Car {
    
    var mark: String
    var dateOfManufacture: Int
    var mileage: Int = 100000
    var maxtrunkVolume: Int
    var engine: EngineState = .turnedOff
    var isWindowOpen: WindowState = .windowClosed
    var trunkVolume: Int

    mutating func makeAction(action: CarActions) {
        switch action {
        case .load(let load):
            if trunkVolume + load > maxtrunkVolume {
                print("Багажник заполнен")
                self.trunkVolume = maxtrunkVolume
            }else {
                self.trunkVolume += load
            }
        case .unload(let unload):
            if trunkVolume - unload < 0 {
                print("вы пытаетесь достать больше чем есть в багажнике")
            } else {
            self.trunkVolume -= unload
            }
        case .twistMileage(let twistMileage):
            self.mileage -= twistMileage
        case .setEngineState(let state):
            self.engine = state
        case .setWindowState(let state):
            self.isWindowOpen = state
        }
        report()
    }
    
    func report() {
        print("Марка",self.mark,"Год пыпуска", self.dateOfManufacture,"Пробег", self.mileage,"Обьем багажника", self.maxtrunkVolume,"Состояние двигателя", self.engine,"Состояние окон", self.isWindowOpen,"Загрузка багажника", self.trunkVolume)
    }
}

var car = Car(mark: "Skoda", dateOfManufacture: 2010, mileage: 200000, maxtrunkVolume: 500, engine: .turnedOff, isWindowOpen: .windowClosed, trunkVolume: 0)

car.report()
car.makeAction(action: .load(200))
car.makeAction(action: .unload(50))
car.makeAction(action: .setEngineState(.turnedOn))
car.makeAction(action: .setWindowState(.windowOpen))


