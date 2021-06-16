//
//  ProductDetailViewModel.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import UIKit


class ProductDetailViewModel {
    
    static let shared = ProductDetailViewModel()
    var selectedSize: String = ""
    var selectedColor: String = ""
    var defaultValues: (String, UIColor?, UIImage?) = ("", UIColor(named: ""), UIImage(named: ""))
    var productVariables: [DuddleData] = []
    
    
    private init() {
        
    }
    
    
    
    func getValues(data: [DuddleData]) -> [(String, String)] {
        
        let colors: [(String, String)] = data.map {return ($0.color, $0.image)}
        
        return (colors)
    }
    
    
    
    
    
    func getPrice() -> (String) {
        
        if (!selectedColor.isEmpty ) {
            
            let value: [String]? = productVariables.compactMap { variable in
                
                if (variable.color == self.selectedColor.capitalized) {
                    
                    return (variable.price)
                }
                return nil
            }
            return ((value?[0] ?? ""))
            
        }else {
            return (self.defaultValues.0)
        }
    }
    
    
    
    func getSelectedValue() -> (UIColor?, UIImage?) {
        
        if (!selectedColor.isEmpty) {
            
            let value: [(String, String)] = productVariables.compactMap { variable in
                if (variable.color == self.selectedColor.capitalized) {
                    return (variable.color, variable.image)
                }
                return nil
            }
            
            return (UIColor(named: (value[0].0 )),
                    UIImage(named: (value[0].1 )))
            
        }else {
            return (self.defaultValues.1, self.defaultValues.2)
        }
        
    }
    
    
    
    
}



extension Sequence where Iterator.Element == String {
    
    func uniqueElements() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        
        
        return filter { seen.insert($0).inserted }
        }
    
}

