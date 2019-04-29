//
//  Country.swift
//  Snacktacular
//
//  Created by Kenyan Houck on 4/29/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import Foundation
import UIKit

class Country {
    
    struct countryData {
        var name: String!
        var guide: String!
        var river: String!
    }
    
    var countryArray: [countryData] = []
    
    var countryName = ["Iceland", "Spain", "New Zealand", "Russia", "Austria"]
    var icelandGuide = ["Fish Partner", "Go Fishing Iceland", "Iceland Fishing Guide", "Iceland Outfitters", "Icelandic Fy Fishermen"]
    var spainGuide = ["Pyrenees Fly Fishing", "Salvelinus", "Carles Vive(2nd tone) Fly Fishing", "Spain on the Fly", "Pesca Travel"]
    var newZealandGuide = ["New Zealand Fly Fishing Guides", "Southern Rivers Fly Fishing", "South Island Adventure Fly Fishing", "Dream Trout", "Off the Beaten Path"]
    var russiaGuide = ["The Fly Shop Kamchatka", "Tailwaters Fly Fishing Co.", "The Best of Kamchatka", "Fly Water Travel", "Ouzel Expeditions"]
    var austriaGuide = ["Alps Fly Fish", "Hunt Austria", "Fly Fish Austria", "Pro Guides Fly Fishing", "Austria Guiding"]
    
    var guides = ListOfGuidesAndRivers()
    
    
    func appendCountry(completed: @escaping () -> () ){
        for country in 0...countryName.count-1 {
            self.countryArray.append(countryData(name: countryName[country], guide: "", river: ""))
            if countryName[country] == "Iceland"
            {
                for guide in 0...icelandGuide.count-1 {
                    self.countryArray.append(countryData(name: countryName[country], guide: guides.icelandGuides[guide], river: guides.iceland[icelandGuide[guide]]))
                }
            } else if countryName[country] == "Spain"
            {
                for guide in 0...icelandGuide.count-1 {
                    self.countryArray.append(countryData(name: countryName[country], guide: guides.spainGuides[guide], river: guides.spain[spainGuide[guide]]))
                }
            } else if countryName[country] == "New Zealand"
            {
                for guide in 0...icelandGuide.count-1 {
                    self.countryArray.append(countryData(name: countryName[country], guide: guides.newZealandGuides[guide], river: guides.newZealand[newZealandGuide[guide]]))
                }
            } else if countryName[country] == "Russia"
            {
                for guide in 0...icelandGuide.count-1 {
                    self.countryArray.append(countryData(name: countryName[country], guide: guides.russiaGuides[guide], river: guides.russia[russiaGuide[guide]]))
                }
            } else if countryName[country] == "Austria"
            {
                for guide in 0...icelandGuide.count-1 {
                    self.countryArray.append(countryData(name: countryName[country], guide: guides.austriaGuides[guide], river: guides.austria[austriaGuide[guide]]))
                }
            }
        }
        completed()
        print("🦄🦄🦄🦄")
        print(countryArray)
    }
    
}
