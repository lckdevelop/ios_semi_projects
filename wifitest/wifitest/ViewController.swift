//
//  ViewController.swift
//  wifitest
//
//  Created by Chaekyeong Lee on 3/4/24.
//

import UIKit
import SystemConfiguration.CaptiveNetwork
import CoreLocation


class ViewController: UIViewController {
    var locationManager: CLLocationManager! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.getWiFiInfo()
    }
    
    // Wi-Fi 정보 가져오기
    func getWiFiInfo()  {
        if let interfaceArray = CNCopySupportedInterfaces() as? [String] {
            for interfaceName in interfaceArray {
                print("Supported Interface: \(interfaceName)")
            }
        }
        
        if let interfaceArray = CNCopySupportedInterfaces() as? [String],
           let currentInterface = interfaceArray.first,
           let info = CNCopyCurrentNetworkInfo(currentInterface as CFString) as? [String: Any] {
               print("Current Network Info: \(info)")
        }
    }
    
//    func getWiFiInfo() -> [String: Any]? {
//        let wifiPermissionStatus = CLLocationManager.authorizationStatus()
//
//        // 위치 서비스 권한이 허용되어 있는지 확인
//        if wifiPermissionStatus == .authorizedWhenInUse || wifiPermissionStatus == .authorizedAlways {
//            if let interfaceArray = CNCopySupportedInterfaces() as? [String],
//               let currentInterface = interfaceArray.first,
//               let info = CNCopyCurrentNetworkInfo(currentInterface as CFString) as? [String: Any] {
//                print("정보 가잣 : \(info)")
//                   return info
//            }
//        }
//
//        return nil
//    }

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           //location5
           switch status {
           case .authorizedAlways, .authorizedWhenInUse:
               print("GPS 권한 설정됨")
               self.locationManager.startUpdatingLocation() // 중요!
           case .restricted, .notDetermined:
               print("GPS 권한 설정되지 않음")
               self.locationManager.requestWhenInUseAuthorization()
           case .denied:
               print("GPS 권한 요청 거부됨")
               self.locationManager.requestWhenInUseAuthorization()
           default:
               print("GPS: Default")
           }
       }
}

