//
//  CheckinVC.swift
//  CutsomProgrammaticMenu
//
//  Created by Sherif  Wagih on 9/17/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import UIKit
import GoogleMaps
import LocalAuthentication
import Alamofire
import ProgressHUD
class CheckinVC: BaseMenuVC {
    
    var locationManager = CLLocationManager()
    
    var currentLocation: CLLocation?
    
    var zoomLevel: Float = 10.0
    
    var userDestinations:[UserDestinations] = [UserDestinations]()
    
    var closestLocation:UserDestinations?
    
    var currentLocationMarker:GMSMarker?
    
    var destinationMarker:GMSMarker?
    
    var currentRoute:GMSPolyline?
    
    let mapView:GMSMapView = {
        let map = GMSMapView()
        return map
    }()
    
    var closest:CLLocation!
    
    var isLocationUpdated = false
    
    var isCheckingOut = true
    
    let isCheckingNow = false
    
    let tryAgainButton:UIButton = {
        let button = UIButton(type: .system)
        button.anchorToView(size:.init(width:50,height:50))
        button.setImage(#imageLiteral(resourceName: "titledCheck-in-Icon30*36").withRenderingMode(.alwaysOriginal), for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .orange
        button.tintColor = .white
        button.addTarget(self, action: #selector(tryAgainButtonClicked), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    @objc func tryAgainButtonClicked()
    {
        isLocationUpdated = false
        locationManager.startUpdatingLocation()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupTitleView(title: "Check in",comparedTo: darkFillView)
        checkInOpener.isUserInteractionEnabled = false
        addMapView()
        setupLocationManager()
        addCheckinButton()
//        showInfoMessage(message: "You are not connected to the internet".localized(), isError: true)
    }
    fileprivate func addMapView()
    {
        view.insertSubview(mapView, belowSubview: darkFillView)
        mapView.anchorToView(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 50, left: 0, bottom: 100, right: 0))
    }
    override func viewWillDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
    }
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        formatter.locale = Locale.init(identifier: "en")
        return formatter
    }()
    
    
    
