/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import entidades.Cliente;
import entidades.Pago;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repositorio.ClienteRepo;
import repositorio.PagoRepo;

/**
 *
 * @author Pablo Saez
 */

@Controller
public class PagoController {
    
    @Autowired
    private PagoRepo pagRepo; 
    
    @Autowired
    private ClienteRepo cliRepo; 
    
     @RequestMapping(method = RequestMethod.GET, value="/pago/agregar")
    public String index(Model m){
        m.addAttribute("clientes", cliRepo.listar());
        return "pago/agregar";
    }
    
    
      @RequestMapping(method = RequestMethod.POST, value="/pago/agregar")
      public String add(@RequestParam Map<String,String> parametros){
          Pago p = new Pago();
         
          p.setNuevoPago(Integer.parseInt(parametros.get("nuevoPago")));
          
          int id_cliente = Integer.parseInt(parametros.get("cliente"));
          Cliente cl = cliRepo.find(id_cliente);
          
          p.setCliente(cl);
          
          pagRepo.guardar(p);
          
          return "redirect:/pago/listar";
          
      }
      
      
         @RequestMapping(method = RequestMethod.GET, value="/pago/listar")
         public String listar(Model ml){
             ml.addAttribute("clientes", cliRepo.listar());
             ml.addAttribute("pagos", pagRepo.listar());
             return "pago/listar";
         }
         
        @RequestMapping(method = RequestMethod.GET, value="/pago/{id}/eliminar")
        public String listar(@PathVariable int id)
        {
            pagRepo.eliminar(id);
            
            return "redirect:/pago/listar";
        }
    
}
