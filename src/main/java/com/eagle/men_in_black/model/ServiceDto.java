package com.eagle.men_in_black.model;

import java.io.Serializable;

public class ServiceDto implements Serializable {

	private static final long serialVersionUID = -5980152029432023538L;

	private	int	NOTICE_SEQ;
	private	String	NOTICE_TITLE;
	private	String	NOTICE_CONTENT;
	private	String	NOTICE_TIME;
	private	int	EVENT_SEQ;
	private	String	EVENT_TITLE;
	private	int	EVENT_CONTENT;
	private	String	EVENT_TIME;
	private	String	STORED_NAME;
	public int getNOTICE_SEQ() {
		return NOTICE_SEQ;
	}
	public void setNOTICE_SEQ(int nOTICE_SEQ) {
		NOTICE_SEQ = nOTICE_SEQ;
	}
	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}
	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public String getNOTICE_TIME() {
		return NOTICE_TIME;
	}
	public void setNOTICE_TIME(String nOTICE_TIME) {
		NOTICE_TIME = nOTICE_TIME;
	}
	public int getEVENT_SEQ() {
		return EVENT_SEQ;
	}
	public void setEVENT_SEQ(int eVENT_SEQ) {
		EVENT_SEQ = eVENT_SEQ;
	}
	public String getEVENT_TITLE() {
		return EVENT_TITLE;
	}
	public void setEVENT_TITLE(String eVENT_TITLE) {
		EVENT_TITLE = eVENT_TITLE;
	}
	public int getEVENT_CONTENT() {
		return EVENT_CONTENT;
	}
	public void setEVENT_CONTENT(int eVENT_CONTENT) {
		EVENT_CONTENT = eVENT_CONTENT;
	}
	public String getEVENT_TIME() {
		return EVENT_TIME;
	}
	public void setEVENT_TIME(String eVENT_TIME) {
		EVENT_TIME = eVENT_TIME;
	}
	public String getSTORED_NAME() {
		return STORED_NAME;
	}
	public void setSTORED_NAME(String sTORED_NAME) {
		STORED_NAME = sTORED_NAME;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ServiceDto [NOTICE_SEQ=" + NOTICE_SEQ + ", NOTICE_TITLE=" + NOTICE_TITLE + ", NOTICE_CONTENT="
				+ NOTICE_CONTENT + ", NOTICE_TIME=" + NOTICE_TIME + ", EVENT_SEQ=" + EVENT_SEQ + ", EVENT_TITLE="
				+ EVENT_TITLE + ", EVENT_CONTENT=" + EVENT_CONTENT + ", EVENT_TIME=" + EVENT_TIME + ", STORED_NAME="
				+ STORED_NAME + "]";
	}

}
