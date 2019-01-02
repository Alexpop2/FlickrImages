import Foundation

protocol ImagesViewInput: class {
    var presenterInput: ImagesPresenterInput { get set }
    func updateImages(images: [Image])
}
