package co.silbersoft.anchor.controllers;

import co.silbersoft.anchor.exceptions.GenericDataException;
import co.silbersoft.anchor.models.Menu;
import co.silbersoft.anchor.models.MenuItem;
import co.silbersoft.anchor.services.MenuService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;


@Controller
@RequestMapping(value ="/")
public class HomeController {
    
    @RequestMapping(value="", method=RequestMethod.GET)
    public String index(){
        return "index";
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
    
    
    @ExceptionHandler(GenericDataException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public @ResponseBody Map<String,String> handleGenericDataException(GenericDataException e){
        Map<String, String> error = new HashMap();
        error.put("error", e.getMessage());
        return error;
    }
    
    @Autowired MenuService menuService;
    
}
