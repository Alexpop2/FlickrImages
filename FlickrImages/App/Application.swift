import UIKit

//сервисный объект - класс, объекты данных структуры

// MARK: - Properties

class Application {
    private let imagesRouter: ImagesRouter!
    
    init() {
        imagesRouter = ImagesRouter()
    }
}

// MARK: - Initialization

extension Application {
    func fire() -> UIViewController {
        return imagesRouter.rootModuleController()
    }
}
