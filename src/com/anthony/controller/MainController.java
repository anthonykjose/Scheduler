package com.anthony.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.Setter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.anthony.availability.Availability;

public class MainController implements Controller {
	protected final Log logger = LogFactory.getLog(getClass());

	@Setter
	private Availability availability;

	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		logger.info("Returning main view");
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("slots", this.availability.getSlots());

		return new ModelAndView("hello", "model", myModel);
	}
}
