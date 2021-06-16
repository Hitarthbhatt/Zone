//
//  Product.swift
//  Zone
//
//  Created by Hitarth on 13/06/21.
//

import Foundation


struct Product {
    
    let name: String
    let price: String
    let mainPic: String
    let mainColor: String
    let productVaribles: [DuddleData]
    
}


struct DuddleData {
    
    let image: String
    let color: String
    let price: String
    
}


let products: [Product] = [
    
    Product(name: "Among Us",
            price: "₹2099",
            mainPic: "AmongPurple",
            mainColor: "Green",
            productVaribles: [DuddleData(image: "AmongBlue",
                                              color: "Orange",
                                              price: "₹1099"),
                              
                              
                              DuddleData(image: "AmongOrange",
                                              color: "Blue",
                                              price: "₹1299"),
                              
                              
                              DuddleData(image: "AmongPink",
                                              color: "Yellow",
                                              price: "₹3000"),
                              
                              
                              DuddleData(image: "AmongPurple",
                                              color: "Green",
                                              price: "₹1450"),
                              
            ]),
    
    Product(name: "Rocket Girl",
            price: "₹1500",
            mainPic: "RocketGirlOne",
            mainColor: "Yellow",
            productVaribles: [DuddleData(image: "RocketGirlOne",
                                              color: "Pink",
                                              price: "₹1200"),
                              
                              
                              DuddleData(image: "RocketGirlTwo",
                                              color: "Yellow",
                                              price: "₹2000"),
                              
                              
                              DuddleData(image: "RocketGirlThree",
                                              color: "Green",
                                              price: "₹2400"),
                              
                              
            ]),
    
    Product(name: "Tracker",
            price: "₹4000",
            mainPic: "TrackerThree",
            mainColor: "Orange",
            productVaribles: [DuddleData(image: "TrackerOne",
                                              color: "Yellow",
                                              price: "₹1000"),
                              
                              DuddleData(image: "TrackerTwo",
                                              color: "Orange",
                                              price: "₹2199"),
                              
                              
                              DuddleData(image: "TrackerThree",
                                              color: "Green",
                                              price: "₹1200"),
                              
            ]),
    
    Product(name: "Robo Man",
            price: "₹4400",
            mainPic: "RoboOne",
            mainColor: "Pink",
            productVaribles: [DuddleData(image: "RoboOne",
                                              color: "Yellow",
                                              price: "₹3400"),
                              
                              DuddleData(image: "RoboTwo",
                                              color: "Pink",
                                              price: "₹1699"),
                              
                              DuddleData(image: "RoboThree",
                                              color: "Blue",
                                              price: "1999"),
                              
            ]),
    
    
    
    
]
