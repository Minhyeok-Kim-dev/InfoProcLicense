package com.mink.license.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mink.license.model.dto.Term;

@Mapper
public interface TermMapper {
	int insertTerm(Term term);
	List<Term> selectTermList();
	List<Term> selectTermListBySearchData(String searchData);
}
