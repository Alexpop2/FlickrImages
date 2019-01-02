//
//  FlickrResponse.swift
//  FlickrImages
//
//  Created by Рабочий on 02/01/2019.
//  Copyright © 2019 Рабочий. All rights reserved.
//

import Foundation

struct FlickrGalleryResponse: Codable {
    var photos: Photos
    var stat: String
}

struct Photos: Codable {
    var page: Int
    var pages: Int
    var perpage: Int
    var total: Int
    var photo: [Photo]
}

struct Photo: Codable {
    var id: String
    var url_l: String?
}

struct FlickrImageResponse: Codable {
    var sizes: Sizes
}

struct Sizes: Codable {
    var size: [Size]
}

struct Size: Codable {
    var label: String
    var source: String
}
