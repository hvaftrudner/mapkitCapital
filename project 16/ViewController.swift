//
//  ViewController.swift
//  project 16
//
//  Created by Kristoffer Eriksson on 2020-10-16.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let london = capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home of the summer olympics 2012")
        
        let oslo = capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a 1000 years ago")
        
        let paris = capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8547, longitude: 3.0548), info: "Often called the city of light")
        
        let rome = capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside of it")
        
        let washington = capital(title: "Washington", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "named after the george washington")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(changeMaptype))
    
    }
    // edit button to change maptype
    @objc func changeMaptype(){
        //mapview.maptypes, add more for more options
        let maptypes = [".Hybrid": MKMapType.hybrid, ".Satellite": MKMapType.satellite, ".Standard": MKMapType.standard, ".MutedStandard": MKMapType.mutedStandard]
        
        guard let mapView = mapView else {return}
        
        let ac = UIAlertController(title: "Change Map Type", message: "choose new view", preferredStyle: .alert)
        
        for type in maptypes{
            ac.addAction(UIAlertAction(title: type.key, style: .default){_ in
                
                mapView.mapType = type.value
            }
        )}
        present(ac, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is capital else {return nil}
        let identifier = "capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            //typecast did not work outside this if block, annotationView is already declared a MKPin?
            if let pinAnno = annotationView as? MKPinAnnotationView {
                pinAnno.pinTintColor = .black
            }
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            
            
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let capital = view.annotation as? capital else {return}
        
        let placeName = capital.title
        //let placeInfo = capital.info
        
        if let vc = storyboard?.instantiateViewController(identifier: "webView") as? WebViewController {
            vc.placeTitle = placeName
            navigationController?.pushViewController(vc, animated: true)
        }
        
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
    }

}

