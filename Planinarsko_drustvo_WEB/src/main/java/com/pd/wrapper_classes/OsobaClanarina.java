package com.pd.wrapper_classes;

import java.io.Serializable;

import model.Clanarina;
import model.Osoba;

public class OsobaClanarina implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Osoba osoba;
	private Clanarina clanarina;
	
	public Osoba getOsoba() {
		return osoba;
	}

	public void setOsoba(Osoba osoba) {
		this.osoba = osoba;
	}

	public Clanarina getClanarina() {
		return clanarina;
	}

	public void setClanarina(Clanarina clanarina) {
		this.clanarina = clanarina;
	}

}
