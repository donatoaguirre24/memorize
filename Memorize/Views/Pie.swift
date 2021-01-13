//
//  Pie.swift
//  memorize
//
//  Created by Donato Aguirre on 18/10/20.
//  Copyright © 2020 Donato Aguirre. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = true

    func path(in rect: CGRect) -> Path {
        var pie = Path()

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2

        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians))
        )

        pie.move(to: center)
        pie.addLine(to: start)
        pie.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        pie.addLine(to: center)

        return pie
    }
}

struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(20))
            .fill(Color.purple)
            .opacity(0.5)
            .padding()
    }
}
