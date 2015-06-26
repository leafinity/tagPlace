//
//  MapViewController.swift
//  HackNTU_Map
//
//  Created by Abby Yeh on 6/26/15.
//  Copyright (c) 2015 Zero Lin. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var location : CLLocationManager! //座標管理元件
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = CLLocationManager()
        location.delegate = self
        
        //詢問使用者是否同意給APP定位功能
        location.requestWhenInUseAuthorization()
        //開始接收目前位置資訊
        location.startUpdatingLocation()
        //加這行才能移動地圖離開所在位置
        location.distanceFilter = CLLocationDistance(10)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        //因為ＧＰＳ功能很耗電,所以背景執行時關閉定位功能
        location.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        //取得目前的座標位置
        let currentLocation = locations.last as! CLLocation
        
        //currentLocation.coordinate.latitude 目前緯度
        //currentLocation.coordinate.longitude 目前經度
        let center = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        
        // 要顯示中心點以外的多少距離，改 latitudeDelta / longitudeDelta 的值
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
        
        self.mapView.setRegion(region, animated: true)
        
        //加入座標
        //addPointAnnotation(currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude);
        addPointAnnotation("Peter", text: "The food is so delicious!!", latitude: 35.701, longitude: 139.775);
        addPointAnnotation("Debby", text: "feeling disappointed", latitude: 35.702, longitude: 139.774);
        addPointAnnotation("Claire", text: "Otaku, kerker", latitude: 35.703, longitude: 139.775);
    }
    
    //新增座標
    private func addPointAnnotation(name: String, text: String, latitude:CLLocationDegrees , longitude:CLLocationDegrees){
        //大頭針
        var point:MKPointAnnotation = MKPointAnnotation();
        //設定大頭針的座標位置
        point.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude);
        point.title = "\(name)";
        point.subtitle = "\(text)"
        
        //point.subtitle = "緯度：\(latitude) 經度:\(longitude)";
        
        mapView.addAnnotation(point);
    }
}

