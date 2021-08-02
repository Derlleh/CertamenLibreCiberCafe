/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import entidades.Usuario;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repositorio.UsuarioRepo;

/**
 *
 * @author Pablo Saez
 */

@Controller
public class HomeController {
    
    @Autowired
    private UsuarioRepo uRepo; 
    
     @RequestMapping(method = RequestMethod.GET, value="/")
    public String index() {
        return "login/login";
    }
    
    @RequestMapping(method = RequestMethod.POST, value="/")
    public String inicio(@RequestParam Map<String,String> parametros)
    {
        Usuario u = uRepo.login(parametros.get("user"),
                parametros.get("pass"));
        if(u!=null)
            return "redirect:/cliente/agregar";
        return "redirect:/";
    }
    
}
