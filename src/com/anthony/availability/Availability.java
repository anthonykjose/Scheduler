package com.anthony.availability;

import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import java.util.Random;

import org.joda.time.DateTime;
import org.joda.time.DateTimeConstants;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.anthony.availability.TimeSlot.SlotType;

public class Availability {
	private Random ran;
	private static DateTimeFormatter FORMATTER = DateTimeFormat
			.forPattern("HH:mm");

	public Availability() {
		this.ran = new Random();

	}

	public List<TimeSlot> getSlots() {
		BitSet bs = new BitSet(DateTimeConstants.MINUTES_PER_DAY);
		int x = ran.nextInt(DateTimeConstants.MINUTES_PER_DAY-100);
		bs.set(x++);
		bs.set(x++);
		bs.set(x++);

		return transformToListOfRanges(bs);
	}

	private String getTimeStringFromBitIndex(int index) {
		return FORMATTER.print(new DateTime().withTimeAtStartOfDay()
				.plusMinutes(index));
	}

	/**
	 * Translates a BitSet into a list of time slots that are blocked or
	 * available.
	 * 
	 * @param inputBitSet
	 * @return
	 */
	public List<TimeSlot> transformToListOfRanges(BitSet inputBitSet) {
		List<TimeSlot> resultList = new ArrayList<TimeSlot>();

		int i = 0;
		while (i != -1) {
			SlotType slotType;
			StringBuilder sb = new StringBuilder();
			sb.append(getTimeStringFromBitIndex(i));
			int endIndex;
			if (inputBitSet.get(i) == true) {
				endIndex = inputBitSet.nextClearBit(i) - 1;
				slotType = SlotType.Occupied;
			} else {
				endIndex = inputBitSet.nextSetBit(i) - 1;
				slotType = SlotType.Free;
			}

			if (endIndex > 0) {
				sb.append(" -> " + getTimeStringFromBitIndex(endIndex));
			} else {
				sb.append(" -> "
						+ getTimeStringFromBitIndex(DateTimeConstants.MINUTES_PER_DAY - 1));
			}

			resultList.add(new TimeSlot(sb.toString(), slotType));

			i = endIndex + 1;
		}

		return resultList;
	}
}