    let errorMessageLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna";
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 11, weight: .bold)
        label.numberOfLines = 3
        label.backgroundColor = .clear
        return label
    }()
    
    let successMessageLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna";
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 11, weight: .bold)
        label.numberOfLines = 3
        return label
    }()

    lazy var errorMessageView:UIView = {
        return getAMessageView(#imageLiteral(resourceName: "info-with-circle"), backgroundColor: .redMessageColor,label:errorMessageLabel)
    }()
    
    lazy var successMessageView:UIView = {
        return getAMessageView(#imageLiteral(resourceName: "check-alt"), backgroundColor: .greenMessageColor,label:successMessageLabel)
    }()
    
    fileprivate func addCheckinButton()
    {
        view.insertSubview(tryAgainButton, belowSubview: darkFillView)
        tryAgainButton.anchorToView(top: nil, leading: menu.leadingAnchor, bottom: menu.topAnchor, trailing: menu.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 10, right: 0))
        
    }
    fileprivate func showInfoMessage(message:String,isError:Bool)
    {
        errorMessageView.alpha = 0
        successMessageView.alpha = 0
        if isError
        {
            errorMessageLabel.text = message
        }
        else
        {
            successMessageLabel.text = message
        }
        UIView.animate(withDuration: 0.3, animations: {
            
            self.errorMessageView.alpha = isError ? 0.65 : 0// self.successMessageView.alpha = 0.65
            self.successMessageView.alpha = isError ? 0 : 0.65
            
        }, completion: {(_) in
            UIView.animate(withDuration: 7, animations: {
                self.errorMessageView.alpha = 0
                self.successMessageView.alpha = 0
            }, completion: nil)
        })
        
        
    }
    fileprivate func getAMessageView(_ icon:UIImage,backgroundColor:UIColor,label:UILabel) -> UIView
    {
        let messageIcon = UIImageView()
        messageIcon.image = icon
        
        let mView = UIView()
        
        messageIcon.anchorToView(size: .init(width:30,height:30))
        
        
        let stack = UIStackView(arrangedSubViews: [messageIcon,label], axis: .horizontal, spacing: 8)
        
        stack.distribution = .fill
        
        stack.alignment = .center
        
        mView.addSubview(stack)
        
        stack.fillSuperView(padding: .init(top: 0, left: 12, bottom: 0, right: 12))
        
        mView.alpha = 0
        
        view.insertSubview(mView, belowSubview: darkFillView)//(mView)
        
        mView.anchorToView(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 100, left: 0, bottom: 0, right: 0), size: .init(width:312,height:65), centerH: true)
        
        mView.backgroundColor = backgroundColor
        
        return mView
    }
}
extension CheckinVC:CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !Connectivity.isConnectedToInternet()
        {
            showInfoMessage(message: "You are not connected to the internet".localized(), isError: true)
            locationManager.stopUpdatingLocation()
            tryAgainButton.isHidden = false
        }
        else
        {
            if let location = locations.last
            {
                currentLocation = location
            }
            
            guard let location = currentLocation else {return}
            
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                                  longitude: location.coordinate.longitude,
                                                  zoom: zoomLevel)
            
            if mapView.isHidden {
                mapView.isHidden = false
                mapView.camera = camera
            } else {
                mapView.animate(to: camera)
            }
            
            //mapView.clear()
            currentLocationMarker?.map = nil
            currentLocationMarker = GMSMarker(position: location.coordinate)
            currentLocationMarker?.title = NSLocalizedString("My Location", comment: "")
            currentLocationMarker?.map = mapView
            
            if (!isLocationUpdated)
            {
                getAttendanceFromAPI()
                isLocationUpdated = true
            }
        }
        
    }
    
    fileprivate func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    fileprivate func getAttendanceFromAPI()
    {
        ProgressHUD.show("Getting your destination".localized())
        guard let userID = User.getLocallySavedUser()?.employeeId else {return}
        let url = Utility.getFinalURL(methodName: "ExternalUserStatus", params: [
            "\(userID)"])
        
        Service.shared.fetchGenericJSONData(urlString: url, parameters: nil) {[weak self] (res:[UserDestinations]?, err) in
            
            if err != nil
            {
                self?.showInfoMessage(message: err!.localizedDescription, isError: true)
//                ProgressHUD.showError(err!.localizedDescription)
                self?.locationManager.stopUpdatingLocation()
                
                return
            }
            if let res = res
            {
                if res.count == 0
                {
                    self?.showInfoMessage(message: "We couldn't find your destination contact your manager".localized(), isError: true)
                    ProgressHUD.dismiss()
                    //ProgressHUD.showError("We couldn't find your destination contact your manager".localized());
                    return
                }
                else
                {
                    self?.userDestinations = res
                    self?.checkingDistance()
                    ProgressHUD.dismiss()
                }
            }
            
        }
    }
    fileprivate func checkingDistance()
    {
        let locations = userDestinations.map
        {
            $0.getFullLocation()
        }
        
        guard let userLocation = currentLocation else {return}
        
        
        closest = locations.min(by:
            { $0.distance(from: userLocation) < $1.distance(from: userLocation)})
        
        
        let distanceInMeters = closest.distance(from: userLocation)

        userDestinations.forEach { (dest) in
            
            if dest.latitude == closest.coordinate.latitude && dest.longitude == closest.coordinate.longitude
                && dest.Status == true && isCheckingNow
            {
                //let distanceInMeters = closest.distance(from: userLocation)
                
                if distanceInMeters > 100
                {
                    self.closestLocation = dest
                    self.locationManager.stopUpdatingLocation()
                    self.isCheckingOut = true
                    self.checkUserViaAPI(transationType: 2)
                    return
                }
                
                showInfoMessage(message: "You already checked in today!".localized(), isError: false)
                self.closestLocation = dest
                locationManager.stopUpdatingLocation()
            }
                
            else if dest.latitude == closest.coordinate.latitude && dest.longitude == closest.coordinate.longitude && dest.Status == false
            {
                destinationMarker?.map = nil
                destinationMarker = GMSMarker(position: closest.coordinate)
                destinationMarker?.title = NSLocalizedString("Your Destination".localized(), comment: "")
                destinationMarker?.map = mapView
                self.closestLocation = dest
                if distanceInMeters > 100
                {
                    ProgressHUD.dismiss()
                    getPolylineRoute(from: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), to:  CLLocationCoordinate2D(latitude: closest.coordinate.latitude, longitude: closest.coordinate.longitude))
                    showInfoMessage(message: "We can't check you in because you are far away from your destination get closer and try again!".localized(), isError: true)
                    self.locationManager.stopUpdatingLocation()
                    self.tryAgainButton.isHidden = false
                }
                else
                {
                    getPolylineRoute(from: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), to:  CLLocationCoordinate2D(latitude: closest.coordinate.latitude, longitude: closest.coordinate.longitude),mode: "walking")
                    
                    self.locationManager.stopUpdatingLocation()
                    
                    verifyPhoneIdentity()
                }
            }
            
        }
    }
    fileprivate func verifyPhoneIdentity()
    {
        let authContext = LAContext()
        var authError : NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need to confirm your identity!".localized(), reply: { [weak self] (success, error) in
                if success {
                    DispatchQueue.main.async {
                        self?.checkUserViaAPI()
                    }
                } else {
                    self?.showInfoMessage(message: "You need to verity your identity or else we can't check you in!".localized(), isError: true)
//                    ProgressHUD.showError("You need to verity your identity or else we can't check you in!".localized())
                }}
            );
        } else {
            self.checkUserViaAPI()
        }
        
    }
    
    
    fileprivate func checkUserViaAPI(transationType:Int = 1)
    {
        ProgressHUD.show("We are checking you".localized());
        guard let closestLocation = closestLocation else {return}
        guard let currentUserID = User.getLocallySavedUser()?.employeeId   else{return}
        let url = Utility.getFinalURL(methodName: "UserExternaTransaction")//MyAPIFunctions.getFullURLWithParams(methodName: "UserExternaTransaction")
        let params:[String:Any] =
            [
                
                "EmployeeId": currentUserID,
                "TransactionDate":  formatter.string(from: Date()),
                "TransactionType": transationType,
                "ExternalSiteId":  closestLocation.ExternalSiteId,
                "Longitude":   closestLocation.latitude,
                "Latitude":  closestLocation.longitude
        ]
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseString {[unowned self] (response) in
            
            if let error = response.error
            {
                self.showInfoMessage(message: error.localizedDescription, isError: true)
                return
            }
            if response.value == "1"
            {
                if !self.isCheckingOut
                {
                    self.showInfoMessage(message: "You checked in Successfully!".localized(), isError: false)
                    self.tryAgainButton.isHidden = true
                }
                else
                {
                    self.showInfoMessage(message: "You checked Out Successfully!".localized(), isError: false)
                    self.isCheckingOut = false
                    self.tryAgainButton.isHidden = true
                }
            }
            else
            {
                self.showInfoMessage(message: "Check in Failed. Please try again!".localized(), isError: true)
            }
        }
    }
    
    func getPolylineRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, mode:String = "driving"){
        ProgressHUD.show("Finding Route")
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=true&mode=\(mode)&key=AIzaSyAnKvay92-zyf4Or37UL6tsEF7BL8PiC6U") else {return}
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.isFailure && response.error != nil
            {
                //ProgressHUD.showError("Failed to get routes, please choose a different location")
                return
            }
            else
            {
                guard let data = response.data else {ProgressHUD.showError("Failed to load Routes") ;return}
                do {
                    if let json : [String:Any] = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]{
                        guard let routes = json["routes"] as? NSArray else {
                            ProgressHUD.showError("Failed to load routes")
                            return
                        }
                        if (routes.count > 0) {
                            guard let overview_polyline = routes[0] as? NSDictionary else {ProgressHUD.showError("Failed to load routes");return}
                            guard let dictPolyline = overview_polyline["overview_polyline"] as? NSDictionary else {ProgressHUD.showError("Failed to load routes");return}
                            guard let points = dictPolyline.object(forKey: "points") as? String else {ProgressHUD.showError("Failed to load routes");return}
                            self.showPath(polyStr: points)
                            DispatchQueue.main.async {
                                ProgressHUD.dismiss()
                                let bounds = GMSCoordinateBounds(coordinate: source, coordinate: destination)
                                let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 80, left: 30, bottom: 30, right: 30))
                                self.mapView.moveCamera(update)
                                self.centerButtonWasClicked()
                            }
                        }
                        else {
                            DispatchQueue.main.async {
                                //ProgressHUD.showError("Failed to load routes")
                                //print("no routes")
                            }
                        }
                    }
                }
                catch {
                    DispatchQueue.main.async {
                        // ProgressHUD.showError("Failed to load routes")
                    }
                }
            }
        }
    }
    
    func showPath(polyStr :String){
        if currentRoute != nil
        {
            currentRoute?.map = nil
        }
        let path = GMSPath(fromEncodedPath: polyStr)
        currentRoute = GMSPolyline(path: path)
        currentRoute?.strokeWidth = 3.0
        currentRoute?.strokeColor = .orange//UIColor(red: 0, green: 100, blue: 0, alpha: 1)
        currentRoute?.map = mapView // Your map view
    }
    func centerButtonWasClicked()
    {
        //center between two locations
        var bounds = GMSCoordinateBounds()
        for marker in [currentLocationMarker,destinationMarker] {
            if let marker = marker
            {
                bounds = bounds.includingCoordinate(marker.position)
            }
        }
        mapView.animate(with: GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 50 , left: 50 ,bottom: 50 ,right: 50)))
    }
    
    fileprivate func checkUserOut()
    {
        
    }
    
    fileprivate func showError()
    {
        
    }
    
}
