package top.genitalbean.vi.controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;

import top.genitalbean.vi.commons.exception.NoDataMatchException;

public abstract class BaseController {
	@ExceptionHandler(NoDataMatchException.class)
	public String handleNoData(NoDataMatchException ex,ModelMap mm){
		mm.addAttribute("message", ex.getMessage());
		return "error";
	}
	@ExceptionHandler(Exception.class)
	public String handleNoData(Exception ex,ModelMap mm){
		mm.addAttribute("message", ex.getMessage());
		return "error";
	}
}
