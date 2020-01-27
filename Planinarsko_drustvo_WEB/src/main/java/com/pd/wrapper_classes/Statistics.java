package com.pd.wrapper_classes;

import java.io.Serializable;

import model.Planina;

public class Statistics implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Planina planina;

	private int nightsReserved;

	public Planina getPlanina() {
		return planina;
	}

	public void setPlanina(Planina planina) {
		this.planina = planina;
	}

	public int getNightsReserved() {
		return nightsReserved;
	}

	public void setNightsReserved(int nightsReserved) {
		this.nightsReserved = nightsReserved;
	}

}
