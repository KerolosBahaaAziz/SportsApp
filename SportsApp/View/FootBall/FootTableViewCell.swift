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
    
    private let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       /* leagueImg.layer.cornerRadius = leagueImg.frame.height / 2
        leagueImg.clipsToBounds = true
        leagueImg.contentMode = .scaleAspectFill*/
       
        
        //setupGradientBackground()
     
       // countryName.textColor = .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left:1 , bottom: 8, right: 1))
        gradientLayer.frame = bounds
        leagueImg?.makeRounded()
        countryName?.textColor = .white
        LeagueName?.textColor = .white
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupGradientBackground() {
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom-right
        layer.insertSublayer(gradientLayer, at: 0) // Insert into cell's main layer

        layer.cornerRadius = 15
        layer.masksToBounds = true
    }

}

extension UIImageView {
    func makeRounded() {
        layer.borderWidth = 0
        self.layer.masksToBounds = true  // Ensures content is clipped within the rounded shape
        //layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2 // Make it circular
        self.clipsToBounds = true
    }
}
