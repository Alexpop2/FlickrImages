import UIKit

class ImagesRouter {
    func rootModuleController() -> UIViewController {
        let imagesAssembly = ImagesAssembly()
        guard let images = imagesAssembly.build() else { return UIViewController() }
        images.presenter.output = self
        return images.controller
    }
}

extension ImagesRouter: ImagesPresenterOutput {
    
}
