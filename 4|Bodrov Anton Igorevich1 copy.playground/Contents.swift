import UIKit

enum Trucktype {
    case van, wagon, jumbo
}

enum EngineState {
    case turnedOn, turnedOff
}

enum WindowState {
    case windowOpened, windowClosed
}

enum NitroState {
    case nitroOn, nitroOff
}

enum TransmitionState {
    case drive, neutral, parking, rear
}

enum SportCarAction {
    case setNitroState(NitroState)
}

enum TruckCarAction {
    case choseType(Trucktype)
    case load(Int)
    case unload(Int)
}

enum CarActions {
    case setEngineState(EngineState)
    case setWindowState(WindowState)
    case setTransimionState(TransmitionState)
}

class Car {
    
    var mark: String
    var engine: EngineState = .turnedOff
    var window: WindowState = .windowClosed
    var transmition: TransmitionState = .parking
    
    init(mark: String, engine: EngineState, window:WindowState, transmition:TransmitionState) {
        
        self.mark = mark
        self.engine = engine
        self.window = window
        self.transmition = transmition
    }
    
    func report() {
        print("Марка авто", self.mark, "Состояние двигателя", self.engine, "Состояние окна", self.window, "Передача", self.transmition)
    }
    
    func makeAction (action: CarActions) {
        switch action {
        case .setEngineState(let state):
        self.engine = state
        case .setWindowState(let state):
        self.window = state
        case .setTransimionState(let state):
            self.transmition = state
        }
    report()
    }
}

class SportCar: Car {
    
    var nitro: NitroState = .nitroOff
    var zeroToHundred: Double
    
    init(mark: String, engine: EngineState, window: WindowState, transmition: TransmitionState, nitro: NitroState, zeroToHundred: Double) {
        self.nitro = nitro
        self.zeroToHundred = zeroToHundred
        super.init(mark: mark, engine: engine, window: window, transmition: transmition)
    }
    func reportSport() {
        print("Марка авто", self.mark, "Состояние двигателя", self.engine, "Состояние окна", self.window, "Передача", self.transmition, "Соттояние Нитро",self.nitro,"Разгон до 100 км/ч",self.zeroToHundred)
       
    }
    func sportCarMakeAction (action:SportCarAction) {
        switch action {
        case .setNitroState(let state):
            self.nitro = state
        }
        reportSport()
    }
}

class TruckCar:Car {
    
    var trunckLoad: Int
    var maxLoad: Int
    var truckType: Trucktype
    
    init(mark: String, engine: EngineState, window: WindowState, transmition: TransmitionState, trunckLoad: Int, maxLoad:Int, truckType:Trucktype) {
        self.trunckLoad = trunckLoad
        self.maxLoad = maxLoad
        self.truckType = truckType
        super.init(mark: mark, engine: engine, window: window, transmition: transmition)
    }
    
    func truckReport() {
        print("Марка авто", self.mark, "Состояние двигателя", self.engine, "Состояние окна", self.window, "Передача", self.transmition, "Тип грузовика", self.truckType,"Макс вместимость", self.maxLoad,"Загрузка багажника", self.trunckLoad)
    }
    func truckCarAction(action:TruckCarAction) {
        switch action {
        case .choseType(let state):
            self.truckType = state
        case .load(let load):
            if trunckLoad + load > maxLoad {
                print("Грузовик переполнен")
            } else {
                self.trunckLoad += load
            }
        case .unload(let unload):
            if trunckLoad - unload < 0 {
                print("Вы пытаетесь разгрузить больше, чем есть в грузовике")
            } else {
            self.trunckLoad -= unload
            }
        }
        truckReport()
    }
}

var car = Car(mark: "audi", engine: .turnedOff, window: .windowClosed, transmition: .parking)
car.makeAction(action: .setEngineState(.turnedOn))
car.makeAction(action: .setTransimionState(.drive))

var sportCar = SportCar(mark: "lotus", engine: .turnedOff, window: .windowOpened, transmition: .rear, nitro: .nitroOff, zeroToHundred: 2)
sportCar.sportCarMakeAction(action: .setNitroState(.nitroOn))

var truckCar = TruckCar(mark: "Iveco", engine: .turnedOff, window: .windowClosed, transmition: .neutral, trunckLoad: 100, maxLoad: 100000, truckType: .jumbo)
truckCar.truckCarAction(action: .load(300))
truckCar.truckCarAction(action: .unload(50))
truckCar.truckCarAction(action: .choseType(.wagon))

