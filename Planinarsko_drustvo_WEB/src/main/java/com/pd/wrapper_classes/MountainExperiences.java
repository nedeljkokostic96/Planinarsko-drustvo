package com.pd.wrapper_classes;

import model.Planina;

import java.io.Serializable;
import java.util.List;

import model.Iskustvo;

public class MountainExperiences implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Planina planina;
	private List<Iskustvo> iskustva;

	public Planina getPlanina() {
		return planina;
	}

	public void setPlanina(Planina planina) {
		this.planina = planina;
	}

	public List<Iskustvo> getIskustva() {
		return iskustva;
	}

	public void setIskustva(List<Iskustvo> iskustva) {
		this.iskustva = iskustva;
	}

}
