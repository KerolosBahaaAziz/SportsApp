//
//  TennisTableViewCell.swift
//  SportsApp
//
//  Created by Kerlos on 02/02/2025.
//

import UIKit

class TennisTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left:5 , bottom: 5, right: 5))
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 25, left:25 , bottom: 25, right: 25))

    }

}
