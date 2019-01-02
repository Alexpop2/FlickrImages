import UIKit

class ImagesAssembly {
    func build() -> (controller: UIViewController, presenter: ImagesPresenterInput)? {
        let storyboard = UIStoryboard(name: "ImagesStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "kImagesNavigationControllerIdentifier")
        guard let navigationVC = rootVC as? UINavigationController,
              let viewController = navigationVC.viewControllers.first as? ImagesViewController else { return nil }
        
        let presenter = ImagesPresenter()
        let interactor = ImagesInteractor()
        
        viewController.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = viewController
        interactor.output = presenter
        
        return (controller: navigationVC, presenter: presenter)
    }
}
