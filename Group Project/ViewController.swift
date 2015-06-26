//
//  ViewController.swift
//  Group Project
//
//  Created by Shenju Huang on 2015/6/17.
//  Copyright (c) 2015年 Shenju Huang. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

import CoreLocation
import MapKit
class MapViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var uimap: MKMapView!//地圖元件
    var location : CLLocationManager!; //座標管理元件
    override func viewDidLoad() {
        super.viewDidLoad();
        
        location = CLLocationManager();
        location.delegate = self;
        
        //詢問使用者是否同意給APP定位功能
        location.requestWhenInUseAuthorization();
        //開始接收目前位置資訊
        location.startUpdatingLocation();
    }
    
    override func viewDidDisappear(animated: Bool) {
        //因為ＧＰＳ功能很耗電,所以被敬執行時關閉定位功能
        location.stopUpdatingLocation();
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        //取得目前的座標位置
        let c = locations[0] as! CLLocation;
        //c.coordinate.latitude 目前緯度
        //c.coordinate.longitude 目前經度
        let nowLocation = CLLocationCoordinate2D(latitude: c.coordinate.latitude, longitude: c.coordinate.longitude);
        
        //將map中心點定在目前所在的位置
        //span是地圖zoom in, zoom out的級距
        let _span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.0005);
        self.uimap.setRegion(MKCoordinateRegion(center: nowLocation, span: _span), animated: true);
    }
}

