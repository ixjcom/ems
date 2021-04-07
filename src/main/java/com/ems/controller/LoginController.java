package com.ems.controller;

import com.ems.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author fei
 * @version V1.0
 */
@Controller
@RequestMapping("/")
public class LoginController {

	@Resource
	private IUserService userService;
	@Resource
	private HttpServletRequest request;

	@RequestMapping("login")
	public ModelAndView login() {
		ModelAndView view = new ModelAndView();
		view.setViewName("login");
		return view;
	}

	@RequestMapping("login-auth")
	public String loginAuth(String username, String password, Model model) {
		try {
			this.userService.signIn(username, password, getRequstIp());

			return "redirect:/index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorInfo", e.getMessage());
			return "login";
		}
	}
	
	@RequestMapping("locale")
	public String local() {
		return "redirect:/index";
	}

	@RequestMapping("logout")
	public String logout() {
		userService.signOut();
		return "redirect:/login";
	}

	@RequestMapping("no-login")
	public String noLogin() {
		return "no_login";
	}

	/**
	 * 从request中抽取客户端ip(兼容nginx转发模式)
	 *
	 * @return
	 * @see
	 */
	private String getRequstIp() {
		String ip = request.getHeader("X-Real-IP");
		if (StringUtils.isBlank(ip)) {
			ip = request.getRemoteAddr();
		}
		if (StringUtils.equals("0:0:0:0:0:0:0:1", ip)) {
			return "127.0.0.1";
		}
		return ip;
	}

}
