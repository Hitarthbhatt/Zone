//
//  ColorOptionCollectionCell.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import UIKit


class ColorOptionCollectionCell: UICollectionViewCell {

    
    var cardView: UIView = {
       let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(named: "Green")
        card.layer.cornerRadius = 10
        card.clipsToBounds = true
        
        return card
    }()
    
    let imageCarausel: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        
        
        image.image = UIImage(named: "RocketGirlOne")
        
        return image
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(cardView)
        cardView.addSubview(blurEffectView)
        addSubview(imageCarausel)
        
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        
        
    }
    
    
    
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            

            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
        
            imageCarausel.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageCarausel.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageCarausel.heightAnchor.constraint(equalToConstant: 50),
            imageCarausel.widthAnchor.constraint(equalToConstant: 50),
            
            
            
        
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
