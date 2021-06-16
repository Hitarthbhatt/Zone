//
//  ColorOptionCollectionView.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import UIKit


class ColorOptionsView: UIView {
    
    var detailModel = ProductDetailViewModel.shared
    var delegate: DetailViewController?
    var colorValues: [(String, String)]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.setCollectionViewLayout(layout, animated: true)
        
        cv.register(ColorOptionCollectionCell.self, forCellWithReuseIdentifier: "ColorOptionCollectionCell")
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.alwaysBounceHorizontal = true
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        
        
        return cv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        collectionView.pin(to: self)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}











extension ColorOptionsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorValues?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorOptionCollectionCell", for: indexPath) as! ColorOptionCollectionCell
        
        var t = CGAffineTransform.identity
        t = t.rotated(by: -10)
        
        cell.cardView.backgroundColor = UIColor(named: self.colorValues?[indexPath.row].0 ?? "")
        cell.imageCarausel.image = UIImage(named: self.colorValues?[indexPath.row].1 ?? "")
        
        
        if self.detailModel.selectedColor == self.colorValues?[indexPath.row].0.lowercased() ?? "" {
            UIView.animate(withDuration: 0.5) {
                cell.cardView.transform = t
            }
        }else {
            cell.cardView.transform = .identity
        }
        
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ColorOptionCollectionCell
        
        var t = CGAffineTransform.identity
        t = t.rotated(by: -10)
        
        if self.detailModel.selectedColor ==  self.colorValues?[indexPath.row].0.lowercased() ?? "" {
            self.detailModel.selectedColor = ""
            self.delegate?.didChangeColor(selectedColor: "")
            
            cell.cardView.transform = .identity
            collectionView.reloadData()
            
        }else {
            self.detailModel.selectedColor = self.colorValues?[indexPath.row].0.lowercased() ?? ""
            self.delegate?.didChangeColor(selectedColor: self.colorValues?[indexPath.row].0 ?? "")
            
            cell.cardView.transform = t
            collectionView.reloadData()
        }
        
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}




