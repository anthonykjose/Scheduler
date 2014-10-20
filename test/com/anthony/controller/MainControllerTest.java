package com.anthony.controller;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;

import com.anthony.controller.MainController;

public class MainControllerTest {

	@Test
	public void testHandleRequestView() throws Exception {
		MainController controller = new MainController();
		ModelAndView modelAndView = controller.handleRequest(null, null);
		Assert.assertEquals("hello", modelAndView.getViewName());
	}
}