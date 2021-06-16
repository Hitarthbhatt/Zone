//
//  CustomStarView.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import UIKit

class CustomStarView: UIView {
    
    
    lazy var starImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(systemName: "star.fill")
        img.tintColor = UIColor(white: 0.9, alpha: 1)
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(starImage)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            starImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            starImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            starImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            starImage.topAnchor.constraint(equalTo: topAnchor, constant: 6)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
