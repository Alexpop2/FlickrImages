import Foundation

protocol ImagesPresenterInput: class {
    var output: ImagesPresenterOutput { get set }
    var viewInput: ImagesViewInput { get set }
    var interactorInput: ImagesInteractorInput { get set }
}

protocol ImagesPresenterOutput: class {
}
