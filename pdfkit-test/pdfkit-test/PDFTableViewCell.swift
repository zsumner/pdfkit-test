//
//  PDFTableViewCell.swift
//  pdfkit-test
//
//  Created by Zachary Sumner on 11/15/17.
//  Copyright © 2017 Zachary Sumner. All rights reserved.
//

import UIKit

class PDFTableViewCell: UITableViewCell {

	@IBOutlet weak var PDFNameLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
