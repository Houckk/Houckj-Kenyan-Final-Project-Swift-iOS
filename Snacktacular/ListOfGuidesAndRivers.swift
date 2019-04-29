//
//  ListOfGuidesAndRivers.swift
//  Snacktacular
//
//  Created by Kenyan Houck on 4/28/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import Foundation
import UIKit

class ListOfGuidesAndRivers{

    var icelandRivers : Array<String>
    var icelandGuides : Array<String>
    var iceland: [String: String] = [:]
    
    var spainRivers : Array<String>
    var spainGuides : Array<String>
    var spain: [String: String] = [:]
    
    var newZealandRivers : Array<String>
    var newZealandGuides : Array<String>
    var newZealand: [String: String] = [:]
    
    var russiaRivers : Array<String>
    var russiaGuides : Array<String>
    var russia: [String: String] = [:]
    
    var austriaRivers : Array<String>
    var austriaGuides : Array<String>
    var austria: [String: String] = [:]

    var countriesAvailable : Array<String>
    var compiledCompleteGuidesWithRivers = [Dictionary<String, String>]()

    
    
    init(){
    //MARK: TOTAL LIST OF COUNTRIES
    countriesAvailable = ["Iceland", "Spain", "New Zealand", "Russia", "Austria"]


    

    //MARK:ICELAND
     icelandRivers = ["Lake Thingvallavatn", "Kaldakvisl River", "Tungnaa River", "Upper Blanda River", "Gljufura River", "Laxa River", "Holaa River", "Varma River", "Galtalaekur River", "Arnarvatnsheidi Lakes and Streams", "Minnivallalaekur River", "Bruara River", "Litlaa River", "Laxa Myvatn River", "Svarta River", "Langa River", "Breiddalsa River", "West Ranga River", "Jokla River", "Leirvogsa River", "Brynjudalsa River", "Korpa River", "Ellidaar River", "Sog River", "Stora Laxa River", "Hrutafjardara River", "Lonsa River", "Lake Langavatn", "Lake Hraunsvatn", "Brunna River", "Eyjafjaroara River", "Myrarkvisl River", "Fnjoska River", "Hofsa River", "Holkna River", "Fljota River", "Fossa River", "Lake Lysa", "Leira River", "Nordfjardara River", "Reykjadalsa River", "Tungufljot River", "Urridafoss Waterfall", "Flekkudalsa River", "Haukadalsa River", "Hitara River", "Kjarra River", "Nordura River", "Sela River", "Sunnudalsa River", "Thvera River", "Tungulaekur River"]

     icelandGuides = ["Fish Partner", "Go Fishing Iceland", "Iceland Fishing Guide", "Iceland Outfitters", "Icelandic Fy Fishermen"]

     iceland = ["Fish Partner" : "Lake Thingvallavatn, Kaldakvisl River, Tungnaa River, Upper Blanda River, Gljufura River, Laxa River", "Go Fishing Iceland" : "Holaa River, Varma River, Lake Thingvallavatn, Kaldakvisl River, Galtalaekur River, Arnarvatnsheidi Lakes and Streams, Minnivallalaekur River, Bruara River, Litlaa River, Laxa Myvatn River, Svarta River, Langa River, Breiddalsa River, West Ranga River, Jokla River, Leirvogsa River, Brynjudalsa River, Korpa River, Ellidaar River, Sog River, Stora Laxa River, Hrutafjardara River", "Iceland Fishing Guide" : "Lonsa River, Lake Langavatn, Lake Hraunsvatn, Brunna River, Laxa River, Eyjafjaroara River, Myrarkvisl River, Litlaa River, Lake Thingvallavatn, Fnjoska River, Jokla River, Hofsa River, Holkna River", "Iceland Outfitters" : "Laxa River, Brunna River, Fljota River, Fossa River, Galtalaekur River, Holaa River, Lake Lysa, Laxa River, Leira River, Nordfjardara River, Reykjadalsa River, Lake Thingvallavatn, Tungufljot River, Urridafoss Waterfall, Varma River", "Icelandic Fly Fishermen" : "Flekkudalsa River, Haukadalsa River, Hitara River, Hofsa River, Holkna River, Kjarra River, Langa River, Laxa River, Nordura River, Sela River, Sunnudalsa River, Thvera River, Tungulaekur River"]
 
    //MARK: SPAIN

     spainRivers = ["Gallego River", "Cinca River", "Ara River", "Aragon River", "Veral River", "Pyrenees Rivers", "Lake Lacs", "Lake Ibones", "Segre River", "Ter River", "Saltwater Options", "Elsa River", "Porma River", "Orbigo River", "Pisuerga River", "Carrion River", "Deva River", "Sella River", "Narcea River", "Eo River", "Ara River", "Tormes River", "Tajo River", "Gallo River", "Jucar River", "Cabriel River" ]

     spainGuides = ["Pyrenees Fly Fishing", "Salvelinus", "Carles Vive(2nd tone) Fly Fishing", "Spain on the Fly", "Pesca Travel"]

     spain = ["Pyrenees Fly Fishing" : "Gallego River, Cinca River, Ara River, Aragon River, Veral River, Pyrenees Rivers", "Salvelinus": "Lake Lacs, Lake Ibones,  Pyrenees Rivers", "Carles Vive(2nd tone) Fly Fishing": "Segre River, Ter River,  Pyrenees Rivers", "Spain on the Fly": "Pyrenees Rivers, Saltwater Options", "Pesca Travel": "Elsa River, Porma River, Orbigo River, Pisuerga River, Carrion River, Deva River, Sella River, Narcea River, Eo Rivers, Gallego River, Aragon River, Veral River, Ara River, Tormes River, Tajo River, Gallo River, Jucar River, Cabriel River" ]


    //MARK: NEW ZEALAND

     newZealandRivers = ["Mataura River", "Fjords/Southern Alps Rivers", "Tongariro River", "Whanganui River", "Whakapapa River", "Puniu River", "Mangatutu Stream", "Mohaka River", "Waipunga River", "Lake Whakamaru", "Lake Otamangakau", "Whirinaki River", "Tukituki River", "Ngaruroro River", "Tukaekuri River", "Saltwater Options"]

     newZealandGuides = ["New Zealand Fly Fishing Guides", "Southern Rivers Fly Fishing", "South Island Adventure Fly Fishing", "Dream Trout", "Off the Beaten Path"]

     newZealand = ["New Zealand Fly Fishing Guides": "Mataura River", "Southern Rivers Fly Fishing": "Mataura River, Fjords/Southern Alps Rivers", "South Island Adventure Fly Fishing": "Mataura River, Fjords/Southern Alps Rivers", "Dream Trout": "Tongariro River, Whanganui River, Whakapapa River, Puniu River, Mangatutu Stream, Mohaka River, Waipunga River, Lake Whakamaru, Lake Otamangakau, Whirinaki River", "Off the Beaten Path": "Tukituki River, Ngaruroro River, Tukaekuri River, Mohaka River, Saltwater Options"]



    //MARK: RUSSIA

     russiaRivers = ["Zhupanova River", "Ichanga River", "Savan River", "Sedanka River", "Ozernaya River", "Two Yurt River", "Opala River"]

     russiaGuides = ["The Fly Shop Kamchatka", "Tailwaters Fly Fishing Co.", "The Best of Kamchatka", "Fly Water Travel", "Ouzel Expeditions"]

     russia = ["The Fly Shop Kamchatka" : "Zhupanova River, Ichanga River, Savan River, Sedanka River", "Tailwaters Fly Fishing Co." : "Zhupanova River, Ichanga River, Savan River, Sedanka River", "The Best of Kamchatka" : "Ozernaya River, Two Yurt River", "Fly Water Travel": "Zhupanova River", "Ouzel Expeditions": "Zhupanova River, Opala River"]


    //MARK: AUSTRIA

     austriaRivers = ["Krimmler Ache River", "Felberbach River", "Amerbach River", "Hollersbach River", "Stubach River", "Salzach River", "Lenisee Lake", "Elizabethsee Lake", "Hollersbachsee Lake", "Hintersee Lake", "Big Erlauf River", "Small Erlauf River", "Ybbs River", "Walster River", "Steyr River", "Salza River", "Alm River", "Laudach River", "Traun River", "Steyr Molln-Leonstein River", "Gleinkersee River", "White Traun River", "Krimmler Ache River", "Torrener Ache River", "Ischler Traun River", "Goiserer Traun River", "Ischler Ache River", "Weissenbach, Rettenbach"]

     austriaGuides = ["Alps Fly Fish", "Hunt Austria", "Fly Fish Austria", "Pro Guides Fly Fishing", "Austria Guiding"]

     austria  = ["Alps Fly Fish": "Krimmler Ache River, Felberbach River, Amerbach River, Hollersbach River, Stubach River, Salzach River, Lenisee Lake, Elizabethsee Lake, Hollersbachsee Lake, Hintersee Lake", "Hunt Austria" : "Big Erlauf River, Small Erlauf River, Ybbs River, Walster River, Steyr River, Salza River", "Fly Fish Austria": "Krimmler Ache River, Felberbach River, Amerbach River", "Pro Guides Fly Fishing" : "Alm River, Laudach River, Traun River, Steyr Molln-Leonstein River, Gleinkersee River, White Traun River, Krimmler Ache River, Torrener Ache River", "Austria Guiding": "Ischler Traun River, Goiserer Traun River, Ischler Ache River, Weissenbach, Rettenbach"]



    compiledCompleteGuidesWithRivers = [iceland, spain, newZealand, russia, austria]
    }
    //let compiledCompleteGuides = [icelandGuides, spainGuides, newZealandGuides, russiaGuides, austriaGuides]

}
