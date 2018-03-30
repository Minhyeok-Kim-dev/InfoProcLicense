package com.mink.license.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mink.license.mapper.TermMapper;
import com.mink.license.model.dto.Term;

@Service
public class TermServiceImpl implements TermService {

	@Autowired
	private TermMapper termMapper;
	
	@Override
	public int insertTerm(Term term) {
		return termMapper.insertTerm(term);
	}

	@Override
	public List<Term> selectTermList(String searchData) {
		List<Term> termList = null;
		
		if(searchData.isEmpty()) {
			termList = termMapper.selectTermList();
		} else {
			termList = termMapper.selectTermListBySearchData(searchData);
		}
		
		return termList;
	}
}
