//
//  ImageTableViewCell.swift
//  FlickrImages
//
//  Created by Рабочий on 02/01/2019.
//  Copyright © 2019 Рабочий. All rights reserved.
//

import UIKit
import Kingfisher
import InitialsImageView

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imageFlickr: UIImageView!
    
    var viewModel: ImageTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            let url = URL(string: viewModel.imgFlickr)
            imageFlickr.kf.setImage(with: url)
        }
    }
    
}
