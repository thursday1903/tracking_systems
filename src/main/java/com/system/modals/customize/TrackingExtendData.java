package com.system.modals.customize;

import com.system.modals.modal.TrackingLogs;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class TrackingExtendData extends TrackingLogs{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private String trackingDesc;
}
