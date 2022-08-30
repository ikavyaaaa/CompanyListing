//
//  HomeViewController.swift
//  CompanyInfo
//
//  Created by Kavya on 29/08/22.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var sections = ["COMPANY","LAUNCHES"]
    var companyModel : CompanyInfo?
    var launchModel = [Launches]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLaunchData()
        fetchCompanyData()
        tableView.dataSource = self
        tableView.delegate = self
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //Fetching Company information
    func fetchCompanyData() {
        Networking.sharedNetworking.getMethod(url: companyURL) { [self] responseData, responseMessage in
            if let responseData = responseData {
                do {
                    companyModel = try JSONDecoder().decode(CompanyInfo.self, from: responseData)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let err {
                    print(err)
                }
            } else {
                print(responseMessage)
            }
        }
    }
    
    //Fetching launch data
    func fetchLaunchData() {
        Networking.sharedNetworking.getMethod(url: launchURL) { [self] responseData, responseMessage in
            if let responseData = responseData {
                do {
                    launchModel = try JSONDecoder().decode([Launches].self, from: responseData)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let err {
                    print(err)
                }
            } else {
                print(responseMessage)
            }
        }
    }
    
    //For sorting the list
    @IBAction func btnFilterAction(_ sender: Any) {
        launchModel.sort { $0.name ?? "" < $1.name ?? "" }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if companyModel == nil {
            return 0
        }
        if section == 0 {
            return 1
        } else if section == 1 {
            return launchModel.count
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.text = sections[section]
        view.addSubview(lbl)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTableViewCell", for: indexPath) as! CompanyTableViewCell
            //Setting the company info data
            let text = "\(companyModel?.name ?? "SpaceX") was foundedby \(companyModel?.founder ?? "Elon Musk") in \(companyModel?.founded ?? 2000). It Has now \(companyModel?.employees ?? 100), \(companyModel?.launch_sites ?? 3) launch sites, and is values at USD \(companyModel?.valuation ?? 100)  "
            DispatchQueue.main.async {
                cell.lblCompanyDetails.text = text
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchTableViewCell", for: indexPath) as! LaunchTableViewCell
            //Showing mission patch image
            cell.imgMissionPatch.kf.setImage(with: URL(string: (launchModel[indexPath.row].links?.patch?.small) ?? "https://www.kindpng.com/picc/m/134-1341850_contacts-icon-transparent-iphone-contact-icon-hd-png.png"))
            //Showing status of the launch
            if launchModel[indexPath.row].success == true {
                cell.imgStatus.image = UIImage(named: "True") as UIImage?
            } else {
                cell.imgStatus.image = UIImage(named: "False") as UIImage?
            }
            //Setting date details
            var text = "Mission : - \(launchModel[indexPath.row].name ?? "")\n"
            text += "Date/Time : - \(launchModel[indexPath.row].date_utc ?? "")\n"
            text += "Rocket : - \(launchModel[indexPath.row].name ?? "") \n"
            text += "Days : - \(launchModel[indexPath.row].date_utc ?? "") \n"
            cell.lblDate.text = text
            //Button title
            cell.lblDetails.text = text
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // To display the actual html of the story
        if indexPath.section == 1 {
        let vc = DetailedViewController()
        vc.url = launchModel[indexPath.row].links?.article
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 150
        }
        return 60
    }
    
}
