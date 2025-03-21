//
//  TeamsCollectionViewCell.swift
//  SportsApp
//
//  Created by Kerlos on 02/02/2025.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var teamLogo: UIImageView!
    
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
        //gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top-left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom-right
        layer.insertSublayer(gradientLayer, at: 0) // Insert into cell's main layer

        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds // Ensure it resizes properly
    }
    
}
