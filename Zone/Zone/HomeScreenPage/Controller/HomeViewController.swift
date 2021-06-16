//
//  HomeViewController.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import UIKit


class HomeViewController: UIViewController {
    
    
    
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.setCollectionViewLayout(layout, animated: true)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = false
        collection.register(ProductImageCell.self, forCellWithReuseIdentifier: "ProductImageCell")
        collection.contentInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        
        return collection
    }()
    
    
    
    var titleLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Zone"
        l.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        l.textColor = .black
        
        return l
    }()
    
    
    
    
    var menuButton: UIButton = {
        let btn = UIButton(type: .system)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "Menu")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return btn
    }()
    
    
    var profileImage: UIImageView = {
        let img = UIImageView()
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Profile")?.withRenderingMode(.alwaysOriginal)
        img.layer.cornerRadius = 5
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        
        return img
    }()
    
    
    var heyLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Let's"
        l.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        l.textColor = .black
        
        return l
    }()
    
    
    var startLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Get Started !"
        l.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        l.textColor = .black
        
        return l
    }()
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        self.setupViews()
        self.setupConstraints()
        
    }
    
 
    func setupViews() {
        
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
        view.addSubview(menuButton)
        view.addSubview(profileImage)
        view.addSubview(heyLabel)
        view.addSubview(startLabel)
        
        
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            menuButton.widthAnchor.constraint(equalToConstant: 30),
            menuButton.heightAnchor.constraint(equalToConstant: 30),
            
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            profileImage.widthAnchor.constraint(equalToConstant: 40),
            profileImage.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            heyLabel.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 80),
            heyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            startLabel.topAnchor.constraint(equalTo: heyLabel.bottomAnchor, constant: 5),
            startLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            
        ])
        
        
    }
    
    
    
}













import SwiftUI
struct HomeViewPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<HomeViewPreviews.ContainerView>) -> UIViewController {
            
//            return ProfileViewController.profile(UIImage(named: "img3")!, "Prfile")
            
            return HomeViewController()
            
        }
        
        func updateUIViewController(_ uiViewController: HomeViewPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HomeViewPreviews.ContainerView>) {
        }
    }
    
    
}







extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImageCell", for: indexPath) as! ProductImageCell
     
        cell.imageCarausel.image = UIImage(named: products[indexPath.row].mainPic)
        cell.cardView.backgroundColor = UIColor(named: products[indexPath.row].mainColor)
        cell.productName.text = products[indexPath.row].name
        
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        cell.alpha = 0
        UIView.animate(withDuration: 0.85, delay: 0.1 * Double(indexPath.row), usingSpringWithDamping: 1, initialSpringVelocity: 4, options: .curveEaseInOut, animations: {
            cell.transform = .identity
            cell.alpha = 1
        })
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        
        detailVC.ProductData = products[indexPath.row]
        
        present(detailVC, animated: true)
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Sizes.screenWidth/2 - 15 , height: 290)
    }
    
    
}
