//
//  ViewController.swift
//  CurrencyConventor
//
//  Created by Enes Kaya on 26.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var usd : Double = 0
    var euro : Double = 0
    var grivna : Double = 0
    var tryy : Double = 0
    var czk : Double = 0
    var huf : Double = 0
    var chf : Double = 0
    var dkk : Double = 0
    var aud : Double = 0
    var gbp : Double = 0
    var gel : Double = 0
    
    var countries = [Country]()
    var countryCollectionView: UICollectionView?
    var transferArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else {
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
                        DispatchQueue.main.sync {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                if let tryy = rates["TRY"] as? Double {
                                    self.tryy = tryy
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usd = Double(round(1000 * self.tryy/usd) / 1000)
                                    
                                    
                                }
                               
                                if let gel = rates["GEL"] as? Double {
                                    print("\(gel)")
                                    self.gel = Double(round(1000 * self.tryy/gel) / 1000)
                                }
                                if let uah = rates["UAH"] as? Double {
                                    self.grivna = Double(round(1000 * self.tryy/uah) / 1000)
                                }
                                if let euro = rates["EUR"] as? Double {
                                    self.euro =  Double(round(1000 * self.tryy*euro) / 1000)
                                }
                                if let czk = rates["CZK"] as? Double {
                                    self.czk = Double(round(1000 * self.tryy/czk) / 1000)
                                }
                                if let huf = rates["HUF"] as? Double {
                                    self.huf = Double(round(1000 * self.tryy/huf) / 1000)
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chf = Double(round(1000 * self.tryy/chf) / 1000)
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbp = Double(round(1000 * self.tryy/gbp) / 1000)
                                }
                                if let dkk = rates["DKK"] as? Double {
                                    self.dkk = Double(round(1000 * self.tryy/dkk) / 1000)
                                }
                                if let aud = rates["AUD"] as? Double {
                                    self.aud = Double(round(1000 * self.tryy/aud) / 1000)
                                }
                                
                                
                                
                                
                                
                            }
                        
        
                        }
                        
                    } catch {
                        print("error")
                    }
                }
            }
        }.resume()
        
        
        
        
        
        requestData()
        self.navigationItem.title = "Countries App"
        view.backgroundColor = .systemBackground
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.configureUI()
            self.generateData()
            
            
            
            self.countryCollectionView?.dataSource = self
            self.countryCollectionView?.delegate = self
        }
    }
    
    func requestData() {
       
        
    }
    
   
    
    func generateData() {


        // Ülkeleri oluştur
        let europe = Country(name: "\(euro)", flag: "EuropeanFlag", currency: "Euro")
        let america = Country(name: "\(usd)", flag: "AmericanFlag", currency: "Dolar")
        let ukraine = Country(name: "\(grivna)", flag: "UkraineFlag", currency: "Grivna")
        let georgia = Country(name: "\(gel)", flag: "GeorgiaFlag", currency: "Lari")
        let czech = Country(name: "\(czk)", flag: "CzechFlag", currency: "Koruna")
        let hungary = Country(name: "\(huf)", flag: "HungaryFlag", currency: "Forint")
        let switzerland = Country(name: "\(chf)", flag: "SwitzerlandFlag", currency: "İsviçre Frangı")
        let uk = Country(name: "\(gbp)", flag: "UKFlag", currency: "Sterlin")
        let denmark = Country(name: "\(dkk)", flag: "DenmarkFlag", currency: "Danish Krone")
        let australia = Country(name: "\(aud)", flag: "AustraliaFlag", currency: "Avustralya Doları")
        print("\(gel)")
        // Ülkeleri bir diziye ekle

        countries.append(europe)
        countries.append(america)
        countries.append(ukraine)
        countries.append(georgia)
        countries.append(czech)
        countries.append(hungary)
        countries.append(switzerland)
        countries.append(uk)
        countries.append(denmark)
        countries.append(australia)
        
        // Şimdi, "countries" adındaki dizinizde tüm ülkeleriniz bulunuyor.

    }
    
    func configureUI() {
        
       let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
       layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
       layout.itemSize = CGSize(width: 180, height: 160)
       
       countryCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
       countryCollectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "countryCollectionCell")
       countryCollectionView?.backgroundColor = .systemBackground
       
       
       view.addSubview(countryCollectionView ?? UICollectionView())
        
        
    }
    
  
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCollectionCell", for: indexPath) as! CollectionViewCell
        collectionViewCell.currencyLabel.text = countries[indexPath.row].name
        collectionViewCell.rateLabel.text = countries[indexPath.row].currency
        collectionViewCell.countryImageView.image = UIImage(named: countries[indexPath.row].flag)
        return collectionViewCell
    }
    
    
}
