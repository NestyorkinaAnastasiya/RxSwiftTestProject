//
//  PostPreviewTable.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 04.12.2020.
//

import Foundation
import UIKit
class PostPreviewTableViewCell: UITableViewCell {
    static let reusedId = "PostPreviewTableViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var postPreviewLabel: UILabel!
    
    func setupCell(title: String, postPreview: String, author: String?) {
        self.titleLabel.text = title
        self.postPreviewLabel.text = postPreview
    }
}
