//
//  FootTableViewCell.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import UIKit

class FootTableViewCell: UITableViewCell {

    
    @IBOutlet weak var leagueImg: UIImageView!
    
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var LeagueName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       /* leagueImg.layer.cornerRadius = leagueImg.frame.height / 2
        leagueImg.clipsToBounds = true
        leagueImg.contentMode = .scaleAspectFill*/
       
        leagueImg?.makeRounded()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left:5 , bottom: 5, right: 5))
        }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIImageView {
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = true  // Ensures content is clipped within the rounded shape
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = self.frame.height / 2 // Make it circular
        clipsToBounds = true
    }
}
