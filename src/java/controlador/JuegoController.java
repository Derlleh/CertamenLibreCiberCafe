/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import entidades.Juego;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repositorio.JuegoRepo;

/**
 *
 * @author Pablo Saez
 */

@Controller
public class JuegoController {
    
    @Autowired
    private JuegoRepo jueRepo;
    
    @RequestMapping(method = RequestMethod.GET, value="/juego/listar")
    public String listar(Model m)
    {
        m.addAttribute("juegos", jueRepo.listar());
        return "juego/listar";
    }
    
     @RequestMapping(method = RequestMethod.GET, value="/juego/{id}/eliminar")
     public String eliminar(@PathVariable int id){
         jueRepo.eliminar(id);
         return "redirect:/juego/listar";
     }
    
     @RequestMapping(method = RequestMethod.GET, value="/juego/agregar")
     public String agregar(Model m)
     {
         return "juego/agregar";
     }
    
     @RequestMapping(method = RequestMethod.POST, value="/juego/agregar")
     public String add(@RequestParam Map<String,String> parametros){
         
         Juego j = new Juego();
         j.setTitulo(parametros.get("titulo"));
         j.setFechaGuardado(new Date());
         
         jueRepo.guardar(j);
         
         return "redirect:/juego/listar";
     }
     
      @RequestMapping(method = RequestMethod.GET, value="/juego/{id}/editar")
      public String form_edit(@PathVariable int id, Model m){
          m.addAttribute("juego", jueRepo.find(id));
          return "juego/modificar";
      }
     
      @RequestMapping(method = RequestMethod.POST, value="/juego/{id}/editar")
      public String editar(@RequestParam Map<String,String> parametros,@PathVariable int id){
          Juego j = jueRepo.find(id);
          j.setTitulo(parametros.get("titulo"));
          
          jueRepo.actualizar(j);
          
          return "redirect:/juego/listar";
      }
      
      @RequestMapping(method = RequestMethod.POST, value="/juego/filtrar")
    public String filtrar(@RequestParam Map<String,String> parametros,Model m){
        Iterator<Map.Entry<String, String>> entryIt = parametros.entrySet().iterator();
 
        while (entryIt.hasNext()) {
            Map.Entry<String, String> entry = entryIt.next();
	    if (entry.getValue().trim().isEmpty() || entry.getValue().equals("-1")) 
                    entryIt.remove();
        }
      
        m.addAttribute("juegos", jueRepo.filtrar(parametros));
        return "juego/listar";
    }
     
}
