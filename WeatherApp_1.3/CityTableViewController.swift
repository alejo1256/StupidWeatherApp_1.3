//
//  CutyTableViewController.swift
//  WeatherApp_1.3
//
//  Created by Alejandro Gonzalez on 6/9/18.
//  Copyright © 2018 Alejandro Gonzalez. All rights reserved.
//

/*var json = """
    {
    "timezone": "America/New_York",
    "currently": {

        "time": 1529626827,
        "summary": "Clear",
        "temperature": 75.6,
        "humidity": 100.00,
        },
    }
    """*/


import UIKit
import CoreLocation

class CityTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet var searchbar: UISearchBar!
    
    private let basePathURL = "https://api.darksky.net/forecast/a63372974e1eeedf5b65c38c5ec8b6eb/"

    private var weather = [Weather]()
    
    var currentWeatherData = [Weather]()
  
   // var cities = [CityMO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.getLatestWeather(withLocation: "42.3601,-71.0589") { (results:[Weather]) in
            
        //}
        
        searchbar.delegate = self
    }
        
      
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return cityNames.count
        return weather.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CityTableViewCell

        // Configure the cell...
        
        //cell.nameLabel.text = weather[indexPath.row].summary
        cell.descriptionLabel.text = weather[indexPath.row].summary
        cell.temperatureLabel.text = "Current Temperature = \(weather[indexPath.row].temperature)"
        cell.minTempLabel.text = "Min Temperature = \(weather[indexPath.row].humidity)"
        cell.maxTempLabel.text = "Max Temperature = \(weather[indexPath.row].time)"
        

        return cell
    }
   
    // MARK: Helper functions
    
    func getLatestWeather(withLocation name:CLLocationCoordinate2D , completion: @escaping ([Weather]) ->()) {
        guard URL(string: basePathURL) != nil else {
            return
        }
        
        //let url = basePathURL + "\(name.latitude), \(name.longitude)"
        let url = basePathURL + "\(name.latitude), \(name.longitude)"
        let request = URLRequest(url:URL(string:url)!)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            //Parse JSON data
            
            if let data = data {
                self.weather = self.parseJsonData(data: data)
                
                //Reload table view
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
            }
            
        })
        
        task.resume()
    }
    
    func parseJsonData(data: Data) -> [Weather] {
        
        //var weatherArray = [Weather]()
        
       // let jsonData = json.data(using: .utf8)
        
        let decoder = JSONDecoder()
        
        do {
            let weatherData = try decoder.decode(Weather.self, from: data )
            weather.append(weatherData)
            print(weatherData)
        } catch {
            print(error)
        }
        
        return weather
    }
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchbar.resignFirstResponder()
        if let locationString = searchbar.text, !locationString.isEmpty {
            updateWeatherForLocation(location: locationString)
        }
    }
    
    func updateWeatherForLocation (location:String) {
        CLGeocoder().geocodeAddressString(location) { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                if let location = placemarks?.first?.location{
                    self.getLatestWeather(withLocation: location.coordinate, completion: { (results:[Weather]?) in
                        if let weatherData = results {
                            self.weather = weatherData
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }

                        }
                    })
                }
            }
        }
    }

}
