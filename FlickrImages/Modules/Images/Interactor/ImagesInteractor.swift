import Foundation

class ImagesInteractor {
    private var interactorOutput: ImagesInteractorOutput!
    private var images = [Image]()
    
    func imagesFromURL() {
        let url = URL(string: "https://www.flickr.com/services/rest?method=flickr.interestingness.getList&api_key=3988023e15f45c8d4ef5590261b1dc53&per_page=40&page=1&format=json&nojsoncallback=1&extras=url_l&date=2018-09-23")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.parseURL(data: data)
            }
        }
        task.resume()
    }
    
    private func parseURL(data: Data) {
        do {
            let flickrResponse = try JSONDecoder().decode(FlickrGalleryResponse.self, from: data)
            images.removeAll()
            for i in 0..<flickrResponse.photos.photo.count {
                guard let url = flickrResponse.photos.photo[i].url_l else { continue }
                images.append(Image(url: url))
            }
            self.interactorOutput.recieved(images: self.images)
            //print(flickrResponse)
        } catch {
            print("error = \(error.localizedDescription)")
        }
    }

    func imagesFromGalleryID(galleryID: String) {
        let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.galleries.getPhotos&api_key=2f7b3ca61bf5bbdbbe5928eb5ce05f3c&gallery_id=\(galleryID)&format=json&nojsoncallback=1")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.parseGallery(data: data)
            }
        }
        task.resume()
    }
    
    private func parseGallery(data: Data) {
        do {
            let flickrResponse = try JSONDecoder().decode(FlickrGalleryResponse.self, from: data)
            images.removeAll()
            for i in 0..<flickrResponse.photos.photo.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(i), execute: {
                    self.getImageURL(imageID: flickrResponse.photos.photo[i].id)
                })
            }
            //print(flickrResponse)
        } catch {
            print("error = \(error.localizedDescription)")
        }
    }
    
    private func getImageURL(imageID: String) {
        let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=2f7b3ca61bf5bbdbbe5928eb5ce05f3c&photo_id=\(imageID)&format=json&nojsoncallback=1")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.parseImage(data: data)
                self.interactorOutput.recieved(images: self.images)
            }
        }
        task.resume()
    }
    
    private func parseImage(data: Data) {
        do {
            let flickrResponse = try JSONDecoder().decode(FlickrImageResponse.self, from: data)
            //print(flickrResponse)
            images.append(Image(url: flickrResponse.sizes.size[1].source))
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
    }
    
}

extension ImagesInteractor: ImagesInteractorInput {
    func getImages() {
        //let imageFactory = ImageFactory()
        //imagesFromGalleryID(galleryID: "66911286-72157647277042064")
        imagesFromURL()
        //interactorOutput.recieved(images: imageFactory.fakeImages(number: 15))
    }
    
    var output: ImagesInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            interactorOutput = newValue
        }
    }
}
