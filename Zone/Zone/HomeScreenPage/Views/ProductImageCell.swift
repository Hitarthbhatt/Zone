//
//  ProductImageCell.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import UIKit

class ProductImageCell: UICollectionViewCell {
    
    
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
        
        
        image.image = UIImage(named: "PlaceholderImage")
        
        return image
    }()
    
    let productName: UILabel = {
        let l = UILabel()
        l.text = "Among Us"
        l.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        l.textColor = .black
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cardView)
        cardView.addSubview(imageCarausel)
        addSubview(productName)
        
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
            cardView.bottomAnchor.constraint(equalTo: productName.topAnchor,constant: -5),
            cardView.heightAnchor.constraint(equalToConstant: 250),
            
        
            imageCarausel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            imageCarausel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            imageCarausel.heightAnchor.constraint(equalToConstant: 180),
            imageCarausel.widthAnchor.constraint(equalToConstant: 180),
            
            productName.leadingAnchor.constraint(equalTo: leadingAnchor),
            productName.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 5),
            productName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
        
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


