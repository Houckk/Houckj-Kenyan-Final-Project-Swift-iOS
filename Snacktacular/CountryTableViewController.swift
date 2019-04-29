//
//  CountryTableViewController.swift
//  Snacktacular
//
//  Created by Kenyan Houck on 4/27/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//
import Foundation
import UIKit

class CountryTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var countriesAvailable = ["Iceland", "Spain", "New Zealand", "Russia", "Austria"]
    var countriesImage = [#imageLiteral(resourceName: "Iceland1"),#imageLiteral(resourceName: "Spain1"),#imageLiteral(resourceName: "New Zealand1"),#imageLiteral(resourceName: "Russia1"),#imageLiteral(resourceName: "Austria1")]
    var cImage = ["Iceland1","Spain1","New Zealand1","Russia1","Austria1"]
    var spot: Spot!
    var nameData = SpotsListViewController()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
//        self.tableView.register(CountryImageTableViewCell.self, forCellReuseIdentifier: "Country Cell")
        
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("🐽🐽🐽🐽")
        if segue.identifier == "CountrySelected"{
           let destination = segue.destination as! SpotsListViewController
           let selectedIndexPath = tableView.indexPathForSelectedRow!
           
           destination.nameE = countriesAvailable[selectedIndexPath.row]
           //destination.nD = countriesAvailable[selectedIndexPath.row]
           //destination.nameData
            //performSegue(withIdentifier: "CountrySelected", sender: self)
           }else {
                if let selectedPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPath, animated: true)
                }
            }
        }
    
    

}

extension CountryTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country Cell", for: indexPath) //as! CountryImageTableViewCell
        
        cell.backgroundView = UIImageView(image: UIImage(named: cImage[indexPath.row]))
        cell.backgroundColor = UIColor.clear
        
        //cell.mainImageView.image = countriesImage[indexPath.row]
        
        cell.textLabel?.text = countriesAvailable[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.init(name: "Arial", size: 24.0)
        //cell.textLabel?.adjustsFontSizeToFitWidth = true
//        let button = UIButton(frame: CGRect(x: 150, y: 100, width: 125, height: 50))
//        button.backgroundColor = .purple
//        //button.titleLabel?.textColor = UIColor.red
//        button.setTitle(countriesAvailable[indexPath.row], for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//
//
//        //self.view.addSubview(button)
//        cell.addSubview(button)
        if cell.isSelected{
            print("🦄🦄🦄🦄")
            performSegue(withIdentifier: "CountrySelected", sender: self)
        }
        
        return cell
    }
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let viewController = storyboard?.instantiateViewController(withIdentifier: countriesAvailable[indexPath.row])
//        self.navigationController?.pushViewController(SpotsListViewController, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentImage = countriesImage[indexPath.row]
        let imageCrop = currentImage.getCropRatio()
        return tableView.frame.width / imageCrop
    }
    
    
}
extension UIImage {
    func getCropRatio() -> CGFloat{
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}
