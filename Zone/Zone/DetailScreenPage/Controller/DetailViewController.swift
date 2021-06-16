//
//  DetailViewController.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var ProductData: Product?
    let productDetailModel = ProductDetailViewModel.shared
    var isLiked: Bool = false
    
    lazy var productImage: ProductImageView = {
        let img = ProductImageView()
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.cardView.backgroundColor = UIColor(named: ProductData?.mainColor ?? "Green")
        img.imageCarausel.image = UIImage(named: ProductData?.mainPic ?? "RocketGirlOne")
        
        return img
    }()
    
    
    
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = ProductData?.name ?? ""
        l.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        l.textColor = .black
        
        
        return l
    }()
    
    
    lazy var priceLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = ProductData?.price ?? ""
        l.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        l.textColor = .black
        
        return l
    }()
    
    
    lazy var colorLabel: UILabel = {
        let l = UILabel()
        l.text = "Color:"
        l.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
    
    lazy var colorOptions: ColorOptionsView = {
        let c = ColorOptionsView()
        c.translatesAutoresizingMaskIntoConstraints = false
        c.delegate = self
        
        
        return c
    }()
    
    
    
    
    
    var cardView: UIView = {
       let card = UIView()
        
        card.translatesAutoresizingMaskIntoConstraints = false
        card.layer.cornerRadius = 15
        card.backgroundColor = .black
        
        return card
    }()
    
    var addCartLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "ADD TO CART"
        l.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        l.textColor = .white
        
        return l
    }()
    
    var cartImage: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "cart"), for: .normal)
        btn.tintColor = .black
        
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 20
        
        return btn
    }()
    
    
    var likeImage: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.tintColor = .white
        
        btn.setImage(UIImage(systemName: "heart.fill"), for: .highlighted)
        
        btn.backgroundColor = UIColor(white: 0.1, alpha: 0.2)
        btn.layer.cornerRadius = 25
        btn.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    
    lazy var rateView: RateUsView = {
       let rate = RateUsView()
        
        rate.translatesAutoresizingMaskIntoConstraints = false
        
        return rate
    }()
    
    
    lazy var rateLabel: UILabel = {
        let l = UILabel()
        l.text = "Rate Here"
        l.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
    var successImage: UIImageView = {
        let img = UIImageView()
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Done")
        
        return img
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        self.configure()
        self.setupViews()
        self.setupConstraints()
        
    }
    
    
    
    //MARK:- Configure Detail Table Cell Values.
    
    
    func configure() {
        
        self.productDetailModel.selectedSize = ""
        self.productDetailModel.selectedColor = ""
        self.productDetailModel.defaultValues = (ProductData?.price ?? "",
                                                UIColor(named: ProductData?.mainColor ?? ""),
                                                UIImage(named: ProductData?.mainPic ?? ""))
        
        if let productVariables = ProductData?.productVaribles {
            
            self.productDetailModel.productVariables = productVariables
            (self.colorOptions.colorValues) = self.productDetailModel.getValues(data: productVariables)
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    func setupViews() {
        
        view.addSubview(productImage)
        view.addSubview(likeImage)
        view.addSubview(nameLabel)
        view.addSubview(priceLabel)
        view.addSubview(colorLabel)
        view.addSubview(colorOptions)
        view.addSubview(rateLabel)
        view.addSubview(rateView)
        
        view.addSubview(cardView)
        cardView.addSubview(addCartLabel)
        cardView.addSubview(cartImage)
        
        addToCartTapGesture()
        
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            productImage.topAnchor.constraint(equalTo: view.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 350),
            
            
            likeImage.topAnchor.constraint(equalTo: productImage.topAnchor, constant: 20),
            likeImage.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: -20),
            likeImage.heightAnchor.constraint(equalToConstant: 50),
            likeImage.widthAnchor.constraint(equalToConstant: 50),
            
            
            nameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            colorLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 25),
            
            
            colorOptions.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            colorOptions.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 15),
            colorOptions.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            colorOptions.heightAnchor.constraint(equalToConstant: 80),
            
            
            
            rateLabel.topAnchor.constraint(equalTo: colorOptions.bottomAnchor, constant: 40),
            rateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            rateView.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 10),
            rateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardView.heightAnchor.constraint(equalToConstant: 60),
            
            addCartLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            addCartLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            cartImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            cartImage.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            cartImage.heightAnchor.constraint(equalToConstant: 40),
            cartImage.widthAnchor.constraint(equalToConstant: 40),
            
            
            
            
            
        ])
        
        
    }
    
    
    
    func addToCartTapGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addToCartMethod))
        
        cardView.addGestureRecognizer(tapGesture)
    
        
    }
    
    
    
    @objc func addToCartMethod() {
        
        self.view.addSubview(self.successImage)
        
        self.successImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        self.successImage.alpha = 0
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 8, options: .curveEaseInOut, animations: {
            self.successImage.alpha = 1
            self.successImage.transform = .identity
        }, completion: nil)
        
        
        NSLayoutConstraint.activate([
        
            successImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            successImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            successImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            successImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
        
        ])
        
        UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 8, options: .curveEaseInOut, animations: {
            
            self.successImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.successImage.alpha = 0
            
        }, completion: { (action) in
            self.successImage.removeFromSuperview()
        })
        
        
    }
    
    
    
    
    
    @objc func likeButtonPressed() {
        
        likeImage.setImage(UIImage(systemName: isLiked ? "heart" : "heart.fill"), for: .normal)
        likeImage.tintColor = isLiked ? .white : .red
        isLiked.toggle()
        
    }
    
    
    
    
    //MARK:- Color, Price Changing Method
    
    var newProductImage: UIImage?
    var newProductColor: UIColor?
    
    
    
    func didChangeColor(selectedColor: String) {
        
        self.colorLabel.text = "Color: \(selectedColor)"
        self.priceLabel.text = self.productDetailModel.getPrice()
        (self.newProductColor, self.newProductImage) = self.productDetailModel.getSelectedValue()
        
        self.setProductImage()
        
    }
    
    
    
    func setProductImage() {
        
        
        var t = CGAffineTransform.identity
        t = t.translatedBy(x: -150, y: 0)
        t = t.rotated(by: -360)
        t = t.scaledBy(x: 0.1, y: 0.1)
        
        productImage.imageCarausel.transform = t
        productImage.imageCarausel.alpha = 0
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: .transitionCrossDissolve, animations: {
            
            self.productImage.cardView.backgroundColor = self.newProductColor
            
        })
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            
            self.productImage.imageCarausel.transform = .identity
            self.productImage.imageCarausel.alpha = 1
            
            self.productImage.imageCarausel.image = self.newProductImage
            
        })
        
    }
    
    
    
}





extension UIView {
    
    func pin(to superView: UIView) {
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        
    }
    
}
