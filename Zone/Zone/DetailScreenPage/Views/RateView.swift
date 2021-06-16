//
//  RateView.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import UIKit


class RateUsView: UIView {
    
    var totalRating = 0
    
    
    
    
    lazy var star1 = CustomStarView()
    lazy var star2 = CustomStarView()
    lazy var star3 = CustomStarView()
    lazy var star4 = CustomStarView()
    lazy var star5 = CustomStarView()
    
   
    lazy var stackView: UIStackView = {
       let s = UIStackView()
        
        s.axis = .horizontal
        s.translatesAutoresizingMaskIntoConstraints = false
        s.distribution = .fillEqually
        s.backgroundColor = .clear
        s.spacing = 10
        
        return s
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        self.frame = UIScreen.main.bounds
        
        self.clipsToBounds = true
        
        setupViews()
        setupCostraints()
        starTapGesture()
        
    }
    
    
    
    func setupViews() {
        
        addSubview(stackView)
        stackView.addArrangedSubview(star1)
        stackView.addArrangedSubview(star2)
        stackView.addArrangedSubview(star3)
        stackView.addArrangedSubview(star4)
        stackView.addArrangedSubview(star5)
        
    }
    
    
    
    
    func setupCostraints() {
        
        NSLayoutConstraint.activate([
        
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            stackView.heightAnchor.constraint(equalToConstant: 50),
      
            
        ])
        
        
    }
    
    
    
    
    
    func starTapGesture() {
        
        let star1TapGesture = UITapGestureRecognizer(target: self, action: #selector(star1Pressed))
        star1.addGestureRecognizer(star1TapGesture)
        
        let star2TapGesture = UITapGestureRecognizer(target: self, action: #selector(star2Pressed))
        star2.addGestureRecognizer(star2TapGesture)
        
        let star3TapGesture = UITapGestureRecognizer(target: self, action: #selector(star3Pressed))
        star3.addGestureRecognizer(star3TapGesture)
        
        let star4TapGesture = UITapGestureRecognizer(target: self, action: #selector(star4Pressed))
        star4.addGestureRecognizer(star4TapGesture)
        
        let star5TapGesture = UITapGestureRecognizer(target: self, action: #selector(star5Pressed))
        star5.addGestureRecognizer(star5TapGesture)
        
    }
    
    
    
    
    
    
    
    @objc func star1Pressed() {
        
        UIView.animate(withDuration: 0.4) {
            
            self.star1.starImage.tintColor = .orange
            self.star2.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            self.star3.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            self.star4.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            self.star5.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            
            self.totalRating = 1
            
        }
        
    }
    
    
    @objc func star2Pressed() {
        
        UIView.animate(withDuration: 0.4) {
            
            self.star1.starImage.tintColor = .orange
            self.star2.starImage.tintColor = .orange
            self.star3.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            self.star4.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            self.star5.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            
            self.totalRating = 2
            
        }
        
    }
    
    
    @objc func star3Pressed() {
        
        UIView.animate(withDuration: 0.4) {
            
            self.star1.starImage.tintColor = .orange
            self.star2.starImage.tintColor = .orange
            self.star3.starImage.tintColor = .orange
            self.star4.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            self.star5.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            
            self.totalRating = 3
            
        }
        
    }
    
    
    
    @objc func star4Pressed() {
        
        UIView.animate(withDuration: 0.4) {
            
            self.star1.starImage.tintColor = .orange
            self.star2.starImage.tintColor = .orange
            self.star3.starImage.tintColor = .orange
            self.star4.starImage.tintColor = .orange
            self.star5.starImage.tintColor = UIColor(white: 0.9, alpha: 1)
            
            self.totalRating = 4
            
        }
        
    }
    
    
    
    @objc func star5Pressed() {
        
        UIView.animate(withDuration: 0.4) {
            
            self.star1.starImage.tintColor = .orange
            self.star2.starImage.tintColor = .orange
            self.star3.starImage.tintColor = .orange
            self.star4.starImage.tintColor = .orange
            self.star5.starImage.tintColor = .orange
            
            self.totalRating = 5
            
        }
        
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
