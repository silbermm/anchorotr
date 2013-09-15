package co.silbersoft.anchor.controllers;

import co.silbersoft.anchor.exceptions.GenericDataException;
import co.silbersoft.anchor.forms.MenuItemForm;
import co.silbersoft.anchor.models.Menu;
import co.silbersoft.anchor.models.MenuItem;
import co.silbersoft.anchor.services.MenuService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;


@Controller
@RequestMapping(value ="/")
public class HomeController {
    
    @RequestMapping(value="", method=RequestMethod.GET)
    public String index(Model model){
        model.addAttribute("menuItem", new MenuItemForm());
        return "index";
    }

    @RequestMapping(value="login", method=RequestMethod.GET)
    public String login(@RequestParam(value = "error", required = false) String error, ModelMap model){
        if(error != null && error.equals("authFailed")){
            model.addAttribute("error", "true");
        }
        return "login";
    }
    
    @RequestMapping(value="menus", method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody List<Menu> getAllMenus(){
        return menuService.getAllMenus();
    }
    
    @RequestMapping(value="menus/{id}", method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody List<MenuItem> getAllItemsInMenu(@PathVariable Long id){
        return menuService.getAllByMenu(id);
    }
  
    @RequestMapping(value="menus/{id}/{catagory}",method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody List<MenuItem> getItems(@PathVariable Long id, @PathVariable String catagory){
        return menuService.getAllByMenuAndCatagory(id, catagory);
    }
    
    @RequestMapping(value="menus/{id}/catagories", method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody List<String> getCatagories(@PathVariable Long id){
        return menuService.getCatagoriesForMenu(id);
    }
    
    @RequestMapping(value="menus/items", method=RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody Map<String,String> deleteMenuItem(@RequestBody MenuItem menuItem){
        Map<String, String> error = new HashMap();
        error.put("item", menuItem.getItemName());
        return error;
        //menuService.deleteMenuItem(menuItem);
    }
    
    
    @ExceptionHandler(GenericDataException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public @ResponseBody Map<String,String> handleGenericDataException(GenericDataException e){
        Map<String, String> error = new HashMap();
        error.put("error", e.getMessage());
        return error;
    }
    
    @Autowired MenuService menuService;
    
}
