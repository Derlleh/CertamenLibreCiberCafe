/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repositorio;

import entidades.Usuario;
import java.util.ArrayList;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Pablo Saez
 */

@Repository
public class UsuarioRepo {
    
    @PersistenceContext
    private EntityManager em;
    
    public Usuario login(String correo, String pass)
    {
        ArrayList<Usuario> usr;
        
         usr = new ArrayList(em.createQuery("SELECT u FROM Usuario u WHERE u.usuario = :correo AND u.pass = :password")
                 .setParameter("correo", correo)
                 .setParameter("password", pass)
                 .setMaxResults(1)
                 .getResultList());
         if(usr.size()>0)
             return usr.get(0);
         return null; 
    }
    
    
}
