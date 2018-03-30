package com.mink.license.model.form;

import com.mink.license.model.dto.Term;

public class WriteForm {
	private Term term;

	private String msg;

	public WriteForm() {
	}

	public Term getTerm() {
		return term;
	}

	public void setTerm(Term term) {
		this.term = term;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "WriteForm [term=" + term + ", msg=" + msg + "]";
	}
}
