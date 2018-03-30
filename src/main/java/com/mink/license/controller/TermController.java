package com.mink.license.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mink.license.model.dto.Term;
import com.mink.license.model.form.ListForm;
import com.mink.license.model.form.WriteForm;
import com.mink.license.service.TermService;

@Controller
@RequestMapping(value="/term")
public class TermController {
	
	@Autowired
	TermService termService;
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	@ResponseBody
	public WriteForm insertTerm(@ModelAttribute("writeForm") WriteForm writeForm) {
			/*
			@RequestParam(value="shortNm") String shortNm,
			@RequestParam(value="fullNm") String fullNm,
			@RequestParam(value="korNm") String korNm,
			@RequestParam(value="contents") String contents
			) {
		*/
		System.out.println("### insertTerm");
		Term term = writeForm.getTerm();
		System.out.println(term);
		
		termService.insertTerm(term);
		
		writeForm.setMsg("success");
		return writeForm;
	}
	
	@RequestMapping(value="/selectTermList", method = RequestMethod.POST)
	@ResponseBody
	public ListForm selectTermList(@RequestParam("searchData") String searchData) {
		ListForm listForm = new ListForm();
		
		listForm.setTermList(termService.selectTermList(searchData));
		
		if(listForm.getTermList().size() > 0) {
			listForm.setMsg("success");
		} else {
			listForm.setMsg("fail");
		}
		
		return listForm;
	}
}
