//
//  SetSystemVolume.swift
//  Volume Control
//
//  Created by John Martin on 30/10/2024.
//

import ArgumentParser

@main
struct VolumeControl: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "volumectl")
    
    enum VolumeChange: String, ExpressibleByArgument {
        case up, down
    }
    
    enum VolumeTarget: String, ExpressibleByArgument {
        case system, music, spotify, doppler
    }
    
    @Argument var change: VolumeChange
    @Option var target: VolumeTarget
    
    mutating func run() {
        print("Trying to change volume \(change.rawValue) on \(target.rawValue)...")
    }
}
