package com.mink.license.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mink.license.model.dto.Term;
import com.mink.license.model.form.ListForm;
import com.mink.license.model.form.WriteForm;
import com.mink.license.service.TermService;

import sun.print.resources.serviceui;

@Controller
@RequestMapping("/")
public class PageContoller {
	@Autowired
	TermService termService;
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("writeForm", new WriteForm());
		return "write_form";
	}
	
	@RequestMapping(value = "/termList", method = RequestMethod.GET)
	public String termList() {
		return "term_list";
	}
	
	@RequestMapping(value = {"", "/", "/examMode"}, method = RequestMethod.GET)
	public String examMode() {
		return "exam_mode";
	}
	
	@RequestMapping(value = "/examForm", method = RequestMethod.GET)
	public String examForm(
			@RequestParam(value="mode") Integer mode,
			@RequestParam(value="name", required=false) String name,
			@RequestParam(value="questCnt", required=false) Integer questCnt,
			Model model) {
		System.out.println("#################### examForm");
		System.out.println(mode + "//" + name + "//" + questCnt);
		
		// 용어리스트 가져옴
		List<Term> termListFromDb = termService.selectTermList("");
		
		// 용어리스트 Shuffle
		Random rand = new Random();
		rand.setSeed(System.currentTimeMillis());
		
		Collections.shuffle(termListFromDb);
		
		// FormData 생성
		List<Term> termList = new ArrayList<>();
		
		// 시험모드인 경우 questCnt 크기에 맞춰 용어 리스트에 추가
		if(mode == 2 && questCnt <= termListFromDb.size()) {
			for(int i=0; i<questCnt; i++) {
				termList.add(termListFromDb.get(i));
			}
		} else {
			termList = termListFromDb;
		}
		
		
		for(Term term : termList) {
			System.out.println(term);
		}
		
		// JSON으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String jsonStr = objectMapper.writeValueAsString(termList);
			System.out.println(jsonStr);
			// FormData 모델에 추가
			//model.addAttribute("termList", jsonString);
			model.addAttribute("mode", mode);
			model.addAttribute("termList", jsonStr);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		return "exam_form";
	}
}
