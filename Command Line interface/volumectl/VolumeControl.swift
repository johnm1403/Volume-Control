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
    
    enum VolumeChange: String, ExpressibleByArgument, CaseIterable {
        case up, down
    }
    
    enum VolumeTarget: String, ExpressibleByArgument, CaseIterable {
        case system, music
    }
    
    @Argument(help: "The direction of the volume change")
    var change: VolumeChange
    
    @Option(help: "The target to volume of")
    var target: VolumeTarget
    
    mutating func run() {
        DistributedNotificationCenter.default().post(
            name: Notification.Name("net.martinsoft.VolumeControl.cliControl"),
            object: nil,
            userInfo: [
                "target": target.rawValue,
                "direction": change.rawValue
            ]
        )
    }
}
