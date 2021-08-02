/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import entidades.Cliente;
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
import repositorio.ClienteRepo;
import repositorio.JuegoRepo;

/**
 *
 * @author Pablo Saez
 */

@Controller
public class ClienteController {
    
    @Autowired
    private JuegoRepo jueRepo;
    
    @Autowired
    private ClienteRepo cliRepo; 
    
    
     @RequestMapping(method = RequestMethod.GET, value="/cliente/agregar")
     public String index(Model m){
         m.addAttribute("juegos", jueRepo.listar());
         return "cliente/agregar";
     }
     
       @RequestMapping(method = RequestMethod.POST, value="/cliente/agregar")
       public String add(@RequestParam Map<String,String> parametros){
           Cliente c = new Cliente();
           c.setNombre(parametros.get("nombre"));
           c.setPago(Integer.parseInt(parametros.get("pago")));
           c.setInicio(Integer.parseInt(parametros.get("inicio")));
           c.setTermino(Integer.parseInt(parametros.get("termino")));
           c.setConsola(parametros.get("consola"));
           c.setTelevision(Integer.parseInt(parametros.get("television")));
           c.setFechaGuardado(new Date());
           
           int id_juego = Integer.parseInt(parametros.get("juego"));
           Juego ju = jueRepo.find(id_juego);
           
           c.setJuego(ju);
           
           cliRepo.guardar(c);
           return "redirect:/cliente/listar";
       }
       
         @RequestMapping(method = RequestMethod.GET, value="/cliente/listar")
         public String listar(Model ml){
             ml.addAttribute("juegos", jueRepo.listar());
             ml.addAttribute("clientes", cliRepo.listar());
             return "cliente/listar";
         }
         
         @RequestMapping(method = RequestMethod.GET, value="/cliente/{id}/eliminar")
         public String listar(@PathVariable int id){
            cliRepo.eliminar(id);
            
            return "redirect:/cliente/listar";
         }
         
         @RequestMapping(method = RequestMethod.GET, value="/cliente/{id}/editar")
         public String form_edit(@PathVariable int id,Model m){
             m.addAttribute("juegos", jueRepo.listar());
             m.addAttribute("cliente", cliRepo.find(id));
             return "cliente/modificar";
         }
         
        @RequestMapping(method = RequestMethod.POST, value="/cliente/{id}/editar")
        public String editar(@RequestParam Map<String,String> parametros,@PathVariable int id){
           Cliente c = cliRepo.find(id);
              
           c.setNombre(parametros.get("nombre"));
           c.setPago(Integer.parseInt(parametros.get("pago")));
           c.setInicio(Integer.parseInt(parametros.get("inicio")));
           c.setTermino(Integer.parseInt(parametros.get("termino")));
           c.setConsola(parametros.get("consola"));
           c.setTelevision(Integer.parseInt(parametros.get("television")));
           int id_juego = Integer.parseInt(parametros.get("juego"));
           Juego ju = jueRepo.find(id_juego);
           
           c.setJuego(ju);
           
           cliRepo.actualizar(c);
           
           return "redirect:/cliente/listar";
              
          }
          
       @RequestMapping(method = RequestMethod.POST, value="/cliente/filtrar")
        public String filtrar(@RequestParam Map<String,String> parametros,Model m){
        Iterator<Map.Entry<String, String>> entryIt = parametros.entrySet().iterator();
          while (entryIt.hasNext()) {
            Map.Entry<String, String> entry = entryIt.next();
	    if (entry.getValue().trim().isEmpty() || entry.getValue().equals("-1")) 
                    entryIt.remove();
          }
          m.addAttribute("clientes", cliRepo.filtrar(parametros));
          m.addAttribute("juegos", jueRepo.listar());
          
          return "cliente/listar";
        }
}
