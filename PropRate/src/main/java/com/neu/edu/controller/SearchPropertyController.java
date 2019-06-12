package com.neu.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.neu.edu.DAO.BuyerDAO;
import com.neu.edu.DAO.PropertyDAO;
import com.neu.edu.DAO.SellerDAO;
import com.neu.edu.Exception.AdException;
import com.neu.edu.pojo.Buyer;
import com.neu.edu.pojo.Property;
import com.neu.edu.pojo.Seller;
import com.neu.edu.pojo.User;

@Controller
//@RequestMapping("searchProperty.htm")
public class SearchPropertyController {

	@Autowired
	@Qualifier("viewPropertyValidator")
	ViewPropertyValidator validator;
	
	@Autowired
	//@Qualifier("propertyDAO")
	PropertyDAO propertyDAO;
	
	@Autowired
	SellerDAO sellerDAO;
	
	@Autowired
	BuyerDAO buyerDAO;
	
//	@InitBinder
//	private void initBinder(WebDataBinder binder) {
//		binder.setValidator(validator);	
//	}
	
	@RequestMapping(value="searchProperty.htm",method=RequestMethod.POST)
	protected ModelAndView viewProperties(@ModelAttribute("property")Property property,BindingResult result,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("homePageBuyer");
		validator.validate(property,result);
		if (result.hasErrors()) {
			return mv;
		}
		String location=property.getLocation();
		Set<Property> propertyList = new HashSet(0);
		try{
		propertyList =	propertyDAO.searchProperties(location);
		if(propertyList!=null){
		session.setAttribute("propertyList",propertyList);
		}
		}
		catch(AdException e){
			System.out.println(e.getMessage());
		}
		ModelAndView mv1 = new ModelAndView("viewProperties", "properties", propertyList);
        return mv1;
	}
	
	@RequestMapping(value="searchProperty.htm",method=RequestMethod.GET)
	public String initializeHomePageBuyerForm(@ModelAttribute("property")Property property) {
		
		return "homePageBuyer";
	}
	
	@RequestMapping(value="apply.htm",method=RequestMethod.POST)
	public void applyProperty(@RequestParam("propertyID")Long propertyID,HttpServletRequest request) throws AdException{
		
		
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		int id = user.getBuyer().getBuyerId();
		Buyer buyer = buyerDAO.getBuyerById(id);
		
		Set<Property> propertyList = (Set)session.getAttribute("propertyList");
		
		for(Property property : propertyList){
			
			if(propertyID==property.getPropertyId()){
				property.getBuyers().add(buyer);
				buyer.getProperties().add(property);  	

			}
		}
		
		try{
		propertyDAO.addInBuyerProperty(buyer);
		}
		catch(AdException e){
			System.out.println(e.getMessage());
		}
		
	}
	
	@RequestMapping(value = "delProp.htm", method = RequestMethod.POST)
	public void deleteProperty(HttpServletRequest request)
			throws AdException {

	
				System.out.println("id is"+Integer.parseInt(request.getParameter("propertyID")));
				int propID=Integer.parseInt(request.getParameter("propertyID"));
				
				HttpSession session = request.getSession();
				
				User user = (User)session.getAttribute("user");
	
						try{
							
							propertyDAO.deleteProperty(propID);
							}
							catch(AdException e){
								System.out.println(e.getMessage());
							}
						
						
					}
	
	@RequestMapping(value = "/viewCustomers.htm*", method = RequestMethod.GET)
	public ModelAndView viewCustomers(HttpServletRequest request)
			throws AdException {

		
				System.out.println("id is"+Integer.parseInt(request.getParameter("propId")));
				int propID=Integer.parseInt(request.getParameter("propId"));
				
				HttpSession session = request.getSession();
				
				User user = (User)session.getAttribute("user");
	
						System.out.println("id isssss"+ propID);
						
						List<Buyer> buyerList = propertyDAO.viewBuyers(propID);
						
					
					ModelAndView mv1 = new ModelAndView("viewCustomers", "customers", buyerList);
			       return mv1;
						
					}
	
	
	@RequestMapping(value = "AddReservation.htm", method = RequestMethod.POST)
	public void applyReview(HttpServletRequest request)
			throws AdException {

		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		System.out.println("id is"+Integer.parseInt(request.getParameter("buyerID")));
		
		
		int propertyID=Integer.parseInt(request.getParameter("propertyID"));
		
		int buyerID=Integer.parseInt(request.getParameter("buyerID"));
		
			
		
		Buyer buyer = buyerDAO.getBuyerById(buyerID);
		
		for(Property pro : buyer.getProperties())
		{
			if(pro.getPropertyId()==propertyID)
			{
				try {
					//sendEmail(buyer,pro);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		
		
			
				
				
				
			
				}
				
				
//	private void sendEmail (Buyer b,Property p) throws EmailException
//	{
//		Email email  =new SimpleEmail();
//		email.setHostName("smtp.googlemail.com");
//		email.setSmtpPort(465);
//		
//		email.setAuthenticator(new DefaultAuthenticator("sachithnagesh@gmail.com", "whothehellknows"));
//		email.setSSLOnConnect(true);
//		email.setFrom("no-reply@msis.neu.edu");
//		email.setSubject("Reservation Successfull for "+p.getDescription()+"!!");
//		email.setMsg("Hi "+b.getUser().getFirstName()+",\n I'm getting back to you about a property that you were interested");
//		email.addTo(b.getUser().getEmailID());
//		email.addTo("sachithnagesh@gmail.com");
//	
//		email.send();
//	}

	
	
	
	@RequestMapping(value="viewPostedProperty.htm",method=RequestMethod.POST)
	protected ModelAndView viewPostedProperty(HttpServletRequest request) throws AdException {
		
		List<Property> propertyList = new ArrayList();
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int id= user.getSeller().getSellerID();
		Seller seller = sellerDAO.getSellerByUserId(id);
		
		if(seller!=null){
			
			propertyList = propertyDAO.viewSellerProperty(seller);
			}		
				
		ModelAndView mv = new ModelAndView("viewPostedProperties","properties",propertyList);
		return mv;
	}
	
	@RequestMapping(value="viewBuyers.htm",method=RequestMethod.POST)
	protected ModelAndView viewBuyers(@RequestParam("propertyID")Long propertyID,
			HttpServletResponse response,HttpServletRequest request) throws AdException  {		
		
		List<Buyer> buyerList = propertyDAO.viewBuyers(propertyID);
		
		JSONArray array = new JSONArray();
		if(buyerList!=null){
		for(Buyer b:buyerList){
			
			
			JSONObject obj = new JSONObject();
			
			obj.put("buyerId", b.getBuyerId());
			obj.put("firstName", b.getUser().getFirstName());
			obj.put("lastName", b.getUser().getLastName());
			obj.put("emailId", b.getUser().getEmailID());
			obj.put("phoneNumber", b.getUser().getPhoneNumber());
//			request.setAttribute("propObj",);
			
			obj.put("propId", propertyID);
			
			array.put(obj);
		}
		JSONObject mainobj = new JSONObject();
		mainobj.put("buyerList", array);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(mainobj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
		return null;
	}
}
