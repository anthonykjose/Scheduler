package com.anthony.availability;

import lombok.Data;

@Data
public class TimeSlot {
	String timeRange;
	SlotType type;

	public enum SlotType {
		Occupied, Free
	}

	public TimeSlot(String timeRange, SlotType type) {
		this.timeRange = timeRange;
		this.type = type;
	}
}
