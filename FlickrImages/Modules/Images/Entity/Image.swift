//
//  Image.swift
//  FlickrImages
//
//  Created by Рабочий on 02/01/2019.
//  Copyright © 2019 Рабочий. All rights reserved.
//

import Foundation

struct Image {
    let url: String
}

extension Image: ImageTableViewCellModel {
    var imgFlickr: String {
        return url
    }
}
