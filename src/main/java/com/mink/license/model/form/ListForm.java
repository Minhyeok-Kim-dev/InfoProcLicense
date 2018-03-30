package com.mink.license.model.form;

import java.util.List;

import com.mink.license.model.dto.Term;

public class ListForm {
	List<Term> termList;
	String msg;
	
	public List<Term> getTermList() {
		return termList;
	}
	public void setTermList(List<Term> termList) {
		this.termList = termList;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "ListForm [termList=" + termList + ", msg=" + msg + "]";
	}
	
}
