//
//  WeatherViewController.swift
//  Weather
//
//  Created by Chaekyeong Lee on 2022/07/09.
//

import UIKit

class WeatherViewController: UIViewController {
    let cities: [String] = ["Seoul", "Pari", "NewYork", "Tokyo"]
    let weather: [String] = ["sun.max.fill", "cloud.fill", "wind", "cloud.sun.rain.fill"]
    let temperature: [String] = ["24", "18", "15", "30"]
    
    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lblTemp: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnClick(_ sender: Any) {
        self.onChangeBtnClick()
    }
    
    private func onChangeBtnClick() {
        lblWeather.text = cities.randomElement()!
        imgWeather.image = UIImage(systemName: weather.randomElement()!)
        lblTemp.text = temperature.randomElement()!
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
