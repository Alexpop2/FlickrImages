import Foundation

class ImagesPresenter {
    private var presenterOutput: ImagesPresenterOutput!
    private weak var view: ImagesViewInput!
    private var interactor: ImagesInteractorInput!
}

extension ImagesPresenter: ImagesPresenterInput {
    var output: ImagesPresenterOutput {
        get {
            return presenterOutput
        }
        set {
            presenterOutput = newValue
        }
    }
    
    var viewInput: ImagesViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var interactorInput: ImagesInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
    
    
}

extension ImagesPresenter: ImagesInteractorOutput {
    func recieved(images: [Image]) {
        view.updateImages(images: images)
    }
}
