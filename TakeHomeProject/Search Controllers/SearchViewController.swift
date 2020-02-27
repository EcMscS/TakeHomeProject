//
//  SearchViewController.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/25/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import UIKit
import CoreLocation
import Mapbox

class SearchViewController: UIViewController, MGLMapViewDelegate {

	@IBOutlet weak var mapView: MGLMapView!
	
	var locationManager: CLLocationManager?
	
	var userLocation: CLLocationCoordinate2D?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setupLocationServices()
		setupMapView()
    }
	
	func setupLocationServices() {
		locationManager = CLLocationManager()
		locationManager?.delegate = self
		locationManager?.requestWhenInUseAuthorization()
		locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
		locationManager?.requestLocation()
	}
	
	func setupMapView() {
		mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		mapView.delegate = self
		mapView.showsUserHeadingIndicator = true
	}
	
	func setMapViewCenter() {
		guard let userLocation = userLocation else { return }
		mapView.setCenter(userLocation, zoomLevel: 13, animated: true)
	}
	
	func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
		if annotation is MGLUserLocation && mapView.userLocation != nil {
			return CustomUserLocationAnnotationView()
		}
		return nil
	}
	

}

extension SearchViewController: CLLocationManagerDelegate {
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let latestLocation = locations.last else {
			print("no location")
			return
		}
		userLocation = CLLocationCoordinate2D(latitude: latestLocation.coordinate.latitude, longitude: latestLocation.coordinate.longitude)
		setMapViewCenter()
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(error)
	}
}
