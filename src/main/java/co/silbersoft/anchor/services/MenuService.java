package co.silbersoft.anchor.services;

import co.silbersoft.anchor.dao.MenuDao;
import co.silbersoft.anchor.dao.MenuItemDao;
import co.silbersoft.anchor.exceptions.GenericDataException;
import co.silbersoft.anchor.models.Menu;
import co.silbersoft.anchor.models.MenuItem;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly=true)
public class MenuService {
    
    @Transactional
    public List<MenuItem> getAllByMenu(Long menuid){
        try{
            return menuItemDao.findItemsByMenu(menuid);
        } catch(RuntimeException e){
            throw new GenericDataException(e.getMessage());
        } catch(Exception e){
            throw new GenericDataException(e.getMessage());
        }
    }
   
    @Transactional
    public List<MenuItem> getAllByMenuAndCatagory(Long menuid, String catagory){
        try{
            return menuItemDao.findItemsByMenuAndCatagory(menuid, catagory);
        } catch(RuntimeException e){
            throw new GenericDataException(e.getMessage());
        } catch(Exception e){
            throw new GenericDataException(e.getMessage());
        }
    }
    
    @Transactional
    public List<Menu> getAllMenus(){
       try{
           return menuDao.getAll();
        } catch(RuntimeException e){
            throw new GenericDataException(e.getMessage());
        } catch(Exception e){
            throw new GenericDataException(e.getMessage());
        } 
    }
    
    @Transactional
    public List<String> getCatagoriesForMenu(Long menuid){
        try {
            return menuItemDao.findCatagoriesByMenu(menuid);
        }catch(RuntimeException e){
            throw new GenericDataException(e.getMessage());
        } catch(Exception e){
            throw new GenericDataException(e.getMessage());
        } 
    }
    
    @Transactional(readOnly=false)
    public void deleteMenuItem(MenuItem m){
        try {
            menuItemDao.delete(m);
        }catch(RuntimeException e){
            throw new GenericDataException(e.getMessage());
        } catch(Exception e){
            throw new GenericDataException(e.getMessage());
        } 
    }
    
   @Autowired MenuDao menuDao;
   @Autowired MenuItemDao menuItemDao;
}
