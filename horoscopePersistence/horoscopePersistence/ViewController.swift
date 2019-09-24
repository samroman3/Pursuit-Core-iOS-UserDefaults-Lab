//
//  ViewController.swift
//  horoscopePersistence
//
//  Created by Sam Roman on 9/24/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
      
    @IBOutlet weak var userNameField: UITextField!
    @IBAction func userNameAction(_ sender: UITextField) {
    }
    @IBAction func continueButton(_ sender: UIButton) {
       loadHoroscope()
       UserDefaultsWrapper.wrapper.store(date: datePicker.date)
    }
    
    

    
    var horoscope: Horoscope?
    
    var userName: String = "" {
        didSet {
            UserDefaultsWrapper.wrapper.store(userName: userName)
        }
    }
    
    func loadHoroscope(){
        let currentSign = getSunSign()
        HoroscopeAPIClient.shared.getHoroscopes(sign: currentSign ) { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let data):
                    self.horoscope = data
                    print(data.sunsign)
                case .failure(let error):
                    print(error)
                    
                }
            }
        }
    }
    
    
    func getSunSign() -> String {
      let components = datePicker.calendar.dateComponents([.day, .month, .year], from: datePicker.date)
      let day = components.day
      let month = components.month
//      let year = components.year
      return AstroDates.getSign(month: month ?? 12, day: day ?? 12)
      

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "segue" {
               let destination = segue.destination as! HoroscopeViewController
            destination.currenthoroscope = horoscope
           }
       }
       
    
    override func viewDidLoad() {
        userNameField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}




extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        userName = text
        return true
    }
}
