//
//  LeagueDetailsCollectionViewCell.swift
//  SportsApp
//
//  Created by Kerlos on 29/01/2025.
//

import UIKit

class LeagueDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var homeImg: UIImageView!
    
    
    @IBOutlet weak var awayImg: UIImageView!
    
    @IBOutlet weak var resultL: UILabel!
    
    @IBOutlet weak var dateL: UILabel!
    
    @IBOutlet weak var vsL: UILabel!
    
    private let gradientLayer = CAGradientLayer()

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupGradientBackground()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupGradientBackground()
        }

        private func setupGradientBackground() {
            gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.black.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left
            gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom-right
            layer.insertSublayer(gradientLayer, at: 0) // Insert into cell's main layer

            layer.cornerRadius = 15
            layer.masksToBounds = true
            
            dateL?.textColor = .white
            vsL?.textColor = .white
            resultL?.textColor = .white
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            gradientLayer.frame = bounds // Ensure it resizes properly
        }
    
}
