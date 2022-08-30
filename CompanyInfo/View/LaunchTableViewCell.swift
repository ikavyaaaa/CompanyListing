//
//  LaunchTableViewCell.swift
//  CompanyInfo
//
//  Created by Kavya on 30/08/22.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMissionPatch: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
