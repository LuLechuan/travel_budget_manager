package com.ahchuang.travelbudgetmanager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ahchuang.travelbudgetmanager.dao.UserDAO;
import com.ahchuang.travelbudgetmanager.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping("/list")
	public String listUsers(Model model) {
		List<User> users = userDAO.getUsers();
		
		model.addAttribute("users", users);
		
		return "list-users";
	}
}
