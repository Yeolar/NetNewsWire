//
//  TimelineContainerView.swift
//  NetNewsWire
//
//  Created by Maurice Parker on 6/30/20.
//  Copyright © 2020 Ranchero Software. All rights reserved.
//

import SwiftUI

struct TimelineContainerView: View {
	
	@EnvironmentObject private var sceneModel: SceneModel
	@StateObject private var timelineModel = TimelineModel()
	
	@ViewBuilder var body: some View {
		TimelineView()
			.environmentObject(timelineModel)
			.listStyle(SidebarListStyle())
			.onAppear {
				sceneModel.timelineModel = timelineModel
				timelineModel.delegate = sceneModel
				timelineModel.rebuildTimelineItems()
			}		
	}
	
}

struct TimelineContainerView_Previews: PreviewProvider {
	static var previews: some View {
		TimelineContainerView()
			.environmentObject(SceneModel())
	}
}
