//
//  HomeViewController.swift
//  Yoga Kshema
//
//  Created by Muqtadir Ahmed on 13/07/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let text = "YogaKshema is a registered not-for-profit organization run by a group of committed volunteers dedicated towards the improvement of the Quality of Living of people in general and specifically those who are survivors of Chronic illnesses as well as their caregivers.\n\nStarted on 28th April of 2007, YogaKshema Rehabilitation & Wellness Center began with a mission to “provide holistic, complementary treatment for those with chronic illnesses and their care givers and to “EDUCARE” community members about illness and health in order to empower them to lead healthier lives.”\n\nOur vision is to “improve the Quality of Life of people and help them make lifestyle changes”.\n\nYogaKshema was started by Dr. Usha Vasthare and Ms. Akhila Malini Vasthare. Since its inception, the organization has been striving to render selfless service to many individuals afflicted with chronic illnesses (as well as support their care givers), helping individuals to adopt health living styles  and educating the community at large about various illnesses and self-improvement methodologies."
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
    }
}
