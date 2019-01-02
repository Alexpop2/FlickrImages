import Foundation

protocol ImagesInteractorInput: class {
    var output: ImagesInteractorOutput { get set }
    func getImages()
}

protocol ImagesInteractorOutput: class {
    func recieved(images: [Image])
}
