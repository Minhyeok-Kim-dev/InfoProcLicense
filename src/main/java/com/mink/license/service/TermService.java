package com.mink.license.service;

import java.util.List;

import com.mink.license.model.dto.Term;

public interface TermService {
	public int insertTerm(Term term);
	public List<Term> selectTermList(String searchData);
}
