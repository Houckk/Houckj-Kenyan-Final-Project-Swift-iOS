//
//  ViewController.swift
//  Snacktacular
//
//  Created by John Gallaugher on 3/23/18.
//  Copyright © 2018 John Gallaugher. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase
import FirebaseUI
import GoogleSignIn

class SpotsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    var spots: Spots!
    //var authUI: FUIAuth! //***
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation!
    var guides = ListOfGuidesAndRivers().icelandGuides
    var rivers = ListOfGuidesAndRivers().icelandRivers
    var passed : SpotDetailViewController!
    var cImage = ["Iceland1","Spain1","New Zealand1","Russia1","Austria1"]
    
    var nD : CountryData!
    var country = Country()
    var nameE: String!
    var ipTest = 0
    var listArray = [String]()
    var spotArray = [Country.countryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //authUI = FUIAuth.defaultAuthUI()
         //You need to adopt a FUIAuthDelegate protocol to receive callback
        //authUI.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.isHidden = true
        sortSegmentedControl.isHidden = true
        spots = Spots()
        country.appendCountry{
            self.tableView.reloadData()
        }
        for country in country.countryArray {
            if country.name == nameE {
                spotArray.append(country)
            }
        }
        tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getLocation()
        navigationController?.setToolbarHidden(false, animated: false)
        spots.loadData{
            self.sortBasedOnSegmentPressed()
            self.tableView.reloadData()
        }
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        signIn()
//
//    }
    
    
//    func signIn(){
//        let providers: [FUIAuthProvider] = [
//            FUIGoogleAuth(),
//            FUIEmailAuth(),
////            FUIFacebookAuth(),
////            FUITwitterAuth(),
////            FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()),
//            ]
//        if authUI.auth?.currentUser == nil {
//            self.authUI?.providers = providers
//            present(authUI.authViewController(), animated: true, completion: nil)
//        } else {
//            tableView.isHidden = false
//        }
//    }
    
    func showAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSpot"
        {
           let destination = segue.destination as! SpotDetailViewController
           let selectedIndexPath = tableView.indexPathForSelectedRow!
           destination.guideSelected = country.countryArray[selectedIndexPath.row].guide
           destination.country = country
           destination.selectedName = nameE
           destination.spotName = spotArray[selectedIndexPath.row].guide

            
        } else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
    
    
    func sortBasedOnSegmentPressed() {
        switch sortSegmentedControl.selectedSegmentIndex {
        case 0: //A-Z
            spots.spotArray.sort(by: {$0.name < $1.name})
        case 1: // Closest
            spots.spotArray.sort(by: {$0.location.distance(from: currentLocation) < $1.location.distance(from: currentLocation)})
        case 2: //Average Rating
            spots.spotArray.sort(by: {$0.averageRating > $1.averageRating})
        default:
            print("***Error: Hey, you should not have gotten here, our segmented control should just have 3 segments")
        }
        tableView.reloadData()
    }
    
    
    @IBAction func sortSegmentPressed(_ sender: UISegmentedControl) {
        sortBasedOnSegmentPressed()
    }
    
    
    
}

extension SpotsListViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return spots.spotArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SpotsTableViewCell
//        //cell.nameLabel.text = spots.spotArray[indexPath.row].name
//        if let currentLocation = currentLocation {
//            cell.currentLocation = currentLocation
//        }
//        cell.configureCell(spot: spots.spotArray[indexPath.row])
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return country.countryArray.count
        return spotArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SpotsTableViewCell
        
        cell.textLabel?.backgroundColor = .clear
        cell.textLabel?.text = spotArray[indexPath.row].guide
        
        
        
        /*if country.countryArray[indexPath.row].name == nameE!
        {
            
            cell.textLabel?.text = country.countryArray[indexPath.row].guide!
        } else {
            
            tableView.beginUpdates()
            tableView.rowHeight = 1
            //ipTest = 1
            cell.clipsToBounds = true
            tableView.endUpdates()
            ipTest = 0
        }
        
        
        
        
        let backgroundImage = UIImage(named: "Iceland1")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        
        
    
        let label = UILabel(frame: CGRect(x: 150, y: 50, width: 200, height: 40))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "I'm a test label"
        label.backgroundColor = .red
        cell.addSubview(label)
        print("🦁🦁🦁🦁🦁🦁")*/
        
        
        return cell
    }

    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if ipTest == 0
        {
            print(60)
            return 60
        }
        print(0)
        return 0
    }*/
}

//extension SpotsListViewController: FUIAuthDelegate{
//    func application(_ app: UIApplication, open url: URL,
//                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
//        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
//            return true
//        }
//        // other URL handling goes here.
//        return false
//    }
//
//    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
//        if let user = user {
//            tableView.isHidden = false
//            print ("***** We signed in with the user \(user.email ?? "unknown email")")
//        }
//    }
//
//
//    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
//        let loginViewController = FUIAuthPickerViewController(authUI: authUI)
//        loginViewController.view.backgroundColor = UIColor.white
//        let marginInsets: CGFloat = 16
//        let imageHeight: CGFloat = 225
//        let imageY = self.view.center.y - imageHeight
//        let logoFrame = CGRect(x: self.view.frame.origin.x + marginInsets, y: imageY, width: self.view.frame.width - (marginInsets*2), height: imageHeight)
//        let logoImageView = UIImageView(frame: logoFrame)
//        logoImageView.image = UIImage(named: "logo")
//        logoImageView.contentMode = .scaleAspectFit
//        loginViewController.view.addSubview(logoImageView)
//        return loginViewController
//    }
//}

extension SpotsListViewController: CLLocationManagerDelegate {
    
    func getLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //        let status = CLLocationManager.authorizationStatus()
        //        handleLocationAuthorizationStatus(status: status)
    }
    
    
    func handleLocationAuthorizationStatus(status: CLAuthorizationStatus)
    {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .denied:
            print("I'm sorry - cant show locaiton. User has not authorized it.")
        case .restricted:
            print ("Access denied. Likely parental controls are restricting location services in this app.")
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        handleLocationAuthorizationStatus(status: status)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last
        print ("Current Location is = \(currentLocation.coordinate.longitude), \(currentLocation.coordinate.latitude)" )
        sortBasedOnSegmentPressed()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user location")
    }
}
