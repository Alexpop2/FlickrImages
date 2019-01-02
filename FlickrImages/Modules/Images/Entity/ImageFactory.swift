//
//  ImageFactory.swift
//  FlickrImages
//
//  Created by Рабочий on 02/01/2019.
//  Copyright © 2019 Рабочий. All rights reserved.
//

import Foundation

class ImageFactory {
    func fakeImages(number: Int) -> [Image] {
        var imageArray = [Image]()
        for _ in 0..<number {
            imageArray.append(Image(url: "https://c1.staticflickr.com/8/7078/13183482194_014092fc55.jpg"))
        }
        return imageArray
    }
}
