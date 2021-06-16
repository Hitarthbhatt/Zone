//
//  ProductImageView.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import UIKit

class ProductImageView: UIView {
    
    
    var cardView: UIView = {
       let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.layer.cornerRadius = 10
        card.clipsToBounds = true
        
        return card
    }()
    
    let imageCarausel: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        
        
        return image
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cardView)
        cardView.addSubview(imageCarausel)
        
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        
        
    }
    
    
    
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            

            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 350),
            
        
            imageCarausel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            imageCarausel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            imageCarausel.heightAnchor.constraint(equalToConstant: 250),
            imageCarausel.widthAnchor.constraint(equalToConstant: 250),
            
            
            
        
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


