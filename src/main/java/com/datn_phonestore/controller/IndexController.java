package com.datn_phonestore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
		
		@GetMapping("/home")
		public String home() {
		return"trangchu";
		}
		@GetMapping("/cart")
		public String cart() {
		return"cart";
		}
	    @GetMapping("/login")
	    public String login() {
	        return "login";
	    }

	    @GetMapping("/register")
	    public String register() {
	        return "register";
	    }
	    @GetMapping("/about")
	    public String about() {
	        return "about";
	    }
	    @GetMapping("/product")
	    public String product() {
	        return "ProductDetail";
	    }
	    @GetMapping("/view")
	    public String view() {
	        return "view";
	    }
}
