//
//  CommentTableViewCell.swift
//  RxSwiftTestProject
//
//  Created by Anastasia Nesterkina on 05.12.2020.
//

import Foundation
import UIKit

class CommentTableViewCell: UITableViewCell {
    static let reusedId = "CommentTableViewCell"
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    
    func setupCell(title: String, email: String, comment: String) {
        self.titleLabel.text = title
        self.emailLabel.text = email
        self.commentLabel.text = comment
    }
}
