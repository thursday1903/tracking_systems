package com.system.controllers;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import com.system.modals.customize.ISoftpinStock;
import com.system.modals.modal.TblCardTypeDetails;
import com.system.repositories.primarydb.TblCardTypeDetailRepository;
import com.system.services.ReportService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductDownloadConfigController extends BaseController{
	

	@Autowired
	private TblCardTypeDetailRepository tblCardTypeDetailRepository;
	
	@Autowired
	private ReportService reportService;
	
	
    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        return "login";
    }
	
    @RequestMapping("/product_download_config/store_report")
    public String listProductConfig(Model model) {
    	try {
    		model.addAttribute("moduleName","product_config");
    		if(getCurrentSessionAuthen()!=null)
    		{
    			List<ISoftpinStock> lstSofpinStock = reportService.getListSoftpinStock();
    			System.out.println("Total record:"+ lstSofpinStock.size());
    			model.addAttribute("lstSofpinStock", lstSofpinStock);			
    		}else {
    			
//    			return "redirect:/login";
    			throw new Exception("Invalid session");
    		}
    	} catch (Exception e) {
    		// TODO: handle exception
    		e.printStackTrace();
    	}
    	return "product_download_config/store_report";
    }
    
	@RequestMapping("/product_download_config/list_product_config")
	public String viewHomePage(Model model) {
		try {
			model.addAttribute("moduleName", "product_config");
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth.isAuthenticated() && !auth.getPrincipal().toString().equalsIgnoreCase("anonymousUser")) {
				List<TblCardTypeDetails> listSale = tblCardTypeDetailRepository.findAll();
				System.out.println("Total record:" + listSale.size());
				model.addAttribute("listCardTypeDetail", listSale);
			} else {
				return "redirect:/login";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	    return "product_download_config/list_product_config";
	}
	
		
	@RequestMapping("/product_download_config/edit_product/{id}")
	public ModelAndView showEditForm(@PathVariable(name = "id") int rowId) {
		
	    ModelAndView mav = new ModelAndView("product_download_config/edit_product");
	    TblCardTypeDetails tblCardTypeDetails = tblCardTypeDetailRepository.getDetailByRowId(rowId);
	    mav.addObject("tblCardTypeDetails", tblCardTypeDetails);	    
	    return mav;
	}
	
	@RequestMapping(value = "/product_download_config/update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("tblCardTypeDetails") TblCardTypeDetails tblCardTypeDetails) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();			
		if (auth.isAuthenticated() && !auth.getPrincipal().toString().equalsIgnoreCase("anonymousUser")) {
			tblCardTypeDetails.setLatestUpdate(new Date());
			tblCardTypeDetailRepository.save(tblCardTypeDetails);
			System.out.println("minLimit:" + tblCardTypeDetails.getMinLimit());
			System.out.println("maxLimit:" + tblCardTypeDetails.getMaxLimit());
			System.out.println("alertLimit:" + tblCardTypeDetails.getAlertLimit());
			return "redirect:/product_download_config/list_product_config?Success";
		} else {
			return "login";
		}
	}
	
		
	
	
	
}
