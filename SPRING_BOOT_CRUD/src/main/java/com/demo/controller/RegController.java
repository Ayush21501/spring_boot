package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.RegVO;
import com.demo.service.RegService;

@Controller
public class RegController {

	@Autowired
	RegService regService;

	@RequestMapping(value = "/")
	public ModelAndView Load() {
		return new ModelAndView("Registration", "RegVO", new RegVO());
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public ModelAndView Insert(@ModelAttribute RegVO regVO) {

		this.regService.insert(regVO);

		return new ModelAndView("redirect:/search");
	}

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public ModelAndView Search() {

		List searchList = this.regService.search();

		return new ModelAndView("Search", "searchList", searchList);
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public ModelAndView Delete(@ModelAttribute RegVO regVO, @RequestParam int Id) {

		regVO.setId(Id);
		this.regService.delete(regVO);

		return new ModelAndView("redirect:/search");
	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public ModelAndView Edit(@ModelAttribute RegVO regVO, @RequestParam int Id) {

		regVO.setId(Id);
		List editList = this.regService.edit(regVO);
		return new ModelAndView("Registration", "RegVO", editList.get(0));
	}

	@RequestMapping(value = "ajaxdemo", method = RequestMethod.GET)
	public ModelAndView ajaxLoad() {
		return new ModelAndView("ajaxFile", "RegVO", new RegVO());
	}

	@RequestMapping(value = "ajaxinsert", method = RequestMethod.GET)
	public ModelAndView ajaxInsert(@ModelAttribute RegVO regVO, @RequestParam String fn, @RequestParam String ln) {

		regVO.setFirstName(fn);
		regVO.setLastName(ln);
		this.regService.insert(regVO);
		List ajaxList= this.regService.search();
		System.out.println("list size: " + ajaxList.size());
		return new ModelAndView("json_ajax", "ajaxList", ajaxList);
	}

	@RequestMapping(value = "validfn", method = RequestMethod.GET)
	public ModelAndView validfirstname(@ModelAttribute RegVO regVO, @RequestParam String Firstname) {

		regVO.setFirstName(Firstname);
		List validfnList =this.regService.fnvalid(regVO);
		System.out.println("valid fn list size: " + validfnList.size());

		if (validfnList.size() > 0) {
			return new ModelAndView("json_fnalert", "key", "User name already Exist...");
		} else {
			return new ModelAndView("json_fnalert", "key", "enter successfully..");
		}

	}
}
