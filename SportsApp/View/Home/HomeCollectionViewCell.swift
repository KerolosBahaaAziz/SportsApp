//
//  HomeCollectionViewCell.swift
//  SportsApp
//
//  Created by Kerlos on 27/01/2025.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sportImage: UIImageView!
    
    @IBOutlet weak var overView: UIView!
    
    @IBOutlet weak var sportNameLabel: UILabel!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        contentView.addSubview(sportImage)
       // setupUI()

            // Set constraints
        NSLayoutConstraint.activate([
        sportImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        sportImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        sportImage.widthAnchor.constraint(equalToConstant: 100), // Set desired width
        sportImage.heightAnchor.constraint(equalToConstant: 100) // Set desired height
            ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Ensure the view is not nil
        overView?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
}

